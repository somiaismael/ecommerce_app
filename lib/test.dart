import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  check() async {
    var res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightBrown,
        centerTitle: true,
        title: Text("Test"),
      ),
      body:
       GetBuilder<TestController>(builder: (controller)=> HandlingDataView(
        statusrequest: controller.statusrequest, widget: ListView.builder(
        itemCount: controller.data.length,
       itemBuilder: (context, index) => ListTile(
        title: Text("${controller.data[index]}"),
       ),
      ),)
      )
    );
  }
}
