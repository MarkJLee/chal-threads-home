import 'package:chal_threads_home/features/home/widgets/post_report_bottom_sheet_widget.dart';
import 'package:chal_threads_home/utils.dart';
import 'package:flutter/material.dart';

class PostActionButtonsInBottomSheetWidget extends StatelessWidget {
  final bool follow;
  const PostActionButtonsInBottomSheetWidget({
    super.key,
    required this.follow,
  });

  Future<void> _onReportTapped(BuildContext context) async {
    await showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => PostReportBottomSheetWidget(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: isDarkMode(context) ? Colors.grey[800] : Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    follow ? "Unfollow" : "Mute",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(color: Colors.grey[400], thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: Text(
                    follow ? "Mute" : "Hide",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: isDarkMode(context) ? Colors.grey[800] : Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    follow ? "Hide" : "Block",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: follow
                          ? isDarkMode(context)
                              ? Colors.grey[200]
                              : Colors.black
                          : Colors.red,
                    ),
                  ),
                ),
                Divider(color: Colors.grey[400], thickness: 1),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _onReportTapped(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10),
                    child: Text(
                      "Report",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
