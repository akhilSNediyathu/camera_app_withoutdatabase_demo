// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late XFile? file;

  List<String> selectfile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cameraBtn();
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: selectfile.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Stack(children: [
                            Image.file(
                              File(selectfile[
                                  ((selectfile.length - 1) - index)]),
                              width: double.infinity,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  "Close",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            )
                          ]),
                        );
                      });
                },
                child: Image.file(
                  File(selectfile[((selectfile.length - 1) - index)]),
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }

  cameraBtn() async {
    file = (await ImagePicker().pickImage(source: ImageSource.camera));
    if (file != null) {
      setState(() {
        selectfile.add(file!.path);
      });
    }
  }
}
