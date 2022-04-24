import 'package:approval_app/domain/entities/login.dart';
import 'package:approval_app/domain/entities/module.dart';
import 'package:approval_app/presentation/provider/main_notifier.dart';
import 'package:approval_app/presentation/widgets/card_module.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:approval_app/style/theme.dart';
import 'package:approval_app/utils/enum_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<MainNotifier>(context, listen: false).getSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 4;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: priamryColor,
      body: Consumer<MainNotifier>(
        builder: (context, provider, child) {
          if (provider.loginSession != null) {
            List<Company> data =
                provider.loginSession!.data.client?.company ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: defaultMargin * 2),
                  decoration: const BoxDecoration(
                    color: priamryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        "Pilih Cabang",
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: defaultMargin / 1.5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Company>(
                            elevation: 1,
                            isExpanded: true,
                            dropdownColor: Colors.black.withOpacity(0.8),
                            icon: const Padding(
                              padding:
                                  EdgeInsets.only(right: defaultMargin / 3),
                              child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  )),
                            ),
                            value: provider.selectedCompany,
                            hint: Text(
                              "Select Company",
                              style: whiteTextStyle,
                            ),
                            style: whiteTextStyle,
                            items: data.map((e) {
                              return DropdownMenuItem<Company>(
                                child: provider.state == RequestState.loading
                                    ? Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator()),
                                            const SizedBox(
                                              width: defaultMargin / 4,
                                            ),
                                            Text(
                                              "Loading.....",
                                              style: whiteTextStyle,
                                            )
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: defaultMargin / 2),
                                        child: Text(e.name ?? ""),
                                      ),
                                value: e,
                              );
                            }).toList(),
                            onChanged: provider.state == RequestState.loading
                                ? null
                                : (value) {
                                    provider.changeCompany(value!);
                                  },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: defaultMargin),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: provider.state == RequestState.loaded
                        ? GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: (itemWidth / itemHeight),
                            ),
                            itemCount: provider.module.length,
                            itemBuilder: (BuildContext context, int index) {
                              Module data = provider.module[index];
                              return CardModule(
                                module: data,
                                token: provider.loginSession?.data.token ?? "",
                                
                                companyId: provider.selectedCompany?.id ?? 100,
                              );
                            },
                          )
                        : provider.state == RequestState.error
                            ? Text(
                                provider.message,
                                style: primaryTextStyle,
                              )
                            : const SizedBox(),
                  ),
                )
              ],
            );
          } else {
            return const Center(child: Text("data not found"));
          }
        },
      ),
    );
  }
}
