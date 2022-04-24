import 'package:approval_app/presentation/pages/approval_page.dart';
import 'package:approval_app/presentation/pages/detail_approval.dart';
import 'package:approval_app/presentation/pages/homepage.dart';
import 'package:approval_app/presentation/pages/login_page.dart';
import 'package:approval_app/presentation/provider/approval_notifier.dart';
import 'package:approval_app/presentation/provider/detail_approval_notifier.dart';
import 'package:approval_app/presentation/provider/login_notifier.dart';
import 'package:approval_app/presentation/provider/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<LoginNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<MainNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<ApprovalNotfier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<DetailApprovalNotfier>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/login-page':
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case ApprovalPage.ROUTE_NAME:
              final data = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => ApprovalPage(data: data));
            case DetailApprovalPage.ROUTE_NAME:
              final data = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => DetailApprovalPage(data: data));
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
