import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zigy/notifiers/users_notifier.dart';

import '../components/loading.dart';
import '../models/user_model.dart';
import '../utils/colors.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = context.watch<UserNotifier>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 80, 109, 225),
        elevation: 0,
        centerTitle: true,
        title: const Text("Users", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: _userGridView(size, userNotifier),
    );
  }

  _userGridView(Size size, UserNotifier userNotifier) {
    if (userNotifier.loading) {
      return const LoadingData();
    }

    if (userNotifier.usersList.isEmpty) {
      return Center(
        child: Text(
          "No Data Present",
          style: TextStyle(
              color: Colors.white,
              fontSize: size.height * .025,
              fontWeight: FontWeight.bold),
        ),
      );
    }

    return GridView.builder(
        itemCount: userNotifier.usersList.length,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          Datum user = userNotifier.usersList[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12),
            child: InkWell(
              onTap: (() {
              }),
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                        backgroundColor: bgColor,
                        radius: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45.0),
                          child: CachedNetworkImage(
                            imageUrl: user.avatar,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: imageProvider,
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                              )),
                            ),
                            placeholder: (context, url) => const LoadingData(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        )),
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}