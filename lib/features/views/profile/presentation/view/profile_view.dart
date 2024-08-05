import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insigths_news/core/functions/routing.dart';
import 'package:insigths_news/core/services/app_local_storage.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/core/widgets/navigation_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late String? name;
  late String? path;

  @override
  void initState() {
    name = AppLocalStorage.getUserData('name');
    path = AppLocalStorage.getUserData('image');
    super.initState();
  }

  uploadImage({required bool isCamera})  async {
    var pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
      AppLocalStorage.cacheUserData('image', pickedImage.path);
      });
    }
  }

  var nameController =
      TextEditingController(text: AppLocalStorage.getUserData('name'));
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: FileImage(File(path!)) as ImageProvider,
                    radius: 70,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary),
                                        onPressed: () async {
                                          await uploadImage(isCamera: true);
                                          pop(context);
                                          pushWithReplacement(
                                              context,
                                           const   NavigationBarView(
                                                page: 3,
                                              ));
                                        },
                                        child: Text(
                                          'Upload From Camera',
                                          style: getBodyStyle(
                                              color: AppColors.white),
                                        )),
                                  ),
                                  const Gap(20),
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary),
                                        onPressed: () {
                                          uploadImage(isCamera: false);
                                          pop(context);
                                          pushWithReplacement(
                                              context,
                                           const   NavigationBarView(
                                                page: 3,
                                              ));
                                        },
                                        child: Text(
                                          'Upload From Gallery',
                                          style: getBodyStyle(
                                              color: AppColors.white),
                                        )),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const CircleAvatar(
                        radius: 14,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Divider(
                color: AppColors.primary,
              ),
              const Gap(30),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: MediaQuery.of(context).viewInsets,
                        decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Form(
                             key: formKey, 
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // const Gap(20),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Your Name';
                                      }
                                      return null;
                                    },
                                    style:
                                        getTitleStyle(color: AppColors.primary),
                                    controller: nameController,
                                  ),
                                  const Gap(20),
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary),
                                        onPressed: () {
                                          if (formKey.currentState!.validate()) {
                                            AppLocalStorage.cacheUserData(
                                                'name', nameController.text);
                                                 pop(context);
                                          pushWithReplacement(
                                              context,
                                          const    NavigationBarView(
                                                page: 3,
                                              ));
                                          }
                                         
                                        },
                                        child: Text(
                                          'Update The Name',
                                          style: getBodyStyle(
                                              color: AppColors.white),
                                        )),
                                  ),
                                  //Gap(50),
                                ],
                              ),
                            ),
                          ),
                          //  ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(children: [
                      Text(name!,
                          style: getTitleStyle(color: AppColors.primary)),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
