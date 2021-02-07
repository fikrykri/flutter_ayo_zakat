import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/Model/history.dart';
import 'package:flutter_ayo_zakat/Widgets/make_input_button.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProsesZakat extends StatefulWidget {
  final History history;
  final String id;

  ProsesZakat({@required this.history, this.id});
  @override
  _ProsesZakatState createState() => _ProsesZakatState();
}

class _ProsesZakatState extends State<ProsesZakat> {
  TextEditingController incomeController = TextEditingController();
  TextEditingController zakatController = TextEditingController();
  File image;

  @override
  void initState() {
    incomeController = TextEditingController();
    zakatController = TextEditingController();
    incomeController.text = '';
    zakatController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.history != null) {
      zakatController.text = widget.history.nominal.toString();
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
                    "Form Zakat Profesi",
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
                      label: "Penghasilan perbulan",
                      controller: incomeController,
                      onChanged: (value) {
                        wajibZakat();
                      },
                      keyboardType: TextInputType.number)),
              MyAnimation(
                  1.3,
                  makeInput(
                      label: "Wajib Zakat",
                      controller: zakatController,
                      readOnly: true,
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
                    height: 59,
                    onPressed: () {
                      getImage(context);
                    },
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Upload Bukti Zakat",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
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
                    onPressed: () async {
                      String randomMillis = ('ZP-') +
                          DateTime.now().millisecondsSinceEpoch.toString();
                      History history = History(
                        id: widget.history != null
                            ? widget.history.id
                            : randomMillis,
                        name: 'zakat profesi',
                        image: image != null
                            ? widget.history != null
                                ? await uploadFile(image, widget.id)
                                : await uploadFile(image, randomMillis)
                            : '',
                        nominal: double.parse(zakatController.text),
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
                      "Bayar Sekarang",
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

  wajibZakat() {
    final income = int.parse(incomeController.text);
    final percen = 2.5;
    final fullPercen = 100;
    zakatController.text = (percen * income / fullPercen).toString();
  }

  imgFromCamera() async {
    PickedFile imgCamera = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      image = File(imgCamera.path);
    });
  }

  imgFromGallery() async {
    PickedFile imgGallery = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      image = File(imgGallery.path);
    });
  }

  getImage(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> uploadFile(File image, String filename) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("bukti-pembayaran/" + filename);
    UploadTask uploadTask = ref.putFile(image);
    return uploadTask.then((res) async {
      return await res.ref.getDownloadURL();
    });
  }
}
