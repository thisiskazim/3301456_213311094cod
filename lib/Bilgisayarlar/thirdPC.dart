import 'package:flutter/material.dart';
import 'PCdata.dart';
import 'secondPC.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdPagePCDatas extends StatefulWidget {
  final String brandName;
  final String propertysBatary;
  final String propertysCamera;
  final String propertysScreen;
  final String propertysSystem;
  final String propertysStock;

  ThirdPagePCDatas(
      {super.key,
      required this.brandName,
      required this.propertysBatary,
      required this.propertysCamera,
      required this.propertysScreen,
      required this.propertysSystem,
      required this.propertysStock});

  @override
  State<ThirdPagePCDatas> createState() => _ThirdPagePCDatasState();
}

class _ThirdPagePCDatasState extends State<ThirdPagePCDatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 27, 27, 24),
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.brandName,
          style: GoogleFonts.sedgwickAve(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      backgroundColor: Colors.black54,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bilgimage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 15, 100, 15),
              height: 100,
              width: 250,
              alignment: Alignment.center,
              child: Text(
                widget.propertysBatary,
                style: TextStyle(),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.yellowAccent,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(200, 15, 15, 15),
              height: 100,
              width: 250,
              alignment: Alignment.center,
              child: Text(widget.propertysCamera),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.teal),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 15, 100, 15),
              height: 100,
              width: 250,
              alignment: Alignment.center,
              child: Text(widget.propertysScreen),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.pink),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(200, 15, 15, 15),
              height: 100,
              width: 250,
              alignment: Alignment.center,
              child: Text(widget.propertysStock),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.brown),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 15, 100, 15),
              height: 100,
              width: 250,
              alignment: Alignment.center,
              child: Text(widget.propertysSystem),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.lightGreenAccent),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
