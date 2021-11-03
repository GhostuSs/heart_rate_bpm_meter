import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data.dart';
import 'data/history.dart';
import 'data/ui-settings/colors_palette.dart';

bool seen=false;
bool subscribe=false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  await prefs.setBool("seen", true);
  seen=false;
  subscribe = prefs.getBool("subscribe") ?? false;
  runApp(const App());
}

class App extends StatefulWidget{
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App>{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Data>(create: (_) => Data(measurePoints: [])),
          Provider<HistoryList>(create: (_) => HistoryList()),
        ],
        child: MaterialApp(
            color: kWhite,
            debugShowCheckedModeBanner: false,
            initialRoute: seen ? '/' : "/onboarding" ,
            routes: routes
        ));
  }

}