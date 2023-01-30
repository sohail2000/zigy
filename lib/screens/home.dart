
import 'package:flutter/material.dart';
import 'package:zigy/screens/user_post.dart';
import 'package:zigy/screens/users.dart';
import 'package:zigy/utils/colors.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Users()),
                        );
                    },
                    child: const Text('Users'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const UserPost()),
                        );
                    },
                    child: const Text('Users Post'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

