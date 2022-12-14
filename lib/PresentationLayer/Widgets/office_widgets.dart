import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble/BusinessLayer/Controllers/office_controller.dart';
import 'package:noble/BusinessLayer/Controllers/property_controller.dart';
import 'package:noble/Constants/font_styles.dart';
import 'package:noble/DataAccessLayer/Models/office.dart';

import '../../Constants/colors.dart';

final OfficesController offController = Get.find();
final PropertyController propertyController = Get.find();

// ignore: must_be_immutable
class OfficeInfo extends StatelessWidget {
  final Office office;
  int followersNumber = 200;
  OfficeInfo({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfficesController>(
        init: offController,
        builder: (_) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: AppColors.lightwhite,
                          size: 40,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.chevron_right,
                            color: AppColors.lightwhite,
                            size: 40,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Column(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(office.logo),
                      radius: 50,
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      office.name,
                      style: white20ArabicBold,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      office.slug,
                      style: white15ArabicBold,
                    ),
                  ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text("1K", style: white25ArabicBold),
                          Text("followers".tr, style: white15ArabicBold),
                        ],
                      ),
                      Column(
                        children: [
                          Text("$followersNumber", style: white25ArabicBold),
                          Text("real_state".tr, style: white15ArabicBold),
                        ],
                      ),
                    ],
                  )
                ]),
          );
        });
  }
}

class OfficeBody extends StatelessWidget {
  final Office office;
  const OfficeBody({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfficesController>(
        init: offController,
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0XFFEDF1FD)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "address".tr,
                                style: blue15ArabicNoBold,
                              ),
                              const Text("", style: grey15ArabicNoBold),
                            ]),
                        const Spacer(),
                        const Icon(
                          Icons.location_on,
                          color: AppColors.blue,
                          size: 35,
                        )
                      ]),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("last_properties".tr, style: blue20ArabicBold),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: propertyController.properties.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    propertyController.properties[i].image),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text(
                                propertyController.properties[i].name,
                                style: blue18NoBold,
                              ),
                              Text(propertyController.properties[i].price,
                                  style: grey15ArabicNoBold)
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        });
  }
}
