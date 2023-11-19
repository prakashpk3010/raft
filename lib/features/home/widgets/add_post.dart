import 'package:flutter/material.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_fonts_style.dart';
import 'package:raft/utils/custom_button.dart';

import '../../../config/app_dimensions.dart';
import '../../../utils/custom_textfield.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _PostContainerState();
}

class _PostContainerState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: EdgeInsets.all(AppPadding.screenPadding),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'Add Post',
                  style: AppStyle.headingFont
                      .copyWith(color: AppColor.primaryColor),
                ),
              ],
            ),
            Wrap(
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 50,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 50,
                        )),
                  ),
                ),
              ],
            ),
            AppSpacer().spacerH20,
            const CustomTextfield(
              maxLines: 3,
              hint: 'Add Description',
            ),
            const Spacer(),
            CustomButton(text: 'Post', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
