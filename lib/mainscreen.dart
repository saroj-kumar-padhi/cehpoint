import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;
  final String localUserID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
    required this.localUserID,
  }) : super(key: key);

  @override
  _VideoConferencePageState createState() => _VideoConferencePageState();
}

class _VideoConferencePageState extends State<VideoConferencePage> {
  Timer? _timer;
  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime--;
      });
      if (_remainingTime == 0) {
        // drop the call after 30 seconds
        ZegoExpressEngine.instance.logoutRoom(widget.conferenceID);
        _timer?.cancel();
        //join
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ZegoUIKitPrebuiltVideoConference(
            appID: 360043144,
            appSign:
                'a1268ffa0f6c7a8681f8847743381b69a440fb86ebbdea6509f5d8132616d8ce',
            userID: widget.localUserID,
            userName: "userfe3_${widget.localUserID}",
            conferenceID: widget.conferenceID,
            config: ZegoUIKitPrebuiltVideoConferenceConfig(),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                "Call ends in $_remainingTime seconds",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
