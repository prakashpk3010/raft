import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_fonts_style.dart';
import 'package:raft/utils/custom_button.dart';
import 'package:raft/utils/dialog_loader.dart';
import 'package:raft/utils/log.dart';
import 'package:raft/utils/toast.dart';
import '../../../config/app_dimensions.dart';
import '../../../utils/custom_textfield.dart';
import 'friends_list.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _PostContainerState();
}

class _PostContainerState extends State<AddPost> {
  XFile? image;
  pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        image = value;
        setState(() {});
      }
    });
  }

  final descCtrl = TextEditingController();

  List tagList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.screenPadding),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                title: Text(
                  'Add Post',
                  style: AppStyle.headingFont
                      .copyWith(color: AppColor.primaryColor),
                ),
              ),
              const Text(
                'Add Media',
              ),
              AppSpacer().spacerH10,
              Wrap(
                children: [
                  if (image != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppRadius.radius,
                      ),
                      child: Image.file(
                        File(image!.path),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    AppSpacer().spacerW20,
                  ],
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 50,
                      child: IconButton(
                          onPressed: () {
                            pickImage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                          )),
                    ),
                  ),
                ],
              ),
              AppSpacer().spacerH20,
              Card(
                  child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const FriendsList();
                        }).then((value) {
                      if (value != null) {
                        tagList = value;
                        setState(() {});
                      }
                    });
                  },
                  icon: const Icon(Icons.tag),
                  label: const Text('Tag Friends'),
                ),
              )),
              AppSpacer().spacerH10,
              Wrap(
                children: List.generate(tagList.length, (index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text('Prakash'),
                    ),
                  );
                }),
              ),
              AppSpacer().spacerH20,
              const Text('Description'),
              AppSpacer().spacerH10,
              CustomTextfield(
                controller: descCtrl,
                maxLines: 2,
                hint: 'Add Description',
              ),
              AppSpacer().spacerH20,
              Mutation(
                options: MutationOptions(
                  update: (cache, result) {
                    kLog(result!.exception);
                  },
                  document: gql(uploadImage),
                  variables: {
                    "files": [image]
                  },
                  onError: (error) {
                    kLog(error);
                    toast('Failed to upload');
                  },
                  onCompleted: (data) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    kLog(data);
                  },
                ),
                builder:
                    (RunMutation runMutation, QueryResult<Object?>? result) {
                  return CustomButton(
                      text: 'Post',
                      onTap: () async {
                        showLoader(context);
                        try {
                          var multipartFile = MultipartFile.fromString(
                            'files',
                            image!.path,
                            filename: '${DateTime.now().second}.jpg',
                          );
                          runMutation(<String, dynamic>{
                            "files": multipartFile,
                            "desc": descCtrl.text,
                            "tags": tagList.join().toString(),
                          });
                        } catch (e) {
                          /// off loader
                          Navigator.pop(context);
                        }
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const uploadImage = """
mutation(\$files: [Upload!]!) {
  multipleUpload(files: \$files) {
    desc
    tags
  }
}
""";
