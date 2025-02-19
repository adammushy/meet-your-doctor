// // ignore_for_file: prefer_const_constructors, dead_code, prefer_typing_uninitialized_variables

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:meet_your_doctor/constants/app_colors.dart';
// import 'package:meet_your_doctor/constants/app_constants.dart';
// import 'package:meet_your_doctor/constants/images.dart';
// // import 'package:meet_your_doctor/providers/chat_management_provider.dart';
// import 'package:meet_your_doctor/providers/user_management_provider.dart';
// import 'package:meet_your_doctor/shared-preference-manager/preference-manager.dart';
// import 'package:meet_your_doctor/views/screens/chat/single_chat_screen.dart';
// import 'package:meet_your_doctor/views/screens/skeletons/chatlistskeleton.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class RecentChats extends StatefulWidget {
//   const RecentChats({super.key});

//   @override
//   State<RecentChats> createState() => _RecentChatsState();
// }

// class _RecentChatsState extends State<RecentChats> {
//   var user;
//   var account;
//   @override
//   void initState() {
//     super.initState();
//     getUserData();
//     Provider.of<ChatManagementProvider>(context, listen: false)
//         .getAllChats(context);

//     Provider.of<UserManagementProvider>(context, listen: false)
//         .allUsersAccounts;
//     // getUnseenChatCount();
//   }

//   String formatDjangoDateTime(String djangoDateTime) {
//     DateTime parsedDateTime = DateTime.parse(djangoDateTime);
//     String formattedDate = DateFormat.yMMMd().format(parsedDateTime);
//     return formattedDate;
//   }

//   // int getUnseenChatCount() {
//   //   final provider =
//   //       Provider.of<ChatManagementProvider>(context, listen: false);
//   //   if (provider.getChats == null) {
//   //     return 0; // Handle case when chats haven't been loaded yet
//   //   }
//   //   var total =
//   //       provider.getChats.where((chat) => chat['is_seen'] == false).length;
//   //   print("UNSEEN CHATS :: ${total}");
//   //   return total;
//   // }

//   getUserData() async {
//     user = jsonDecode(
//         await SharedPreferencesManager().getString(AppConstants.user));

//     // print(user['id']);
//     account = jsonDecode(
//         await SharedPreferencesManager().getString(AppConstants.userAccount));

//     if (user['id'] == account['user']['id']) {
//       print("They Match");
//     }
//     // print(account);
//   }

//   String formatChatTime(DateTime timestamp) {
//     DateTime now = DateTime.now();
//     Duration difference = now.difference(timestamp);
//     if (difference.inSeconds < 60) {
//       return 'Just now';
//     }
//     if (difference.inMinutes < 60) {
//       return '${difference.inMinutes} minutes ago';
//     }
//     if (timestamp.day == now.day &&
//         timestamp.month == now.month &&
//         timestamp.year == now.year) {
//       return DateFormat('HH:mm').format(timestamp);
//     }
//     if (timestamp.day == now.day - 1 &&
//         timestamp.month == now.month &&
//         timestamp.year == now.year) {
//       return 'Yesterday';
//     }
//     return DateFormat('dd/MM/yyyy').format(timestamp);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double heightT = MediaQuery.of(context).size.height;
//     double widthT = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         foregroundColor: Colors.white,
//         backgroundColor: colorApp,
//         title: const Center(
//           child: Text(
//             "Messages",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//       body: Consumer<ChatManagementProvider>(
//         builder: (context, recordProvider, child) {
//           return recordProvider.getChats == null ||
//                   recordProvider.getChats!.isEmpty ||
//                   user == null
//               ? const ChatlistSkeletone()
//               : ListView.builder(
//                   itemCount: recordProvider.getChats.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     // print(
//                     // "initiator DP : ${recordProvider.getChats[index]['initiator']['id']}");
//                     //  print("MESSAGES :: ${recordProvider.getChats[index]}");
//                     return GestureDetector(
//                       onTap: () {
//                         if (recordProvider.getChats[index]
//                                 ['last_message_user'] !=
//                             user['id']) {
//                           recordProvider.conversationToSeen(
//                               recordProvider.getChats[index]['id'], context);
//                         }
//                         if (user['id'] ==
//                             recordProvider.getChats[index]['receiver']['id']) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => SingleChatScreen(
//                                 name: recordProvider.getChats[index]
//                                     ['initiator']['username'],
//                                 userId: recordProvider.getChats[index]
//                                     ['receiver']['id'],
//                                 conv_id: recordProvider.getChats[index]['id'],
//                               ),
//                             ),
//                           );
//                           print(
//                               "MESSAGES :: ${recordProvider.getChats[index]}");
//                         } else {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => SingleChatScreen(
//                                 name: recordProvider.getChats[index]['receiver']
//                                     ['username'],
//                                 userId: recordProvider.getChats[index]
//                                     ['receiver']['id'],
//                                 conv_id: recordProvider.getChats[index]['id'],
//                               ),
//                             ),
//                           );
//                           print(
//                               "MESSAGES :: ${recordProvider.getChats[index]}");
//                         }
//                       },
//                       child: Container(
//                         // margin: const EdgeInsets.only(
//                         //     top: 5.0, bottom: 5.0, right: 20.0),
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 10.0,
//                           horizontal: 10.0,
//                         ),
//                         decoration: BoxDecoration(
//                             color:
//                                 // true ? const Color(0xFFFFEFEE) : Colors.white,

//                                 recordProvider.getChats[index]['is_seen'] ==
//                                             false &&
//                                         user['id'] !=
//                                             recordProvider.getChats[index]
//                                                 ['last_message_user']
//                                     ? const Color(0xFFFFEFEE)
//                                     : Colors.white,
//                             borderRadius: const BorderRadius.only(
//                               topRight: Radius.circular(20.0),
//                               bottomRight: Radius.circular(20.0),
//                             )),
//                         child: ListTile(
//                           leading: user['id'] ==
//                                   recordProvider.getChats[index]['receiver']
//                                       ['id']
//                               ? CircleAvatar(
//                                   child: Text(
//                                     recordProvider.getChats[index]['initiator']
//                                             ['username'][0]
//                                         .toUpperCase(),
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24),
//                                   ),
//                                 )
//                               : CircleAvatar(
//                                   child: Text(
//                                       recordProvider.getChats[index]['receiver']
//                                               ['username'][0]
//                                           .toUpperCase(),
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 24))),
//                           title: user['id'] ==
//                                   recordProvider.getChats[index]['receiver']
//                                       ['id']
//                               ? Text(
//                                   recordProvider.getChats[index]['initiator']
//                                       ['username'],
//                                   style: const TextStyle(
//                                     overflow: TextOverflow.ellipsis,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 )
//                               : Text(
//                                   recordProvider.getChats[index]['receiver']
//                                       ['username'],
//                                   style: const TextStyle(
//                                     overflow: TextOverflow.ellipsis,
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                           trailing: Column(
//                             children: [
//                               Text(
//                                 formatDjangoDateTime(recordProvider
//                                     .getChats[index]['start_time']),
//                                 style: const TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 8.0,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 5.0,
//                               ),
//                               recordProvider.getChats[index]['is_seen'] ==
//                                           false &&
//                                       user['id'] !=
//                                           recordProvider.getChats[index]
//                                               ['last_message_user']
//                                   ? Container(
//                                       width: 40.0,
//                                       height: 20.0,
//                                       decoration: BoxDecoration(
//                                         color: Theme.of(context).primaryColor,
//                                         borderRadius:
//                                             BorderRadius.circular(30.0),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: const Text(
//                                         'NEW',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 12.0,
//                                         ),
//                                       ),
//                                     )
//                                   : Container(
//                                       width: 40,
//                                       height: 20,
//                                     )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
