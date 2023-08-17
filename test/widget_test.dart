// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';

void main() {
  UserBloc? userBloc;

  setUp(() {
    userBloc = UserBloc();
  });

  tearDown(() {
    userBloc?.close();
  });

  test('initial state is correct', () {
    expect(userBloc?.state, UserInit());
  });
  
  // blocTest("test", build: build);
}
