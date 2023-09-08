import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final GlobalKey _textFieldKey = GlobalKey();

  bool _hasText = false;
  bool _showCameraOptions = false; // <-- 추가된 변수

  XFile? _selectedImage;

  void _onTextFieldChanged(String text) {
    setState(() {
      _hasText = text.isNotEmpty;
    });
  }

  // TextField 높이를 계산하는 함수
  double _getTextFieldHeight() {
    final RenderBox? renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 50; // VerticalDivider 디폴트 높이는 50
  }

  Future<void> _onPaperClipPressed() async {
    // final image = await ImagePicker().pickImage(
    //   // source: ImageSource.gallery,
    //   source: ImageSource.camera,
    // );
    // if (image != null) {
    //   setState(() {
    //     _selectedImage = image;
    //   });
    // }

    setState(() {
      _showCameraOptions = true;
    });
  }

  Future<void> _onCameraPressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      setState(() {
        _selectedImage = image;
        _showCameraOptions = false;
      });
    }
  }

  Future<void> _onGalleryPressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _selectedImage = image;
        _showCameraOptions = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 키보드가 올라와있을 때 터치하면 키보드가 내려감
          FocusScope.of(context).unfocus();

          if (_showCameraOptions) {
            setState(() {
              _showCameraOptions = false;
            });
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "New thread",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: ClipOval(
                                child: Image.asset("assets/p-mark.jpg",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: _getTextFieldHeight(),
                              child: const VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.width * 0.05,
                              child: ClipOval(
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Image.asset(
                                    "assets/p-mark.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            key: _textFieldKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Mark_J",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextField(
                                    onChanged: _onTextFieldChanged,
                                    decoration: const InputDecoration(
                                      hintText: "Start a thread...",
                                      border: InputBorder.none,
                                    ),
                                    maxLines: null,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _selectedImage == null
                                    ? !_showCameraOptions
                                        ? GestureDetector(
                                            onTap: _onPaperClipPressed,
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: const FaIcon(
                                                FontAwesomeIcons.paperclip,
                                                size: 20,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: GestureDetector(
                                                  onTap: _onCameraPressed,
                                                  child: const Icon(
                                                    Icons.photo_camera,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: GestureDetector(
                                                  onTap: _onGalleryPressed,
                                                  child: const Icon(
                                                    Icons.photo_album,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            File(_selectedImage!.path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 30,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Anyone can reply",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Post",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _hasText ? Colors.blue : Colors.blue.shade100,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
