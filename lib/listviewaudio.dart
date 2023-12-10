import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'PlayAudio.dart';


class ListViewRecord extends StatefulWidget {
  const ListViewRecord({super.key});

  @override
  State<ListViewRecord> createState() => _ListViewRecordState();
}

class _ListViewRecordState extends State<ListViewRecord> {
  bool x = false;
  late Directory appDirectory;
  List<String> records = [];



  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        if (onData.path.contains('.aac')) records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      DecoratedBox(
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/background/berana.png"), fit: BoxFit.cover),
      ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
               Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: DefaultTextStyle(
                    style: TextStyle(fontSize: 27, color: Colors.brown.shade900, fontFamily: 'Dire_Dawa',fontWeight: FontWeight.bold),
                    child: Text('Records')),
              ),
          
          
              if (records.isEmpty)
               Padding(
                  padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
                  child: Center(
                    child: DefaultTextStyle(
                        style: TextStyle(fontSize: 23, color: Colors.brown.shade900, fontFamily: 'Dire_Dawa', fontWeight: FontWeight.bold),
                        child: Center(child: Text('No records yet'))),
                  ),
                )
          
              else
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: records.length,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        width: 700,
                        height: 80,
              
                        //check(widget.records.elementAt(widget.index));
              
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(35, 5, 0, 5),
                              child: DefaultTextStyle(
                                  style:TextStyle(fontFamily: 'Dire_Dawa',
                                      fontSize: 24, color: Colors.brown.shade900, fontWeight: FontWeight.bold),
                                  child:
                                      Text('New recoding ${records.length - i}')),
                                    //  Text(records.elementAt(i)))
                                      
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(35, 2, 0, 0),
                              child: DefaultTextStyle(
                                style: TextStyle(fontSize: 20, color: Colors.brown.shade800, fontFamily: 'Dire_Dawa',fontWeight: FontWeight.bold),
                                child: Text(_getDateFromFilePatah(
                                   filePath: records.elementAt(i))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              showCustomDialog(context, i,records),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      );
    
  }
}

String _getDateFromFilePatah({required String filePath}) {
  String fromEpoch = filePath.substring(
      filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));

  DateTime recordedDate =
      DateTime.fromMillisecondsSinceEpoch(int.parse(fromEpoch));
  int year = recordedDate.year;
  int month = recordedDate.month;
  int day = recordedDate.day;

  return ('$year-$month-$day');
}
