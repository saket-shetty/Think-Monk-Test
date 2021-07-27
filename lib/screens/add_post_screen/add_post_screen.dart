import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:teach_us/common_widgets/common_widgets.dart';
import 'package:teach_us/screens/add_post_screen/add_post_repository.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _employer = TextEditingController();
  TextEditingController _work = TextEditingController();

  AddPostRepository _repository = AddPostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar("Add Post"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          submitData();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _name,
              decoration: InputDecoration(
                hintText: 'Name',
                labelText: "Enter Name",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _designation,
              decoration: InputDecoration(
                hintText: 'Designation',
                labelText: "Enter Your Designation",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _employer,
              decoration: InputDecoration(
                hintText: 'Employer',
                labelText: "Enter Employer Name",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _work,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Work',
                labelText: "Enter Your Work",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitData() async {
    String name = _name.text;
    String designation = _designation.text;
    String employer = _employer.text;
    String work = _work.text;

    PostListingData data =
        PostListingData(7, name, work, designation, employer);

    Response response = await _repository.addPostToDatabase(data);

    if (response.statusCode == 201) {
      Navigator.pop(context, data);
    } else {
      print("Something went wrong");
    }
  }
}
