import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pertys_pro/Bilgisayarlar/thirdPC.dart';

import 'package:pertys_pro/main.dart';
import 'PCdata.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPagePC extends StatefulWidget {
  const SecondPagePC({super.key});

  @override
  State<SecondPagePC> createState() => _SecondPagePCState();
}

class _SecondPagePCState extends State<SecondPagePC> {
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
              color: Colors.brown,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Bilgisayarlar",
            style: GoogleFonts.sedgwickAve(
              fontSize: 35,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: const PcBody(),
      ),
    );
  }
}

class PcBody extends StatefulWidget {
  const PcBody({super.key});

  @override
  State<PcBody> createState() => _PcBodyState();
}

class _PcBodyState extends State<PcBody> {
  List<String> brands = [
    "MacBook Air",
    "iMac Pro",
    "MacBook Pro",
    "iMac",
    "Pavilion",
    "Omen",
    "ProBook",
    "EliteBook",
    "Spectre",
    "Abra A5",
    "Tulpar T9",
    "Tulpar T5",
    "Tulpar T7",
    "Lenovo IdeaPad",
    "Lenovo Yoga",
    "Lenovo TouchPad",
  ];

  PropertysPc propertys = PropertysPc();

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
                        builder: (context) => ThirdPagePCDatas(
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
