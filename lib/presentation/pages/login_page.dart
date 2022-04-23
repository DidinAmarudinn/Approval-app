import 'package:approval_app/presentation/pages/homepage.dart';
import 'package:approval_app/presentation/provider/login_notifier.dart';
import 'package:approval_app/presentation/widgets/button_loading_widget.dart';
import 'package:approval_app/presentation/widgets/button_widget.dart';
import 'package:approval_app/presentation/widgets/text_form_field_widget.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:approval_app/utils/enum_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controllerClient = TextEditingController(text: null);
  final TextEditingController controllerEmail = TextEditingController(text: null);
  final TextEditingController controllerPassword = TextEditingController(text: null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFieldWidget(
                  label: "Client",
                  controller: controllerClient,
                  validationErrorText: "Please insert client id",
                  placholder: "Masukan Client ID",
                ),
                const SizedBox(
                  height: defaultMargin / 2,
                ),
                TextFormFieldWidget(
                  label: "Email",
                  controller: controllerEmail,
                  validationErrorText: "Please insert email",
                  placholder: "Masukan Email",
                ),
                const SizedBox(
                  height: defaultMargin / 2,
                ),
                TextFormFieldWidget(
                  label: "Password",
                  controller: controllerPassword,
                  validationErrorText: "Please insert password",
                  placholder: "Masukan Password",
                ),
                const SizedBox(
                  height: defaultMargin,
                ),
                Consumer<LoginNotifier>(builder: (context, provider, child) {
                  if (provider.state == RequestState.loading) {
                    return const LoadingButton();
                  } else {
                    return ButtonWidget(
                        buttonName: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await provider.login(controllerEmail.text,
                                controllerPassword.text, controllerClient.text);
                            if (provider.state == RequestState.loaded) {
                              Navigator.pushReplacementNamed(
                                context,
                                HomePage.ROUTE_NAME,
                              );
                            }
                          }
                        },
                        height: 45,
                        width: double.infinity);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
