import 'package:approval_app/presentation/provider/approval_notifier.dart';
import 'package:approval_app/presentation/widgets/approval_list_widget.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:approval_app/style/theme.dart';
import 'package:approval_app/utils/enum_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApprovalPage extends StatefulWidget {
  static const ROUTE_NAME = '/approval-page';

  final Map<String, dynamic> data;

  const ApprovalPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ApprovalNotfier>(context, listen: false).getApproval(
        widget.data["companyId"],
        widget.data["moduleName"] ?? "",
        widget.data["token"],
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
          widget.data["modulName"] ?? "-",
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
      body: Consumer<ApprovalNotfier>(builder: (context, provider, child) {
        if (provider.state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.state == RequestState.loaded) {
          return ListView.builder(
              itemCount: provider.approval.length,
              itemBuilder: (context, index) {
                final approval = provider.approval[index];
                return ApprovalListWidget(
                  approval: approval,
                  token: widget.data["token"],
                  companyId: widget.data["companyId"],
                  module: widget.data["moduleName"] ?? "-", 
                );
              });
        } else if (provider.state == RequestState.error) {
          return Center(
            child: Text(provider.message),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
