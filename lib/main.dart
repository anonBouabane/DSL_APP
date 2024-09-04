import 'package:dslsale/Routehelper/route_helper.dart';
import 'package:dslsale/data/controller/auth_controller.dart';
import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/message/message.dart';
import 'package:dslsale/view/splashsScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>AuthController()),
    ChangeNotifierProvider(create: (_)=>Data())

  ],child:const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: RouteHelper.generateRoute,
      theme: ThemeData(fontFamily: "phetsarath_ot.ttf"),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      scaffoldMessengerKey: MessageHelper.key,
      
    );
  }
}
