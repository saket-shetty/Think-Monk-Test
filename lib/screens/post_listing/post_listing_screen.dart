import 'package:flutter/material.dart';
import 'package:teach_us/common_widgets/common_widgets.dart';
import 'package:teach_us/screens/post_listing/post_listing_bloc.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class PostListingScreen extends StatefulWidget {
  @override
  _PostListingScreenState createState() => _PostListingScreenState();
}

class _PostListingScreenState extends State<PostListingScreen> {
  PostListingBloc _bloc = new PostListingBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar("Think Monk"),
      body: StreamBuilder(
        stream: _bloc.postListingStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.length > 0) {
            List<PostListingData> _list = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_list[index].name),
                  subtitle: Text(_list[index].designation),
                );
              },
              itemCount: _list.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
