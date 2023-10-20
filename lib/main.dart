import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/pages/homepage.dart';
//import 'package:to_do_list_app/pages/splash.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  //initialise the hive
  await Hive.initFlutter();
  await Hive.openBox("Mybox");
 // var box = await Hive.openBox("Mybox");
  //open abox

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AnimatedSplashScreen(
        splash: Icons.home,
        duration: 2000,
        splashTransition: SplashTransition.scaleTransition,
        //pageTransitionType: PageTransitionType.scale,
        backgroundColor: Color.fromARGB(255, 184, 208, 237),
        
      //   Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(height: 100,width: 100,color: Colors.blue,),
      //       const Text(
      //         "TODOX",
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 48,
                
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      nextScreen: const Homepage(title: 'TODOX'),
       ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
