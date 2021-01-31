import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teahouse/loginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/register': (context) => RegisterPage(),
      //   '/home': (context) => HomePage(),
      //   '/orderPage': (context) => OrderpageScreen(),
      //   '/pendingOrder': (context) => PendingOrder(),
      //   '/detailOrderPage': (context) => MyorderDetailPage(),
      //   '/detailOrderPage1': (context) => MyorderDetailPage1(),
      // },
      home: LoginPage(),
    );
  }
}
