import 'package:apiuse/controllers/controller.dart';
import 'package:apiuse/page/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  var controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return controller.photoloading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.getPhoto.length,
                        itemBuilder: (context, index) {
                          var item = controller.getPhoto[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ImageScreen(index, item),
                                ),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                trailing: Text(item.id.toString()),
                                title: Text(item.title!),
                                subtitle: Text(item.albumId.toString()),
                                leading: controller.getPhoto.isEmpty
                                    ? const SizedBox(
                                        child: Text("no data"),
                                      )
                                    : CircleAvatar(
                                        radius: 20,
                                        child: Text(
                                          item.id.toString(),
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
