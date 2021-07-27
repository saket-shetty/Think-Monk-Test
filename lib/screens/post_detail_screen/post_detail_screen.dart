import 'package:flutter/material.dart';
import 'package:teach_us/common_widgets/common_widgets.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class PostDetailScreen extends StatefulWidget {
  final List<PostListingData> list;
  final int currentIndex;
  const PostDetailScreen(
      {Key key, @required this.list, @required this.currentIndex})
      : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  List<PostListingData> list = [];
  int index;
  TextStyle _textStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );
  @override
  void initState() {
    super.initState();
    list = this.widget.list;
    index = this.widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar("Post Detail"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${list[index].name}",
              style: _textStyle,
            ),
            paddingBetween(),
            Text(
              "Designation: ${list[index].designation}",
              style: _textStyle,
            ),
            paddingBetween(),
            Text(
              "Company: ${list[index].employerName}",
              style: _textStyle,
            ),
            paddingBetween(),
            Text(
              "Work: ${list[index].message}",
              style: _textStyle,
            ),
            paddingBetween(),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: index != 0,
                    child: GestureDetector(
                      child: Text(
                        "Previous",
                        style: _textStyle,
                      ),
                      onTap: () {
                        setState(() {
                          index -= 1;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: index != list.length - 1,
                    child: GestureDetector(
                      child: Text(
                        "Next",
                        style: _textStyle,
                      ),
                      onTap: () {
                        setState(() {
                          index += 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget paddingBetween() {
    return Padding(padding: EdgeInsets.all(8));
  }
}
