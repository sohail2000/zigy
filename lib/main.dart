import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zigy/notifiers/users_notifier.dart';
import 'package:zigy/notifiers/users_post_notifier.dart';
import 'package:zigy/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserNotifier()),
        ChangeNotifierProvider(create: (_) => UserPostNotifier()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home()),
    );
  }
}
