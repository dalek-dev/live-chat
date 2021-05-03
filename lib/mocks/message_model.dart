import 'user_model.dart';

class MessageModel{
  final User? sender;
  final String? avatar;
  final String? time;
  final int? unreadCount;
  final bool? isRead;
  final String? text;
  MessageModel({
    this.sender,
    this.avatar,
    this.time,
    this.unreadCount,
    this.text,
    this.isRead
  });
}

final listRecentChats = [
  MessageModel(
   sender: addison,
   avatar: 'assets/images/Addison.jpg',
    time: '01:25',
    text: 'typing...',
    unreadCount: 1
  ),
  MessageModel(
      sender: jason,
      avatar: 'assets/images/Jason.jpg',
      time: '12:46',
      text: 'Will I  be in it?',
      unreadCount: 1
  ),
  MessageModel(
      sender: deanna,
      avatar: 'assets/images/Deanna.jpg',
      time: '05:25',
      text: "That's so cute",
      unreadCount: 3
  ),
  MessageModel(
      sender: nathan,
      avatar: 'assets/images/Nathan.jpg',
      time: '12:45',
      text: 'Let me see what I can do',
      unreadCount: 2
  ),
];

final allChats = [
  MessageModel(
      sender: virgil,
      avatar: 'assets/images/Virgil.jpg',
      time: '12:59',
      text: 'No! I just wanted',
      unreadCount: 0,
    isRead: true
  ),
  MessageModel(
      sender: stanley,
      avatar: 'assets/images/Stanley.jpg',
      time: '10:41',
      text: 'You did what?',
      unreadCount: 1,
      isRead: false
  ),
  MessageModel(
      sender: leslie,
      avatar: 'assets/images/Leslie.jpg',
      time: '05:51',
      text: 'just signed up for a tutor',
      unreadCount: 0,
      isRead: true
  ),
  MessageModel(
      sender: judd,
      avatar: 'assets/images/Judd.jpg',
      time: '10:16',
      text: 'May I ask you something',
      unreadCount: 2,
      isRead: false
  ),
];

final listMessages = [
  MessageModel(
      sender: addison,
      time: '12:19',
      avatar: addison.avatar,
      text: '...',
  ),
  MessageModel(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "I'm  going home.",
  ),
  MessageModel(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "See, I was right, this doesn't interest me.",
  ),
  MessageModel(
    sender: addison,
    time: '11:58 PM',
    avatar: addison.avatar,
    text: 'I  sign your paychecks',
  ),
  MessageModel(
    sender: addison,
    time: '11:58 PM',
    avatar: addison.avatar,
    text: 'You think we have nothing to talk about?',
  ),
  MessageModel(
    sender: currentUser,
    time: '11:45 PM',
    isRead: true,
    text: 'Well, because I had no intention of being in your office. 20 minutes ago',
  ),
  MessageModel(
    sender: addison,
    time: '11:30 PM',
    avatar: addison.avatar,
    text: 'I was expecting you in my office 20 minutes ago.',
  ),
];