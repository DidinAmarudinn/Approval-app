import 'package:approval_app/domain/entities/module.dart';
import 'package:approval_app/presentation/pages/approval_page.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class CardModule extends StatelessWidget {
  final Module module;
  final int companyId;
  final String token;
  const CardModule({Key? key, required this.module,required this.companyId,required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            ApprovalPage.ROUTE_NAME,
            arguments: {
              "modulName": module.module,
              "companyId" : companyId,
              "token": token
            },
          );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7090B0).withOpacity(0.1),
              offset: const Offset(0, 20),
              blurRadius: 27,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              module.module ?? "",
              style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Waiting",
                  style:
                      primaryTextStyle.copyWith(fontWeight: light, fontSize: 12),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: module.bagde?.waiting?.color?.toColor()),
                  child: Text(
                    module.bagde?.waiting?.text.toString() ?? "0",
                    style: whiteTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",
                  style:
                      primaryTextStyle.copyWith(fontWeight: light, fontSize: 12),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: module.bagde?.today?.color?.toColor()),
                  child: Text(
                    module.bagde?.today?.text.toString() ?? "0",
                    style: whiteTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Overdue",
                  style:
                      primaryTextStyle.copyWith(fontWeight: light, fontSize: 12),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: module.bagde?.overdue?.color?.toColor()),
                  child: Text(
                    module.bagde?.overdue?.text.toString() ?? "0",
                    style: whiteTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
