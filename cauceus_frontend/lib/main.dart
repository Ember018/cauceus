import 'package:flutter/material.dart';
import 'package:cauceus_frontend/presentation/features/auth/view/login_screen.dart';
import 'package:cauceus_frontend/presentation/features/auth/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cauceus',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: const LoginScreen(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cauceus', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal,
        ),
        body: const Center(child: Text('Homepage placeholder')));
  }
}
