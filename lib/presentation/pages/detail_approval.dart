import 'package:approval_app/presentation/provider/detail_approval_notifier.dart';
import 'package:approval_app/presentation/widgets/button_widget.dart';
import 'package:approval_app/presentation/widgets/error_widget.dart';
import 'package:approval_app/utils/enum_state.dart';
import 'package:approval_app/utils/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../style/font_style.dart';
import '../../style/theme.dart';

class DetailApprovalPage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/detail-approval-page';
  final Map<String, dynamic> data;
  const DetailApprovalPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailApprovalPage> createState() => _DetailApprovalPageState();
}

class _DetailApprovalPageState extends State<DetailApprovalPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<DetailApprovalNotfier>(context, listen: false)
          .fetchDetailApproval(
        widget.data["companyId"],
        widget.data["moduleName"],
        widget.data["token"],
        widget.data["id"],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Detail Approval",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            color: priamryColor,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<DetailApprovalNotfier>(
          builder: (context, provider, child) {
            if (provider.state == RequestState.loaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  children: [
                    Html(
                      data: provider.detailApproval.html,
                    ),
                    const SizedBox(
                      height: defaultMargin,
                    ),
                    provider.detailApproval.approval != null
                        ? Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  buttonName: "Approve",
                                  width: double.infinity,
                                  height: 45,
                                  onPressed: () async {
                                    await provider.addApproval(
                                        widget.data["companyId"],
                                        widget.data["moduleName"],
                                        widget.data["token"],
                                        widget.data["id"],
                                        provider.detailApproval.approval?.dialog
                                                ?.approve?.text?.toLowerCase() ??
                                            "",
                                        "test");
                                    if (provider.stateSave == RequestState.loaded) {
                                      await provider.fetchDetailApproval(
                                          widget.data["companyId"],
                                          widget.data["moduleName"],
                                          widget.data["token"],
                                          widget.data["id"]);
                                      await CustomFlushbar().showFlushbar(
                                          context,
                                          "Berhasil",
                                          "data berhasil disimpan",
                                          true);
                                    } else {
                                      await CustomFlushbar().showFlushbar(
                                          context,
                                          "Gagal",
                                          "data gagal disimpan",
                                          false);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: defaultMargin / 2,
                              ),
                              Expanded(
                                child: ButtonWidget(
                                  buttonName: "Reject",
                                  width: double.infinity,
                                  height: 45,
                                  onPressed: () async {
                                    await provider.addApproval(
                                        widget.data["companyId"],
                                        widget.data["moduleName"],
                                        widget.data["token"],
                                        widget.data["id"],
                                        provider.detailApproval.approval?.dialog
                                                ?.reject?.text?.toLowerCase() ??
                                            "",
                                        "test");
                                    if (provider.stateSave == RequestState.loaded) {
                                      await provider.fetchDetailApproval(
                                          widget.data["companyId"],
                                          widget.data["moduleName"],
                                          widget.data["token"],
                                          widget.data["id"]);
                                      await CustomFlushbar().showFlushbar(
                                          context,
                                          "Berhasil",
                                          "data berhasil disimpan",
                                          true);
                                    } else {
                                      await CustomFlushbar().showFlushbar(
                                          context,
                                          "Gagal",
                                          "data gagal disimpan",
                                          false);
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        : provider.detailApproval.recall != null
                            ? ButtonWidget(
                                buttonName: "Recall",
                                width: double.infinity,
                                height: 45,
                                onPressed: () async {
                                  await provider.addApproval(
                                      widget.data["companyId"],
                                      widget.data["moduleName"],
                                      widget.data["token"],
                                      widget.data["id"],
                                      provider.detailApproval.recall?.dialog
                                              ?.text?.toLowerCase() ??
                                          "",
                                      "test");
                                  if (provider.stateSave == RequestState.loaded) {
                                    await provider.fetchDetailApproval(
                                        widget.data["companyId"],
                                        widget.data["moduleName"],
                                        widget.data["token"],
                                        widget.data["id"]);
                                    await CustomFlushbar().showFlushbar(
                                        context,
                                        "Berhasil",
                                        "data berhasil diperbaharui",
                                        true);
                                  } else {
                                    await CustomFlushbar().showFlushbar(context,
                                        "Gagal", "data gagal disimpan", false);
                                  }
                                },
                              )
                            : const SizedBox(),
                  ],
                ),
              );
            } else if (provider.state == RequestState.error) {
              return CustomErrorWidget(
                  errorMessage: provider.message,
                  onPressed: () {
                    provider.fetchDetailApproval(1, "module", "token", 1);
                  },
                  width: double.infinity / 2);
            } else if (provider.state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
