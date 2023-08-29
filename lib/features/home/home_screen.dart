import 'package:chal_threads_home/features/home/widgets/post_header_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset('assets/threads.svg', height: 40),

        // Threads logo
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                const PostHeaderWidget(
                  postText: "Vine after seeing the Threads logo unveiled",
                  postTime: "2m",
                  userIcon: FaIcon(
                    FontAwesomeIcons.twitch,
                    size: 40,
                  ),
                  userName: "Twitch",
                ),
                const SizedBox(height: 8),
                PostMediaWidget(
                  image: Image.asset(
                    "assets/0.jpg",
                  ),
                ),
                const Row(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
