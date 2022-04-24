import 'package:approval_app/domain/entities/approval.dart';
import 'package:approval_app/presentation/pages/detail_approval.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class ApprovalListWidget extends StatelessWidget {
  final Approval approval;
  final String token;
  final String module;
  final int companyId;
  const ApprovalListWidget({Key? key, required this.approval,required this.token,required this.module,required this.companyId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.pushNamed(
            context,
            DetailApprovalPage.ROUTE_NAME,
            arguments: {
              "moduleName": module,
              "companyId" : companyId,
              "token": token,
              "id" : approval.id
            },
          );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin / 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  approval.title ?? "",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                      color: approval.bagde?.color?.toColor(),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    approval.bagde?.text ?? "",
                    style: whiteTextStyle,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: defaultMargin / 4,
            ),
            Text(
              approval.date ?? "",
              style: primaryTextStyle.copyWith(
                fontWeight: light,
                fontSize: 12
              ),
            ),
            const SizedBox(
              height: defaultMargin / 2,
            ),
            Text(
              approval.footer ?? "",
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
