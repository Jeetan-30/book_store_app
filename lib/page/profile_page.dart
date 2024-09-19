import 'dart:io';
import 'package:bookstore/Constant/constant_file.dart';
import 'package:bookstore/data/user_data.dart';
import 'package:bookstore/manager/manage_state.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select an option',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _imageFromCamera();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera_alt),
                    tooltip: 'Take a photo',
                  ),
                  IconButton(
                    onPressed: () {
                      _imageFromGallery();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.image),
                    tooltip: 'Choose from gallery',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _imageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<void> _imageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
  }
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Profile",style: myStyle(30,Colors.white),),
        centerTitle: true,
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _){
          return  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                            children:[ GestureDetector(
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: _image != null
                                    ? FileImage(_image!)
                                    : AssetImage('assets/images/book logo.jpg'),
                              ),
                            ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: _pickImage,
                                  child: Container(
                                    width: 40,height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(100)),
                                    child: Icon(Icons.linked_camera_outlined,color: Colors.white,),
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),
                      Gap(10),
                      Text(
                        '${userdata[0].name}',
                        style: myStyle(25,Colors.black,FontWeight.bold),
                      ),
                      Gap(10),
                      Divider(),
                      Gap(10),
                      Row(
                        children: [
                          Icon(Icons.email_outlined,color: Colors.blue,size: 30,),
                          Gap(10),
                          Text('${userdata[0].email}', style: myStyle(20,Colors.black,FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.call_sharp,color: Colors.blue,size: 30,),
                          Gap(10),
                          Text('${userdata[0].phoneNo}', style: myStyle(20,Colors.black,FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



