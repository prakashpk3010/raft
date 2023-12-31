import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raft/config/app_constants.dart';
import 'package:raft/config/app_theme.dart';
import 'package:raft/config/gql_client.dart';
import 'features/auth/screens/splash.dart';
import 'firebase_options.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: AppConstants.appname,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: SplashScreen(title: AppConstants.appname),
      ),
    );
  }
}
