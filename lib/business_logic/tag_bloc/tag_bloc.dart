import 'package:bloc/bloc.dart';
import '../../data/models/tags_model.dart';
import '../../data/services/tag_service.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/network_helper.dart';
part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  TagBloc() : super(TagInitial()) {
   TagService tagService = TagService();

    on<GetTagApiEvent>((event, emit) async {
      final currentState = state;
      if (currentState is TagLoadedState && currentState.hasReachedMax) {
        return;
      }

      int getPage() {
        if (currentState is TagLoadedState) {
          return currentState.tags.length ~/ kProductsGetLimit + 1;
        }
        return 0;
      }

      var getTag;

      event.searchFilterProperties.page = getPage();

      getTag = await tagService.getTagService(
        event: event,
      );

      if (getTag is List<Tag>) {
        if (getTag.isNotEmpty) {
          // copy previous state
          if (currentState is TagLoadedState) {
            emit(currentState.copyWith(
                tags: List.of(currentState.tags)..addAll(getTag),
                hasReachedMax:
                getTag.length < kProductsGetLimit ? true : false));
          }

          // add loaded state
          else {
            emit(TagLoadedState(
              tags: getTag,
              hasReachedMax:
              getTag.length < kProductsGetLimit ? true : false,
            ));
          }
        } else {
          // done loading
          if (currentState is TagLoadedState) {
            emit(currentState.copyWith(hasReachedMax: true));
          }
          // done but nothing is there
          else {
            emit(TagLoadedState(
              tags: getTag,
              hasReachedMax: true,
            ));
          }
        }
      } else {
        print("Server ${(getTag as HelperResponse).response}");

        emit(TagErrorState(helperResponse: getTag));
      }
    });

    on<ChangeToLoadingTagApiEvent>((event, emit) async {
      emit(TagInitial());

      add(GetTagApiEvent(
          searchFilterProperties: TagsSearchFilter(page: 1)));
    });
  }
}
