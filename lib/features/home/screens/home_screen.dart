import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:raft/config/app_asset.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_constants.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/config/app_fonts_style.dart';
import 'package:raft/features/auth/screens/log_in.dart';
import 'package:raft/features/home/widgets/add_post.dart';
import 'package:raft/features/home/widgets/comment_sheet.dart';
import 'package:raft/features/home/widgets/share_list.dart';
import 'package:raft/utils/custom_button.dart';
import 'package:raft/utils/loader.dart';
import 'package:raft/utils/log.dart';
import 'package:raft/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool load = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      load = false;
      setState(() {});
    });
  }

  List followList = [];
  List likeList = [];
  List bookMarkList = [];
  List likeCount = [];
  List images = [
    AppAsset.image6,
    AppAsset.image7,
    AppAsset.image8,
    AppAsset.image9,
    AppAsset.image6,
  ];
  final String readCounters = """
    query readCounters(\$counterId: Int!) {
        counter {
            name
            id
        }
    }
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 60,
        actions: [
          InkWell(
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setString('id', '');
              FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogInScreen(),
                  ),
                  (route) => false);
            },
            child: Icon(
              Icons.logout,
              color: AppColor.primaryColor,
              size: 30,
            ),
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
      body: Query(
          options: QueryOptions(
            document: gql(
                readRepositories), // this is the query string you just created
            variables: const {
              'nRepositories': 50,
            },
            pollInterval: const Duration(seconds: 10),
          ),
          builder: (result, {fetchMore, refetch}) {
            List? repositories =
                result.data?['viewer']?['repositories']?['nodes'];
            return load
                ? const Loader()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      if (likeCount.length < index + 1) {
                        likeCount.add(0);
                      }
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
                              trailing: Text(
                                '2 min ago',
                                style: AppStyle.subMiniFont,
                              ),
                              subtitle: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomButton(
                                  textcolor: followList.contains(index)
                                      ? AppColor.dark
                                      : AppColor.light,
                                  border:
                                      followList.contains(index) ? true : false,
                                  color: followList.contains(index)
                                      ? Colors.transparent
                                      : AppColor.teritaryColor,
                                  fontsize: 10,
                                  width: followList.contains(index) ? 80 : 70,
                                  height: 20,
                                  text: followList.contains(index)
                                      ? 'Unfollow'
                                      : 'Follow',
                                  onTap: () {
                                    if (followList.contains(index)) {
                                      for (var i = 0;
                                          i < followList.length;
                                          i++) {
                                        if (followList[i] == index) {
                                          followList.removeAt(i);
                                          toast('You Unfollowed Prakash Pk');
                                        }
                                      }
                                    } else {
                                      followList.add(index);
                                      toast('You Followed Prakash Pk');
                                    }
                                    kLog(followList);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            FadeInImage.assetNetwork(
                                placeholder: AppAsset.image5,
                                image: images[index]),
                            Row(
                              children: [
                                TextButton.icon(
                                  onPressed: () {
                                    if (likeList.contains(index)) {
                                      for (var i = 0;
                                          i < likeList.length;
                                          i++) {
                                        if (likeList[i] == index) {
                                          likeList.removeAt(i);
                                          likeCount[index]--;
                                        }
                                      }
                                    } else {
                                      likeList.add(index);
                                      likeCount[index]++;
                                    }
                                    kLog(likeList);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    likeList.contains(index)
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  ),
                                  label: Text(likeCount[index].toString()),
                                ),
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
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return const ShareList();
                                          });
                                    },
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
                                  'A click in my favourite place, which made the day beautiful.',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => AppSpacer().spacerH10,
                    itemCount: 5);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
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

String readRepositories = """
  query ReadRepositories(\$nRepositories: Int!) {
    viewer {
      repositories(last: \$nRepositories) {
        nodes {
          id
          name
          viewerHasStarred
        }
      }
    }
  }
""";
