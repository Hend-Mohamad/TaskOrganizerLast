import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/firebase_notifications.dart';
import 'package:task_app/firebase_options.dart';
import 'package:task_app/views/splach_screen.dart';
import 'package:task_app/widget/notifcation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotifications().initNotifications();
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.grey.shade900, // Set primary dark color
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/notifications':(context) => const NotifcationScreen(),
        },
      ),
    );
  }
}
