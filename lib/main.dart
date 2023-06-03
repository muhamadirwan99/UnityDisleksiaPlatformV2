import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/db/database_informasi_helper.dart';
import 'package:udp_v2/db/database_video_helper.dart';
import 'package:udp_v2/provider/video_database_provider.dart';

import 'provider/informasi_database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              VideoDatabaseProvider(databaseHelper: DatabaseVideoHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) => InformasiDatabaseProvider(
              databaseHelper: DatabaseInformasiHelper()),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
