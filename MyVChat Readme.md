MyVChat Readme



import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unsplash_gallery/features/screens/video_calling/views/call.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final channelController = TextEditingController();
  bool validateError = false;
  ClientRole? role = ClientRole.Broadcaster;

 Future<void> onJoin() async{
   setState(() {
     channelController.text.isEmpty? validateError = true : validateError = false;
   });
   if (channelController.text.isNotEmpty){
     await handleCameraAndMic(Permission.camera);
     await handleCameraAndMic(Permission.microphone);
     await  Navigator.push(
       context,
       CupertinoPageRoute(
         builder: (context) => CallingScreen(channelName: channelController.text,
         role: role),
       ),
     );
   }
 }
Future<void> handleCameraAndMic(Permission permission) async{
   final status = await permission.request();
   log(status.toString());

}
  @override
  void dispose() {
    channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agora Test'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: REdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              40.verticalSpace,
              Image.network("https://tinyurl.com/2p889y4k"),
              20.verticalSpace,
              TextFormField(
                controller: channelController,
                decoration: InputDecoration(
                  hintText: "Channel Name",
                  errorText: validateError ? "Channel Name is Mendatory" : null,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),

                  )
                ),
              ),

              RadioListTile(
                  title: Text("BroadCaster"),
                  value: ClientRole.Broadcaster,
                  groupValue: role,
                  onChanged: (ClientRole? value){
                    setState(() {
                      role = value;
                    });
                  }


              ),
              RadioListTile(
                title: Text("Audience"),
                  value: ClientRole.Audience,
                  groupValue: role,
                  onChanged: (ClientRole? value){
                  setState(() {
                    role = value;
                  });
                  }


              ),
              ElevatedButton(
                  onPressed: onJoin,

                  child: Text("Join"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),

                ),

              )

            ],
          ),
        ),
      ),
    );
  }


}




import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/agora_cred.dart';

class CallingScreen extends StatefulWidget {
  final String? channelName;
  final ClientRole? role;

  const CallingScreen({super.key, this.channelName, this.role});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  final users = <int>[];
  final infoString = <String>[];
  bool muted = false;
  bool viewPanel = false;
  late RtcEngine rtcEngine;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    users.clear();
    rtcEngine.leaveChannel();
    rtcEngine.destroy();

    super.dispose();
  }

  Future<void> initialize() async {
    if (appId.isEmpty) {
      setState(() {
        infoString.add(
            "App ID is empty, please provide your app ID in app_cred.dart");
        infoString.add("Agora Engine is not started");
      });
      return;
    }
    rtcEngine = await RtcEngine.create(appId);
    await rtcEngine.enableVideo();
    await rtcEngine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await rtcEngine.setClientRole(widget.role!);
    addAgoraEventHandlers();
    VideoEncoderConfiguration vidConfig = VideoEncoderConfiguration(
        dimensions: VideoDimensions(width: 1920, height: 1800));

    await rtcEngine.setVideoEncoderConfiguration(vidConfig);
    await rtcEngine.joinChannel(token, widget.channelName!, null, 0);
  }

  void addAgoraEventHandlers() {
    rtcEngine.setEventHandler(
      RtcEngineEventHandler(error: (code) {
        setState(() {
          final info = "Error: $code";
          infoString.add(info);
        });
      }, joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          final info = 'Join Channel : $channel, uid: $uid';
          infoString.add(info);
        });
      }, leaveChannel: (stats) {
        setState(() {
          infoString.add('Leave Chanel');
          users.clear();
        });
      }, userJoined: (uid, elapsed) {
        final info = "User Joined: $uid";
        infoString.add(info);
      }, userOffline: (uid, elapsed) {
        final info = "User Offline: $uid";
        users.remove(uid);
      }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
        setState(() {
          final info = "First Remote Video: $uid ${width} x ${height}";
        });
      }),
    );
  }

  Widget viewRows() {
    final List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(const rtc_local_view.SurfaceView());
    }
    for (var uid in users) {
      list.add(rtc_remote_view.SurfaceView(
        uid: uid,
        channelId: widget.channelName!,
      ));
    }
    final views = list;
    return Column(
      children: List.generate(views.length, (index) => views[index]),
    );
  }

  Widget toolBar() {
    if (widget.role == ClientRole.Audience) return const SizedBox();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {
              setState(() {
                muted != muted;
              });
              rtcEngine.muteLocalVideoStream(muted);
            },
            child: Icon(
              muted ? Icons.mic : Icons.mic_off,
              color: Colors.white,
              size: 20,
            ),
            shape: const CircleBorder(),
            elevation: 2,
            fillColor: muted ? Colors.greenAccent : Colors.white,
          ),
          RawMaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35,
            ),
            shape: CircleBorder(),
            elevation: 2,
            fillColor: Colors.redAccent,
            padding: EdgeInsets.all(15),
          ),
          RawMaterialButton(
            onPressed: () {
              rtcEngine.switchCamera();
            },
            child: Icon(
              Icons.switch_camera,
              color: Colors.greenAccent,
              size: 35,
            ),
            shape: CircleBorder(),
            elevation: 2,
            fillColor: Colors.white,
            padding: EdgeInsets.all(12),
          )
        ],
      ),
    );
  }

  Widget panel() {
    return Visibility(
        visible: viewPanel,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 48),
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: ListView.builder(
                  reverse: true,
                  itemCount: infoString.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (infoString.isEmpty) {
                      return const Text("null");
                    }
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                child: Text(
                                  infoString[index],
                                  style: TextStyle(
                                    color: Colors.blueGrey
                                  ),
                                ),
                          ))
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agora"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
              setState(() {
                viewPanel =! viewPanel;

              });
              },
              icon: Icon(
                Icons.info_outline
              ),
          ),

        ],

      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            viewRows(),
            panel(),
            toolBar()
          ],
        ),
      ),
    );
  }
}

