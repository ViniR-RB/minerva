import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _delayed() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.navigate("/home");
  }

  @override
  void initState() {
    _delayed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Minerva"),
      ),
    );
  }
}
