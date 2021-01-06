import 'package:flutter/material.dart';
import 'package:working_test/model/biodata_class.dart';

class ContainerDecoration extends StatelessWidget {
  // final Function functions;
  // final Color colors;
  // final String title;
  // final String imageLogo;
  final Biodata biodata;

  const ContainerDecoration(this.biodata);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: biodata.functions,
        child: Container(
          margin: EdgeInsets.only(top: biodata.functions == null ? 0 : 16),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.transparent.withOpacity(0.2),
                    blurRadius: 2.0,
                    spreadRadius: 3.0,
                    offset: Offset(
                      6.0,
                      5.0,
                    ))
              ],
              color: biodata.colors,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 7, color: Colors.white60)),
          child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 16, left: 10, right: 10, top: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  biodata.functions == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                              height: 35,
                              child: Image.asset(biodata.imageLogo, scale: 3)),
                        ),
                  Text(biodata.title,
                      style: TextStyle(
                          fontFamily: "PoppinsRegular", fontSize: 12)),
                ],
              )),
        ));
  }
}

// Text(title, style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 15))
