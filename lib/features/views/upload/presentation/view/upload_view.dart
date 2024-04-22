import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insigths_news/core/constants/assets_images.dart';
import 'package:insigths_news/core/functions/routing.dart';
import 'package:insigths_news/core/functions/show_snackbar.dart';
import 'package:insigths_news/core/services/app_local_storage.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/core/widgets/custom_elevated_button.dart';
import 'package:insigths_news/core/widgets/navigation_bar.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? path;
  String? name;
  getPhoto({required bool isCamera}) async {
    final pickedImage = await ImagePicker().pickImage(
        source: (isCamera) ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  if (path != null && name != null) {
                    AppLocalStorage.cacheUserData('image', path);
                    AppLocalStorage.cacheUserData('name', name);
                    AppLocalStorage.cacheUserData('isUpload', true);
                    pushWithReplacement(context, const NavigationBarView());
                  } else if (path == null && name != null) {
                    showSnackBar(context, text: 'please enter your photo');
                  } else if (path != null && name == null) {
                    showSnackBar(context, text: 'please enter your name');
                  } else {
                    showSnackBar(context,
                        text: 'please enter your photo and name');
                  }
                },
                child: Text(
                  'Done',
                  style: getBodyStyle(color: AppColors.primary),
                ),
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.background,
                  backgroundImage: (path != null)
                      ? FileImage(File(path!)) as ImageProvider
                      : AssetImage(AssetsImages.person),
                  radius: 90,
                ),
                const Gap(20),
                CustomElevatedButton(
                  onpressed: () {
                    getPhoto(isCamera: true);
                  },
                  text: 'Upload from Camera',
                ),
                const Gap(15),
                CustomElevatedButton(
                  onpressed: () {
                    getPhoto(isCamera: false);
                  },
                  text: 'Upload from Gallery',
                ),
                const Gap(20),
                Divider(
                  color: AppColors.primary,
                ),
                const Gap(15),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  style: getBodyStyle(fontSize: 15),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primary,
                    ),
                    hintText: 'Enter your username',
                    hintStyle: getBodyStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
