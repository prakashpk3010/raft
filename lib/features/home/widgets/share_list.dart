import 'package:flutter/material.dart';
import 'package:raft/config/app_asset.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/utils/toast.dart';
import '../../../config/app_fonts_style.dart';
import '../../../utils/custom_button.dart';
import '../../../utils/log.dart';

class ShareList extends StatefulWidget {
  const ShareList({super.key});

  @override
  State<ShareList> createState() => _PostContainerState();
}

class _PostContainerState extends State<ShareList> {
  List tagList = [];
  List images = [
    AppAsset.image1,
    AppAsset.image2,
    AppAsset.image3,
    AppAsset.image4,
    AppAsset.image1,
  ];
  List name = [
    'Frreky_Kid',
    'Terror_Boy_sandy',
    'PraKash',
    'Titan_sathish',
    'Virat_Kohli',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: EdgeInsets.all(AppPadding.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, tagList);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Column(
                  children: [
                    Text(
                      'Share to Friends',
                      style: AppStyle.headingFont
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            AppSpacer().spacerH10,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => AppSpacer().spacerH10,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.radius)),
                    tileColor: AppColor.hintColorlight,
                    dense: true,
                    contentPadding: const EdgeInsets.all(5),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        images[index],
                        height: 35,
                        width: 35,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.landscape_rounded),
                      ),
                    ),
                    title: Text(
                      name[index],
                      style: AppStyle.bodyFont,
                    ),
                    subtitle: Text(
                      'I am busy',
                      style: AppStyle.subMiniFont,
                    ),
                    trailing: CustomButton(
                      textcolor: tagList.contains(index)
                          ? AppColor.dark
                          : AppColor.light,
                      border: tagList.contains(index) ? true : false,
                      color: tagList.contains(index)
                          ? Colors.transparent
                          : AppColor.primaryColor,
                      fontsize: 10,
                      width: tagList.contains(index) ? 70 : 50,
                      height: 20,
                      text: tagList.contains(index) ? 'Remove' : 'Share',
                      onTap: () {
                        if (tagList.contains(index)) {
                          for (var i = 0; i < tagList.length; i++) {
                            if (tagList[i] == index) {
                              tagList.removeAt(i);
                            }
                          }
                        } else {
                          tagList.add(index);
                        }
                        kLog(tagList);
                        setState(() {});
                      },
                    ),
                  );
                },
                itemCount: name.length,
              ),
            ),
            AppSpacer().spacerH10,
            CustomButton(
                text: 'Share now',
                onTap: () {
                  toast('Shared Successfully');
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
