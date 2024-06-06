import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

final currentDate = Provider<DateTime>(
  (ref) => DateTime.now(),
);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks Riverpod'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(date.toIso8601String()),
      ),
    );
  }
}
