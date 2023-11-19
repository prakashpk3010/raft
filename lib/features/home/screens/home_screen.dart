import 'package:flutter/material.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_constants.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/config/app_fonts_style.dart';
import 'package:raft/features/home/widgets/add_post.dart';
import 'package:raft/features/home/widgets/comment_sheet.dart';
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
          Icon(
            Icons.notifications_none_rounded,
            color: AppColor.primaryColor,
            size: 30,
          ),
          AppSpacer().spacerw10,
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.network(
              'https://gumlet.assettype.com/filmcompanion%2F2022-11%2F930182b8-0fc6-4ed3-9d16-7f71e256a987%2Fashok.png?format=auto',
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
          AppSpacer().spacerw10
        ],
        title: Text(
          AppConstants.appname,
          style: AppStyle.headingFont.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ),
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
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.network(
                        'https://gumlet.assettype.com/filmcompanion%2F2022-11%2F930182b8-0fc6-4ed3-9d16-7f71e256a987%2Fashok.png?format=auto',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Prakash PK',
                      style: AppStyle.bodyFont,
                    ),
                    trailing: const Icon(
                      Icons.bookmark_border_outlined,
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
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                          label: const Text('15')),
                      TextButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const CommentSheet();
                                });
                          },
                          icon: Icon(
                            Icons.mode_comment,
                            color: AppColor.secondaryColor,
                          ),
                          label: const Text('15')),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.near_me,
                            color: AppColor.teritaryColor,
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.screenPadding),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'A click with you',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => AppSpacer().spacerH10,
          itemCount: 5),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddPost();
              });
        },
        child: Icon(
          Icons.add_photo_alternate_rounded,
          color: AppColor.light,
          size: 30,
        ),
      ),
    );
  }
}
