// // // ignore_for_file: prefer_const_constructors

// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:meet_your_doctor/constants/app_constants.dart';
// // import 'package:meet_your_doctor/providers/chat_management_provider.dart';
// // import 'package:intl/intl.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:web_socket_channel/web_socket_channel.dart';

// // class SingleChatScreen extends StatefulWidget {
// //   final String name;
// //   final String userId;
// //   final conv_id;

// //   const SingleChatScreen({
// //     super.key,
// //     required this.userId,
// //     required this.name,
// //     this.conv_id,
// //   });
// //   @override
// //   State<SingleChatScreen> createState() => _SingleChatScreenState();
// // }

// // class _SingleChatScreenState extends State<SingleChatScreen> {
// //   TextEditingController messageController = TextEditingController();

// //   String formatChatTime(DateTime timestamp) {
// //     DateTime now = DateTime.now();
// //     Duration difference = now.difference(timestamp);
// //     if (difference.inSeconds < 60) {
// //       return 'Just now';
// //     }
// //     if (difference.inMinutes < 60) {
// //       return '${difference.inMinutes} minutes ago';
// //     }
// //     if (timestamp.day == now.day &&
// //         timestamp.month == now.month &&
// //         timestamp.year == now.year) {
// //       return DateFormat('HH:mm').format(timestamp);
// //     }
// //     if (timestamp.day == now.day - 1 &&
// //         timestamp.month == now.month &&
// //         timestamp.year == now.year) {
// //       return 'Yesterday';
// //     }
// //     return DateFormat('dd/MM/yyyy').format(timestamp);
// //   }

// //   _buildMessage(message, bool isMe) {
// //     final Container msg = Container(
// //       margin: isMe
// //           ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 8)
// //           : EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8),
// //       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
// //       width: MediaQuery.of(context).size.width * 0.75,
// //       decoration: BoxDecoration(
// //         color: isMe
// //             ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
// //             // ? Colors.amber.shade100

// //             // : Color(0xFFFFC804).withOpacity(0.3),
// //             : Colors.white,
// //         borderRadius: isMe
// //             ? BorderRadius.only(
// //                 topLeft: Radius.circular(15.0),
// //                 // bottomLeft: Radius.circular(15.0),
// //                 bottomRight: Radius.circular(15.0))
// //             : BorderRadius.only(
// //                 // topRight: Radius.circular(15.0),
// //                 topLeft: Radius.circular(15.0),
// //                 bottomRight: Radius.circular(15.0),
// //               ),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         // mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           // SizedBox(height: 8.0),
// //           Text(
// //             // message['text'],r
// //             utf8convert(message['text']),
// //             style: TextStyle(
// //               color: Colors.black,
// //               // fontWeight: FontWeight.w600,
// //               fontSize: 16.0,
// //             ),

// //             // style: GoogleFonts.notoColorEmoji(fontSize: 16),
// //           ),
// //           Align(
// //             alignment: Alignment.bottomRight,
// //             child: Text(
// //               formatChatTime(DateTime.parse(message['timestamp'])),
// //               style: TextStyle(
// //                 color: Colors.grey,
// //                 // fontWeight: FontWeight.w200,
// //                 fontSize: 10.0,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //     // print("message : ${message['text']}");
// //     if (isMe) {
// //       return msg;
// //     }
// //     return Row(
// //       children: [
// //         msg,
// //       ],
// //     );
// //   }

// //   late WebSocketChannel channel;

// //   @override
// //   void dispose() {
// //     channel.sink.close();
// //     messageController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     channel = WebSocketChannel.connect(
// //       Uri.parse(AppConstants.webSocketUrl + widget.conv_id),
// //     );
// //     Future.delayed(Duration.zero, () {
// //       // Move the logic outside of the build method
// //       Provider.of<ChatManagementProvider>(context, listen: false)
// //           .setMessage(widget.conv_id, context);
// //     });
// //     getUserId();
// //     Provider.of<ChatManagementProvider>(context, listen: false)
// //         .getChatMessages(widget.conv_id, context);
// //     // if (widget.user1 != widget.user2) {
// //     //   Provider.of<ChatManagementProvider>(context, listen: false)
// //     //       .conversationToSeen(widget.conv_id, context);
// //     // }
// //   }

// //   getUserId() async {
// //     SharedPreferences localStorage = await SharedPreferences.getInstance();
// //     var user = localStorage.getString("user");
// //     setState(() {
// //       user_id = jsonDecode(user!)['id'];
// //       username = jsonDecode(user)['username'];
// //     });
// //   }

// //   //DECODING THE TEXT
// //   String utf8convert(String text) {
// //     List<int> bytes = text.toString().codeUnits;
// //     return utf8.decode(bytes);
// //   }

// //   var user_id;
// //   var username;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey.shade100,
// //       appBar: AppBar(
// //         actionsIconTheme: IconThemeData(color: Colors.white),
// //         foregroundColor: Colors.black,
// //         backgroundColor: Colors.white,
// //         title: Column(
// //           children: [
// //             Text(
// //               // widget.user.name,
// //               widget.name,
// //               // getUserId(),
// //               // widget.name == username?
// //               // username,

// //               style: TextStyle(
// //                 color: Colors.black,
// //                 fontSize: 16.0,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             StreamBuilder(
// //               stream: channel.stream,
// //               builder: (context, snapshot) {
// //                 // Provider.of<ChatProvider>(context, listen: false)
// //                 //     .setMessage(widget.conv_id, context);
// //                 Future.delayed(Duration.zero, () {
// //                   Provider.of<ChatManagementProvider>(context, listen: false)
// //                       .setMessage(widget.conv_id, context);
// // print("SET MESAGES ${ Provider.of<ChatManagementProvider>(context, listen: false)
// //                       .setMessage(widget.conv_id, context)}");

// //                 });
// //                 return SizedBox();
// //                 // return Text(snapshot.hasData ? '${snapshot.data}' : 'xxx');
// //               },
// //             )
// //           ],
// //         ),
// //         elevation: 0.0,
// //         actions: [],
// //       ),
// //       body: GestureDetector(
// //         onTap: () => FocusScope.of(context).unfocus(),
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                     color: Colors.grey.shade100,
// //                     borderRadius: BorderRadius.only(
// //                       topLeft: Radius.circular(10.0),
// //                       topRight: Radius.circular(30.0),
// //                     )),
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(10.0),
// //                     topRight: Radius.circular(10.0),
// //                   ),
// //                   child: Consumer<ChatManagementProvider>(
// //                       builder: (context, recordProvider, child) {
// //                     return recordProvider.getChatsMessages == null ||
// //                             recordProvider.getChatsMessages!.isEmpty
// //                         ? const SizedBox()
// //                         : ListView.builder(
// //                             reverse: true,
// //                             padding: EdgeInsets.only(top: 15.0),
// //                             itemCount: recordProvider.getChatsMessages.length,
// //                             itemBuilder: (BuildContext context, int index) {
// //                               final bool isMe = recordProvider
// //                                       .getChatsMessages[index]['sender'] ==
// //                                   user_id;
// //                               return _buildMessage(
// //                                   recordProvider.getChatsMessages[index], isMe);
// //                             });
// //                   }),
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               padding: EdgeInsets.symmetric(horizontal: 8.0),
// //               height: 70.0,
// //               color: Colors.white,
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                       child: TextField(
// //                     controller: messageController,
// //                     textCapitalization: TextCapitalization.sentences,
// //                     onChanged: (value) {},
// //                     decoration: InputDecoration.collapsed(
// //                         hintText: 'Send a message.....'),
// //                   )),
// //                   IconButton(
// //                     onPressed: () async {
// //                       if (messageController.text.isNotEmpty) {
// //                         SharedPreferences localStorage =
// //                             await SharedPreferences.getInstance();
// //                         String? user = localStorage.getString("user");
// //                         var data = {
// //                           'sender': jsonDecode(user!)['id'],
// //                           'text': messageController.text,
// //                           'conversation_id': widget.conv_id
// //                         };
// //                         Provider.of<ChatManagementProvider>(context,
// //                                 listen: false)
// //                             .postChatMessage(data, context);
// //                         messageController.clear();
// //                       }
// //                       ;
// //                     },
// //                     icon: Icon(Icons.send),
// //                     iconSize: 25.0,
// //                     color: Theme.of(context).primaryColor,
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, non_constant_identifier_names, prefer_typing_uninitialized_variables

// // ignore_for_file: prefer_const_constructors, unused_import

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:meet_your_doctor/constants/app_constants.dart';
// import 'package:meet_your_doctor/providers/chat_management_provider.dart';
// import 'package:meet_your_doctor/views/screens/chat/videocall.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_zim/zego_zim.dart';

// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// class SingleChatScreen extends StatefulWidget {
//   final String name;
//   final String userId;
//   final conv_id;

//   const SingleChatScreen({
//     super.key,
//     required this.userId,
//     required this.name,
//     this.conv_id,
//   });

//   @override
//   State<SingleChatScreen> createState() => _SingleChatScreenState();
// }

// class _SingleChatScreenState extends State<SingleChatScreen> {
//   TextEditingController messageController = TextEditingController();

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

//   _buildMessage(message, bool isMe) {
//     final Container msg = Container(
//       margin: isMe
//           ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 8)
//           : EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8),
//       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//       width: MediaQuery.of(context).size.width * 0.75,
//       decoration: BoxDecoration(
//         color: isMe
//             ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
//             : Colors.white,
//         borderRadius: isMe
//             ? BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0))
//             : BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             utf8convert(message['text']),
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 14.0,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Text(
//               formatChatTime(DateTime.parse(message['timestamp'])),
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 10.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//     if (messageController.text.contains(message['text'])) {
//       return null;
//     }
//     return isMe ? msg : Row(children: [msg]);
//   }

//   late WebSocketChannel channel;

//   @override
//   void dispose() {
//     channel.sink.close();
//     messageController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     channel = WebSocketChannel.connect(
//       Uri.parse(AppConstants.webSocketUrl + widget.conv_id),
//     );
//     // Provider.of<ChatManagementProvider>(context, listen: false)
//     //     .setMessage(widget.conv_id, context);
//     channel.stream.listen((message) {
//       Provider.of<ChatManagementProvider>(context, listen: false)
//           .setMessage(widget.conv_id, context);
//     });
//     getUserId();
//     Provider.of<ChatManagementProvider>(context, listen: false)
//         .getChatMessages(widget.conv_id, context);
//   }

//   getUserId() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var user = localStorage.getString("user");
//     setState(() {
//       user_id = jsonDecode(user!)['id'];
//       username = jsonDecode(user)['username'];
//     });
//   }

//   String utf8convert(String text) {
//     List<int> bytes = text.toString().codeUnits;
//     return utf8.decode(bytes);
//   }

//   var user_id;
//   var username;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         actionsIconTheme: IconThemeData(color: Colors.white),
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,
//         title: Column(
//           children: [
//             Text(
//               widget.name,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         elevation: 0.0,
//         actions: [
//           IconButton(
//             onPressed: () {
//               print("ID :: ${widget.conv_id}");
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HeartSyncVideoCall(
//                       callId: widget.conv_id.toString(),
//                       userId: user_id,
//                       username: username),
//                 ),
//               );
//             },
//             icon: Icon(
//               Icons.videocam,
//             ),
//           ),
//           ZegoSendCallInvitationButton(
//             invitees: [ZegoUIKitUser(id: widget.userId, name: widget.name)],
//             isVideoCall: true,
//             icon: ButtonIcon(
//               icon: Icon(
//                 Icons.videocam,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10.0),
//                       topRight: Radius.circular(30.0),
//                     )),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10.0),
//                     topRight: Radius.circular(10.0),
//                   ),
//                   child: Consumer<ChatManagementProvider>(
//                       builder: (context, recordProvider, child) {
//                     return recordProvider.getChatsMessages == null ||
//                             recordProvider.getChatsMessages!.isEmpty
//                         ? const SizedBox()
//                         : ListView.builder(
//                             reverse: true,
//                             padding: EdgeInsets.only(top: 15.0),
//                             itemCount: recordProvider.getChatsMessages.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               print(
//                                   "MESSAGES :: ${recordProvider.getChatsMessages[index]}");
//                               final bool isMe = recordProvider
//                                       .getChatsMessages[index]['sender'] ==
//                                   user_id;
//                               return _buildMessage(
//                                   recordProvider.getChatsMessages[index], isMe);
//                             });
//                   }),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               height: 70.0,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: TextField(
//                     controller: messageController,
//                     textCapitalization: TextCapitalization.sentences,
//                     style: TextStyle(fontSize: 14),
//                     onChanged: (value) {},
//                     decoration: InputDecoration.collapsed(
//                         hintText: 'Send a message.....',
//                         hintStyle: TextStyle(fontSize: 14)),
//                   )),
//                   IconButton(
//                     onPressed: () async {
//                       if (messageController.text.isNotEmpty) {
//                         SharedPreferences localStorage =
//                             await SharedPreferences.getInstance();
//                         String? user = localStorage.getString("user");
//                         var data = {
//                           'sender': jsonDecode(user!)['id'],
//                           'text': messageController.text,
//                           'conversation_id': widget.conv_id
//                         };
//                         Provider.of<ChatManagementProvider>(context,
//                                 listen: false)
//                             .postChatMessage(data, context);
//                         messageController.clear();
//                       }
//                     },
//                     icon: Icon(Icons.send),
//                     iconSize: 25.0,
//                     color: Theme.of(context).primaryColor,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
