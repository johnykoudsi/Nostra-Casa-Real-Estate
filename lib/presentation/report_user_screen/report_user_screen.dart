import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/get_report_categories/report_categories_bloc.dart';
import 'package:nostra_casa/business_logic/send_report_bloc/send_report_bloc.dart';
import 'package:nostra_casa/data/models/report_categories.dart';
import 'package:nostra_casa/data/models/user_model.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/report_user_screen/widget/dropDown_List_Widget.dart';

import '../../business_logic/send_property_bloc/send_property_bloc.dart';
import '../../utility/app_style.dart';
import '../global_widgets/custom_text_field.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../global_widgets/shimmer.dart';

class ReportUserScreen extends StatefulWidget {
  ReportUserScreen({required this.userInfo, Key? key}) : super(key: key);
  UserInfo userInfo;

  @override
  State<ReportUserScreen> createState() => _ReportUserScreenState();
}

class _ReportUserScreenState extends State<ReportUserScreen> {
  TextEditingController reportRequestController = TextEditingController();
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  ReportCategory? reportCategory;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<SendReportBloc, SendReportState>(
      listener: (context, state) {
        if (state is SendReportStatues) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
            helperResponse: state.response,
            showServerError: true
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Report ${widget.userInfo.name}"),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.038),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                CustomTextField(
                  hintText: "whats wrong with ${widget.userInfo.name}".tr(),
                  passwordBool: false,
                  label: "Report Reason".tr(),
                  controller: reportRequestController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Reason can not be empty".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Text("Why do you want to report :",
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 6,
                ),
                BlocBuilder<ReportCategoriesBloc, ReportCategoriesState>(
                  builder: (context, state) {
                    if (state is ReportCategoryDoneState) {
                      return DropDownListWidget(
                        value: reportCategory,
                        hint: 'Report Reason',
                        dropDownValues: state.reportCategory,
                        onChanged: (value) {
                          setState(() {
                            reportCategory = value as ReportCategory;
                          });
                        },
                      );
                    }
                    return ShimmerLoader(
                      height: 50,
                      border: AppStyle.k4RadiusLowerPadding,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: BlocBuilder<SendReportBloc, SendReportState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButtonWidget(
                    title: "Report",
                    isLoading: state is SendReportLoading,
                    onPressed: reportCategory != null &&
                            reportRequestController.text.isNotEmpty
                        ? () {
                            context.read<SendReportBloc>().add(
                                SendReportRequest(
                                    reportCategory: reportCategory!,
                                    reason: reportRequestController.text,
                                    userId: widget.userInfo.id));
                          }
                        : null,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
