import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller=Get.put(SettingsController());
    return SafeArea(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: AppColor.primaryColor,
                height: Get.height / 3.5,
              ),
              Positioned(
                  top: Get.height / 4.5,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColor.lightBrown,
                        borderRadius: BorderRadius.circular(45)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(ImageAssets.avatar),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    minTileHeight: 4,
                    title: Text("Disable Notification"),
                    trailing: Container(
                        child: Switch(value: true, onChanged: (value){})),
                  ),
                  Divider(),
                  ListTile(
                    minTileHeight: 4,
                    title: Text("Address"),
                       trailing: Icon(Icons.location_on),
                  ),
                  Divider(),
                  ListTile(
                    minTileHeight: 4,
                    title: Text("About Us"),
                    trailing: Icon(Icons.info),
                  ),
                    Divider(),
                  ListTile(
                    minTileHeight: 4,
                    title: Text("Contact Us"),
                       trailing: Icon(Icons.phone),
                  ),
                    Divider(),
                  ListTile(
                    minTileHeight: 4,
                    onTap: (){controller.logOut();},
                    title: Text("Log Out"),
                       trailing: Icon(Icons.login_outlined),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
