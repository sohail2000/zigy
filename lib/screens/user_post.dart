// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zigy/models/users_post_model.dart';
import 'package:zigy/notifiers/users_post_notifier.dart';
import '../components/loading.dart';
import '../utils/colors.dart';

class UserPost extends StatelessWidget {
  const UserPost({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    UserPostNotifier userPostNotifier = context.watch<UserPostNotifier>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 80, 109, 225),
        elevation: 0,
        centerTitle: true,
        title: const Text("Posts", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: _userPostView(userPostNotifier, size),
    );
  }

  
  _userPostView(UserPostNotifier userPostNotifier, Size size) {

    if (userPostNotifier.loading) {
      return const LoadingData();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            Datum post = userPostNotifier.usersPostList[index];
            int cStrLen = post.color.length;
            String cStr = post.color.substring(1,cStrLen);
            String color = "0xff$cStr";
            return InkWell(
              onTap: () {
              },
              child: Container(
                constraints: BoxConstraints(
                  minHeight: size.height * .14,
                ),
                child: Center(
                  child: Card(
                    color: Color(int.parse(color)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .02,
                          vertical: size.width * .03),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .09,
                          ),
                          SizedBox(
                            width: size.width * .52,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  post.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Pantone Value: ${post.pantoneValue}"),
                                Text(
                                    "Year: ${post.year}"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: userPostNotifier.usersPostList.length,
        ),
      ),
    );
  }

}