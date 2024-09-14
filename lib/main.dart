import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/providers/image_providers.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/router/configure_router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ImageProviderModel()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
