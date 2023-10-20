import 'package:flutter/material.dart';
import 'package:to_do_list_app/pages/todotile.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(seconds: 2), (){});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => ToDoTile(
      title: 'TODOX',
      taskName: "Do",
      taskCompleted: true,
      onChanged: (value) => checkBoxChanged(value),
      deleteFunction: (value) {
        // Implement your delete function logic here
      },
    ),
  ),
);

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100,width: 100,color: Color.fromARGB(255, 177, 224, 245),),
            const Text(
              "TODOX",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

checkBoxChanged(bool? value) {
}

