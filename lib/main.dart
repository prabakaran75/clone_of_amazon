import 'package:clone_of_amazon/common/widgets/bottom_bar.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/admin/screens/admin_screen.dart';
import 'package:clone_of_amazon/features/auth/screens/auth_screen.dart';
import 'package:clone_of_amazon/features/auth/services/auth_service.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:clone_of_amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      authService.getData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(
          surface: GlobalVariables.secondaryColor,
          primary: GlobalVariables.backgroundColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? (Provider.of<UserProvider>(context).user.type == 'user'
              ? BottomBar()
              : AdminScreen())
          : AuthScreen(),
    );
  }
}
