import 'package:flutter/material.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_constants.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/config/app_fonts_style.dart';
import 'package:raft/utils/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          leadingWidth: 60,
          actions: [
            AppSpacer().spacerH10,
            const Icon(
              Icons.account_circle_outlined,
              size: 35,
            ),
            AppSpacer().spacerw10
          ],
          title: Icon(
            Icons.diversity_1_rounded,
            size: 30,
            color: AppColor.primaryColor,
          )),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppRadius.radius,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    ),
                    title: Text(
                      'Prakash PK',
                      style: AppStyle.subFont,
                    ),
                    subtitle: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomButton(
                        fontsize: 10,
                        width: 70,
                        height: 20,
                        text: 'Follow',
                        onTap: () {},
                      ),
                    ),
                  ),
                  Image.network(
                    width: MediaQuery.of(context).size.width,
                    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppPadding.screenPadding),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => AppSpacer().spacerH10,
          itemCount: 5),
    );
  }
}
