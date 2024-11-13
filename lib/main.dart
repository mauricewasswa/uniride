import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniride/ui/onboarding.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://oxwkbqkzqftsrmecggxn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im94d2ticWt6cWZ0c3JtZWNnZ3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEzMzg0MDQsImV4cCI6MjA0NjkxNDQwNH0.pgDco8rZ-aIaz15YDvJa-k4a6JZPH492JNrJZsHLzn4',
  );

  runApp(MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPage1(),
    );
  }
}
