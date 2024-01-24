import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'contactview.dart';

class contacts extends StatefulWidget {
  contacts({super.key});

  @override
  State<contacts> createState() => _mainhomeState();
}

class _mainhomeState extends State<contacts> {
  List products = [];
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  String? img;

  Future<void> setData() async {
    try {
      Map<String, dynamic> data = {
        "name": usercontroller.text,
        "number": passcontroller.text,
        "imageUrl": img
      };
      var ref = await FirebaseFirestore.instance
          .collection('contactsinformation')
          .add(data);

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Number saved "),
          // content: const Text("You have raised a Alert Dialog Box"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                usercontroller.clear();
                passcontroller.clear();
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text("okay"),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      print("error : $e");
    }
  }

  // File? image;
  // FirebaseStorage storage = FirebaseStorage.instance;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink,
            child: Icon(Icons.add)),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Add Contacts"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return contactview();
                  }),
                );
              },
              child: Text("Back"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1703210466493-994109aec84f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8fA%3D%3D',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              img == null
                  ? CircularProgressIndicator()
                  : Image.network(
                img!,
                height: 200,
                width: 200,
              ),
              TextField(
                controller: usercontroller,
                decoration: InputDecoration(
                  labelText: 'Enter your Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter your Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setData();
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.aladin(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                ),
              ),
              img == null ? CircularProgressIndicator() : Image.network(img!),

              ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                    await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                    referenceRoot.child('images');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                    referenceDirImages.child(uniqueFileName + ".png");

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(file.path));
                      //Success: get the download URL
                      var imageUrl =
                      await referenceImageToUpload.getDownloadURL();

                      print(imageUrl);
                      setState(() {
                        img = imageUrl;
                      });
                    } catch (error) {
                      //Some error occurred
                    }
                  },
                  child: Text("press"))
              // ElevatedButton(
              //     onPressed: () {
              //       pickImage();
              //     },
              //     child: Text('Pick Image')),
              // ElevatedButton(
              //   onPressed: () async {
              //     // Create a reference to the location you want to upload to in Firebase
              //     var reference =
              //         storage.ref().child("profileImages/image1.png");
              //
              //     // Upload the file to Firebase
              //     var uploadTask = reference.putFile(image!);
              //
              //     // Wait until the file is uploaded, then store the download URL
              //     var taskSnapshot = await uploadTask.whenComplete(() => null);
              //
              //     // Get the download URL
              //     String url = await taskSnapshot.ref.getDownloadURL();
              //   },
              //   child: Text('send Image'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
