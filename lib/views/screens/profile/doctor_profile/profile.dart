// ignore_for_file: prefer_const_constructor, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, use_key_in_widget_constructors, unnecessary_null_comparison, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/app_colors.dart';
import 'package:meet_your_doctor/constants/app_constants.dart';
import 'package:meet_your_doctor/constants/images.dart';
// import 'package:meet_your_doctor/providers/chat_management_provider.dart';
// import 'package:meet_your_doctor/providers/post_management_provider.dart';
import 'package:meet_your_doctor/providers/user_management_provider.dart';
import 'package:meet_your_doctor/shared-preference-manager/preference-manager.dart';
// import 'package:meet_your_doctor/views/base/terms_privacy_page.dart';
// import 'package:meet_your_doctor/views/screens/Feeds/feedback.dart';
// import 'package:meet_your_doctor/views/screens/chat/likes_account.dart';
// import 'package:meet_your_doctor/views/screens/post/media.dart';
// import 'package:meet_your_doctor/views/screens/profile/change_password.dart';
// import 'package:meet_your_doctor/views/screens/profile/edit_profile.dart';
import 'package:meet_your_doctor/views/screens/auth/login_user.dart';
// import 'package:meet_your_doctor/views/screens/skeletons/profile_page_skeletone.dart';
// import 'package:meet_your_doctor/widgets/profile_image_widget.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:meet_your_doctor/views/screens/skeletons/profileskeleton.dart';
import 'package:meet_your_doctor/views/widgets/profile.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var user;
  var userAccount;
  // final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    // Provider.of<ChatManagementProvider>(context, listen: false)
    //     .getMyLikesAccounts(context);
    // Provider.of<UserManagementProvider>(context, listen: false)
    //     .setUserInformation();
    // Provider.of<PostManagementProvider>(context, listen: false).getAllImages();
    // Provider.of<PostManagementProvider>(context, listen: false).getAllVideos();
  }

  void handleMenuItemSelected(BuildContext context, String value) {
    switch (value) {
      case 'terms_privacy':
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => TermsAndPrivacyPage(),
        //     ));
        break;
      case 'invite_friends':
        break;
      case 'logout':
        normalEmergingShowDialogWithNoGif();
        break;
    }
  }

  final List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow
  ];

  /// Function to generate a random color from the list
  Color getRandomColor() {
    final random = Random();
    final randomIndex = random.nextInt(colorList.length);
    return colorList[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    // var tagz = Provider.of<UserManagementProvider>(context, listen: true)
    //     .userAccount['tags'];
    // print(
    //     " Tags :: ${Provider.of<UserManagementProvider>(context, listen: true).userAccount['tags']}");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: colorApp,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          // PopupMenuButton<String>(
          //   iconColor: Colors.white,
          //   onSelected: (String result) {
          //     handleMenuItemSelected(context, result);
          //   },
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //     PopupMenuItem<String>(
          //       value: 'Change Password',
          //       child: Text('Change Password'),
          //       onTap: () {
          //         // Navigator.push(
          //         //     context,
          //         //     MaterialPageRoute(
          //         //         builder: (context) => ChangePasswordScreen()));
          //       },
          //     ),
          //     PopupMenuItem<String>(
          //       value: 'terms_privacy',
          //       child: Text('Terms and Privacy'),
          //     ),
          //     PopupMenuItem<String>(
          //       value: 'invite_friends',
          //       child: Text('Invite Friends'),
          //       onTap: () {
          //         Share.share(
          //             "Download my new app on  https://mega.nz/folder/vq5hnJDA#wjd0l8J0zVbRpqAwL82bcQ",
          //             subject: "here is my app");
          //       },
          //     ),
          //     PopupMenuItem<String>(
          //       value: 'Feedback',
          //       child: Text('Feedback'),
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => FeedSubmissionScreen()));
          //       },
          //     ),
          //     PopupMenuItem<String>(
          //       value: 'logout',
          //       child: Text('Logout'),
          //     ),
          //   ],
          // ),
        ],
      ),
      body: Provider.of<UserManagementProvider>(context, listen: true)
                      .userAccount ==
                  null ||
              Provider.of<UserManagementProvider>(context, listen: true).user ==
                  null
          ? ProfilePageSkeletone()
          : ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Provider.of<UserManagementProvider>(context, listen: true)
                            .userAccount['profile'] ==
                        null
                    ? ProfileImageWidget(
                        imagePath: Images.noImageProfile,
                        onTapped: () {},
                        onClicked: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => EditProfilePage(
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["profile"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .user["username"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .user["email"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["bio"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["work"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["location"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["tags"],
                          //     ),
                          //   ),
                          // );
                        },
                        imageFromType: AppConstants.imageFromAsset,
                      )
                    : ProfileImageWidget(
                        imagePath: AppConstants.mediaBaseUrl +
                            Provider.of<UserManagementProvider>(context,
                                    listen: true)
                                .userAccount['profile'],
                        onTapped: () {
                          // FullscreenImageViewer.open(
                          //   context: context,
                          //   child: Hero(
                          //     tag: 'hero',
                          //     // child: Image.memory(base64Decode(
                          //     //     image["binary_data"])),
                          //     child: Image.network(
                          //       AppConstants.mediaBaseUrl +
                          //           Provider.of<UserManagementProvider>(context,
                          //                   listen: false)
                          //               .userAccount['profile'],
                          //     ),
                          //   ),
                          // );
                        },
                        onClicked: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => EditProfilePage(
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["profile"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .user["username"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .user["email"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["bio"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["work"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["location"],
                          //       Provider.of<UserManagementProvider>(context,
                          //               listen: true)
                          //           .userAccount["tags"],
                          //     ),
                          //   ),
                          // );
                        },
                        imageFromType: AppConstants.imageFromNetwork,
                      ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Provider.of<UserManagementProvider>(context, listen: true)
                                .user ==
                            null
                        ? Text(
                            "---",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        : Provider.of<UserManagementProvider>(context,
                                        listen: true)
                                    .user['username'] ==
                                null
                            ? Text(
                                "---",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            : Text(
                                Provider.of<UserManagementProvider>(context,
                                        listen: true)
                                    .user['username'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                    const SizedBox(height: 4),
                    Provider.of<UserManagementProvider>(context, listen: true)
                                .user ==
                            null
                        ? Text(
                            "---",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        : Provider.of<UserManagementProvider>(context,
                                        listen: true)
                                    .user['username'] ==
                                null
                            ? Text(
                                "---",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            : Text(
                                Provider.of<UserManagementProvider>(context,
                                        listen: true)
                                    .user['email'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                  ],
                ),
                const SizedBox(height: 15),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Consumer<ChatManagementProvider>(
                //         builder: (context, recordProvider, child) {
                //       return MaterialButton(
                //         padding: EdgeInsets.symmetric(vertical: 4),
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => LikesAccountsPage(),
                //               ));
                //         },
                //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //         child: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               recordProvider.myLikesAccounts == null
                //                   ? '0'
                //                   : '${recordProvider.myLikesAccounts!.length}',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold, fontSize: 16),
                //             ),
                //             SizedBox(height: 2),
                //             Text(
                //               "Match",
                //               style: TextStyle(fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       );
                //     }),
                //     SizedBox(
                //       height: 24,
                //       child: VerticalDivider(),
                //     ),
                //     Consumer<PostManagementProvider>(
                //         builder: (context, recordProvider, child) {
                //       return MaterialButton(
                //         padding: EdgeInsets.symmetric(vertical: 4),
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => MediaPage(),
                //               ));
                //         },
                //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //         child: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               recordProvider.getImages != null &&
                //                       recordProvider.getVideos != null
                //                   ? '${int.parse(recordProvider.getImages.length.toString()) + int.parse(recordProvider.getVideos.length.toString())}'
                //                   : '0',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold, fontSize: 16),
                //             ),
                //             SizedBox(height: 2),
                //             Text(
                //               'Post',
                //               style: TextStyle(fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       );
                //     })
                //   ],
                // ),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Consumer<UserManagementProvider>(
                      builder: (context, recordProvider, child) {
                    return recordProvider.userAccount == null
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    // AntIcons.homeOutlined,
                                    Icons.home_outlined,
                                    size: 18,
                                    color: Color.fromARGB(136, 0, 0, 0),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      color: const Color.fromARGB(136, 0, 0, 0),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Image.asset(
                                      Images.briefcase,
                                      height: 13,
                                      color: const Color.fromARGB(136, 0, 0, 0),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    'Occupation',
                                    style: TextStyle(
                                      color: const Color.fromARGB(136, 0, 0, 0),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // Row(
                              //   children: [
                              //     const Icon(
                              //       Icons.location_on,
                              //       size: 18,
                              //       color: Color.fromARGB(136, 0, 0, 0),
                              //     ),
                              //     const SizedBox(
                              //       width: 7,
                              //     ),
                              //     Text(
                              //       '2.45 miles away',
                              //       style: GoogleFonts.aBeeZee(
                              //         color: const Color.fromARGB(136, 0, 0, 0),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: 15),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    // AntIcons.homeOutlined,
                                    Icons.home_outlined,
                                    size: 18,
                                    color: Color.fromARGB(136, 0, 0, 0),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    recordProvider.userAccount['location'],
                                    style: TextStyle(
                                      color: const Color.fromARGB(136, 0, 0, 0),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Image.asset(
                                      Images.briefcase,
                                      height: 13,
                                      color: const Color.fromARGB(136, 0, 0, 0),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    recordProvider.userAccount["work"],
                                    style: TextStyle(
                                      color: const Color.fromARGB(136, 0, 0, 0),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                  }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Provider.of<UserManagementProvider>(context, listen: true)
                                  .userAccount ==
                              null
                          ? Text(
                              "---",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.justify,
                            )
                          : Text(
                              Provider.of<UserManagementProvider>(context,
                                      listen: true)
                                  .userAccount['bio'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Divider(
                //     height: 2,
                //   ),
                // ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Provider.of<UserManagementProvider>(context,
                                        listen: true)
                                    .userAccount['tags'] !=
                                null &&
                            Provider.of<UserManagementProvider>(context,
                                    listen: true)
                                .userAccount['tags']
                                .isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My interests',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 15),
                              Wrap(
                                children: List<Widget>.from(
                                    Provider.of<UserManagementProvider>(context,
                                            listen: true)
                                        .userAccount['tags']
                                        .map((tag) {
                                  String tagName = tag['name'].toString();
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 11.0, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: getRandomColor()
                                              .withOpacity(0.1)),
                                      // color: Colors.amber,
                                      height: 30,
                                      // width: getMaxTagWidth(tagName) * 10,
                                      width: 100,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            tagName,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })).toList(),
                              ),
                            ],
                          )
                        : Container()),
              ],
            ),
    );
  }

  double getMaxTagWidth(String tagName) {
    // Calculate and return the width based on your logic
    // For simplicity, let's return a constant value for now
    return 10.0;
  }

  normalEmergingShowDialogWithNoGif() {
    return Dialogs.materialDialog(
      msg: "Are you sure you want to logout?",
      title: "Confirmation",
      color: Colors.white,
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'Cancel',
          iconData: Icons.cancel_outlined,
          textStyle: TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: () async {
            Navigator.pop(context);
            // Navigator.pop(context);
            // await storage.delete(key: 'deviceToken');

            // SharedPreferencesManager()
            //     .clearPreferenceByKey(AppConstants.isLogin);
            // SharedPreferencesManager().clearPreferenceByKey(AppConstants.user);
            // SharedPreferencesManager()
            //     .clearPreferenceByKey(AppConstants.userAccount);
            // ZegoUIKitPrebuiltCallInvitationService().uninit();

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
          text: 'Logout',
          iconData: Icons.delete,
          color: Colors.red,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
