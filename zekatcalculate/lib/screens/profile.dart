// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/myappbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Theme.of(context).backgroundColor,
        appBar: MyAppBar(title: "Profil"),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Align(
            alignment: Alignment.topCenter, // Resmi üst ortaya hizala
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Hero(
                    tag: "profilFoto",
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).dividerColor, // Border rengi
                          width: 4, // Border genişliği
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage("assets/images/icons/icon.png"),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 40,
                  thickness: 2,
                  color: Theme.of(context).dividerColor,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    Gap(15),
                    Text(
                      "E-Mail",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
                Gap(20),
                Row(
                  children: const [
                    Icon(
                      Icons.phone_android_outlined,
                      color: Colors.grey,
                    ),
                    Gap(15),
                    Text(
                      "Phone",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
                Divider(
                  height: 40,
                  thickness: 2,
                  color: Theme.of(context).dividerColor,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.lock_outlined,
                      color: Colors.grey,
                    ),
                    Gap(15),
                    Text(
                      "Change Password",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
                Gap(20),
                Row(
                  children: const [
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.grey,
                    ),
                    Gap(15),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
                Divider(
                  height: 40,
                  thickness: 2,
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
