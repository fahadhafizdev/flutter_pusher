import 'dart:developer';

import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  void onConnectPressed() async {
    // Remove keyboard

    try {
      await pusher.init(
        apiKey: '1bdfd3cb48c8ba39565e',
        cluster: "ap1",
        // onConnectionStateChange: onConnectionStateChange,
        // onError: onError,
        // onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        // onSubscriptionError: onSubscriptionError,
        // onDecryptionFailure: onDecryptionFailure,
        // onMemberAdded: onMemberAdded,
        // onMemberRemoved: onMemberRemoved,
        // onSubscriptionCount: onSubscriptionCount,
        // authEndpoint: "<Your Authendpoint Url>",
        // onAuthorizer: onAuthorizer
      );
      await pusher.subscribe(channelName: 'hello');
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }

  Future<void> initPusher() async {
    log('init pusher');
    try {
      await pusher.init(
        apiKey: "1bdfd3cb48c8ba39565e",
        cluster: "ap1",
        // onEvent: onEvent,
      );
      await pusher.subscribe(channelName: 'presence-chatbox');

      await pusher.connect();
    } catch (e) {
      log(e.toString());
    }

    // final myChannel = await pusher.subscribe(
    //   channelName: "my-channel",
    //   onEvent: onEvent,
    // );
  }

  @override
  void onInit() async {
    onConnectPressed();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
