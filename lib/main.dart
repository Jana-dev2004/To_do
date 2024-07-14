import 'package:flutter/material.dart';
import 'homepage.dart';
void main()
{
  return runApp(App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Homepage(),
    );
  }
}