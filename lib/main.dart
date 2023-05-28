import 'package:udp_v2/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unity Disleksia Platform',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        primaryColor: blue500,
        appBarTheme: AppBarTheme(
          backgroundColor: blue500,
          titleTextStyle: titleMedium,
          elevation: 0,
        ),
      ),
      home: const InitialPageView(),
    );
  }
}
