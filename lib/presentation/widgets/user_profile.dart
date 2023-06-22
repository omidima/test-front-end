import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(15, 0, 0, 0),
                offset: Offset(0, 3),
                blurRadius: 16)
          ],
          color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image.network(
                "https://img.freepik.com/free-icon/user_318-159711.jpg?w=2000",
                width: 90,
                height: 90,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("امید حدیدی"),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("بعدی")),
              MaterialButton(
                onPressed: () {},
                elevation: 0,
                color: Colors.white,
                child: const Text(
                  "قبلی",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
