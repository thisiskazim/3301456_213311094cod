import 'package:flutter/material.dart';
import 'package:pertys_pro/Bilgisayarlar/secondPC.dart';
import 'package:pertys_pro/Telefonlar/secondTLP.dart';
import 'package:pertys_pro/Telefonlar/thirdTLP.dart';
import 'Bilgisayarlar/PCdata.dart';
import 'Bilgisayarlar/secondPC.dart';
import 'Bilgisayarlar/thirdPC.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

String _title = "PertyPro";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 6, 125, 121),
        title: Text('PertysPro',
            style: GoogleFonts.sedgwickAve(
              fontSize: 35,
              fontStyle: FontStyle.italic,
            )),
      ),
      body: Apps(),
    );
  }
}

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/arkaplan.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          newButon(context, "Telefonlar", const SecondPage(),
              Icons.phone_android_outlined),
          SizedBox(
            height: 10,
          ),
          newButon(context, "Bilgisayarlar", const SecondPagePC(),
              Icons.computer_outlined),
        ],
      ),
    );
  }
}

Widget newButon(
    BuildContext context,String name ,dynamic go, IconData iconlar) {
  return Center(
    child: ElevatedButton.icon(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) => go)),
      icon: Icon(iconlar),
      label: Text(
        name,
        style: GoogleFonts.sedgwickAve(
          fontSize: 15,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Colors.black),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(width: 2, color: Colors.blue),
        ),
      ),
    ),
  );
}

