import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/Model/history.dart';
import 'package:flutter_ayo_zakat/Widgets/make_input_button.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';

class ProsesDonasi extends StatefulWidget {
  final History history;
  final String id;

  ProsesDonasi({@required this.history, this.id});
  @override
  _ProsesDonasiState createState() => _ProsesDonasiState();
}

class _ProsesDonasiState extends State<ProsesDonasi> {
  TextEditingController nominalController = TextEditingController();

  @override
  void initState() {
    nominalController = TextEditingController();
    nominalController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.history != null) {
      nominalController.text = widget.history.nominal.toString();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: MyAnimation(
                  1,
                  Text(
                    "Form Donasi",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MyAnimation(
                  1.2,
                  makeInput(
                      label: "Nominal Donasi",
                      controller: nominalController,
                      keyboardType: TextInputType.number)),
              MyAnimation(
                1.4,
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      String randomMillis = ('D-') +
                          DateTime.now().millisecondsSinceEpoch.toString();
                      History history = History(
                        id: widget.history != null
                            ? widget.history.id
                            : randomMillis,
                        name: 'Donasi',
                        image: '',
                        // image != null
                        //     ? widget.history != null
                        //         ? await uploadFile(image, widget.id)
                        //         : await uploadFile(image, randomMillis)
                        //     : '',
                        nominal: double.parse(nominalController.text),
                        status: '',
                      );
                      if (widget.history == null) {
                        FirebaseFirestore.instance
                            .collection('history')
                            .doc(randomMillis)
                            .set(history.toJson());
                      } else {
                        FirebaseFirestore.instance
                            .collection('history')
                            .doc(widget.id)
                            .update(history.toJson());
                      }
                      Navigator.pop(context);
                    },
                    color: Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Donasi Sekarang",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
