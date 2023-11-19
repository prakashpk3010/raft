import 'package:flutter/material.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/utils/custom_textfield.dart';
import '../../../config/app_fonts_style.dart';

class CommentSheet extends StatefulWidget {
  const CommentSheet({super.key});

  @override
  State<CommentSheet> createState() => _PostContainerState();
}

class _PostContainerState extends State<CommentSheet> {
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
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Column(
                  children: [
                    Text(
                      'Comments',
                      style: AppStyle.headingFont
                          .copyWith(color: AppColor.primaryColor),
                    ),
                    Text(
                      '50 Comments',
                      style: AppStyle.subMiniFont
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                const Spacer(),
                Image.network(
                  'https://gumlet.assettype.com/filmcompanion%2F2022-11%2F930182b8-0fc6-4ed3-9d16-7f71e256a987%2Fashok.png?format=auto',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.landscape_rounded),
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
                      child: Image.network(
                        'https://gumlet.assettype.com/filmcompanion%2F2022-11%2F930182b8-0fc6-4ed3-9d16-7f71e256a987%2Fashok.png?format=auto',
                        height: 35,
                        width: 35,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.landscape_rounded),
                      ),
                    ),
                    title: Text(
                      'Prakash PK',
                      style: AppStyle.subFont,
                    ),
                    subtitle: Text(
                      'Very Nice picture , what is the appecture position.',
                      style: AppStyle.subMiniFont,
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            CustomTextfield(
              hint: 'Add Comments',
              suffixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.send_rounded,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
