import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:teach_us/screens/add_post_screen/add_post_screen.dart';
import 'package:teach_us/screens/post_detail_screen/post_detail_screen.dart';
import 'package:teach_us/screens/post_listing/post_listing_bloc.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class PostListingScreen extends StatefulWidget {
  @override
  _PostListingScreenState createState() => _PostListingScreenState();
}

class _PostListingScreenState extends State<PostListingScreen> {
  PostListingBloc _bloc = new PostListingBloc();

  List<PostListingData> selectDeletePost = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Think Monk",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () async {
              PostListingData newPost = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPostScreen()));
              if (newPost != null) {
                _bloc.list.add(newPost);
                _bloc.postListingSink.add(_bloc.list);
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: selectDeletePost.length > 0,
        child: FloatingActionButton(
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          onPressed: () async {
            Response response = await _bloc.deletePosts(selectDeletePost);
            if (response.statusCode == 200) {
              setState(() {
                selectDeletePost.clear();
              });
            }
          },
        ),
      ),
      body: StreamBuilder(
        stream: _bloc.postListingStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.length > 0) {
            List<PostListingData> _list = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                bool isCheck = selectDeletePost.contains(_list[index]);
                return GestureDetector(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text(_list[index].name),
                      subtitle: Text(_list[index].designation),
                      trailing: Checkbox(
                        onChanged: (bool value) {
                          setState(
                            () {
                              isCheck = value;
                              if (isCheck) {
                                selectDeletePost.add(_list[index]);
                              } else {
                                selectDeletePost.remove(_list[index]);
                              }
                            },
                          );
                        },
                        value: isCheck,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostDetailScreen(list: _list, currentIndex: index),
                      ),
                    );
                  },
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
