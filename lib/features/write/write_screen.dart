import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final GlobalKey _textFieldKey = GlobalKey();

  bool _hasText = false;

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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "mark_j",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            key: _textFieldKey,
                            onChanged: _onTextFieldChanged,
                            decoration: const InputDecoration(
                              hintText: "Start a thread...",
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const FaIcon(
                          FontAwesomeIcons.paperclip,
                          size: 20,
                          color: Colors.grey,
                        )
                      ],
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
    );
  }
}
