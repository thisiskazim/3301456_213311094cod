import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pertys_pro/Telefonlar/thirdTLP.dart';
import 'package:pertys_pro/main.dart';
import 'package:pertys_pro/Telefonlar/TLPdata.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            "Telefonlar",
            style: GoogleFonts.sedgwickAve(
              fontSize: 35,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: const TelephoneBody(),
      ),
    );
  }
}

class TelephoneBody extends StatefulWidget {
  const TelephoneBody({super.key});

  @override
  State<TelephoneBody> createState() => _TelephoneBodyState();
}

class _TelephoneBodyState extends State<TelephoneBody> {
  List<String> brands = [
    "Samsung Galaxy M14",
    "Samsung GalaXy A54",
    "Samsung Galaxy S23",
    "Nokia 7",
    "Nokia 8",
    "Nokia 8.1",
    "Nokia 9",
    "Iphone 7",
    "Iphone 8",
    "Iphone 10",
    "Iphone 11",
    "Iphone 14",
    "Xiaomi Redmi 9",
    "Xiaomi Redmi 9s",
    "Xiaomi Redmi 10S",
    "Xiaomi Redmi Note 11",
  ];

  Propertys propertys = Propertys();

  List<String> filteredBrands = [];

  @override
  void initState() {
    filteredBrands = List.from(brands);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              onChanged: (value) {
                setState(
                  () {
                    filteredBrands = brands
                        .where(
                          (brand) => brand.toLowerCase().contains(value),
                        )
                        .toList();
                  },
                );
              },
              decoration: InputDecoration(
                prefix: const Icon(Icons.search),
                hintText: "Arama Yap...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.separated(
              itemCount: filteredBrands.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  ),
                  title: Text(
                    filteredBrands[index],
                    style: TextStyle(),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPageDatas(
                          brandName: filteredBrands[index],
                          propertysBatary: propertys.propertysBatary[index],
                          propertysCamera: propertys.propertysCamera[index],
                          propertysScreen: propertys.propertysScreen[index],
                          propertysStock: propertys.propertysStock[index],
                          propertysSystem: propertys.propertysSystem[index],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 0,
                  thickness: 3,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
