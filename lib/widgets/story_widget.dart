import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({super.key});

  final List<String> users = [
    "alex",
    "emma",
    "john",
    "sophia",
    "david",
    "olivia",
    "michael"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFEDA75),
                        Color(0xFFFA7E1E),
                        Color(0xFFD62976),
                        Color(0xFF962FBF),
                        Color(0xFF4F5BD5),
                      ],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/150"),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  users[index],
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}