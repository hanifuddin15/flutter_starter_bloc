import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

import 'package:unsplash_gallery/features/screens/video_calling/views/prejoining_dialog.dart';

part 'video_calling_state.dart';

class VideoCallingCubit extends Cubit<VideoCallingState> {
  VideoCallingCubit() : super(VideoCallingState());
  late final TextEditingController channelNameController;
  late final TextEditingController channelDescriptionController;


   joinRoom(context) async {
    final input = <String, dynamic>{
      'channelName': channelNameController.text,
      'expiryTime': 3600, // 1 hour
    };
    try {
      final response = await FirebaseFunctions.instance
          .httpsCallable('generateToken')
          .call(input);
      final token = response.data as String?;
      if (token != null) {
        debugPrint('Token generated successfully!');
        await Future.delayed(
          const Duration(seconds: 1),
        );
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (context) => PreJoiningDialog(
              channelName: channelNameController.text,
              token: token,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error generating token: $e');
    }
  }

  //Channel Validator
  String? channelNameValidator(String? key){
     return key;

  }

  // Join Call
  Future<void> joinCall(context) async {
    emit(state.copyWith(isJoining: true));
    // Step 1
    await dotenv.load(fileName: "functions/.env");
    final appId = dotenv.env['APP_ID'];
    if (appId == null) {
      throw Exception('Please add your APP_ID to .env file');
    }
    emit(state.copyWith(isJoining: false));
    if (context.mounted) {
      // Step 2
      Navigator.of(context).pop();
      // Step 3
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              VideoCallPage(
            appId: appId,
            token: widget.token,
            channelName: widget.channelName,
            isMicEnabled: _isMicEnabled,
            isVideoEnabled: _isCameraEnabled,
          ),
        ),
      );
    }
  }
  void _onToggleCamera() {
    setState(() {
      _isVideoEnabled = !_isVideoEnabled;
      for (AgoraUser user in _users) {
        if (user.uid == _currentUid) {
          setState(() => user.isVideoEnabled = _isVideoEnabled);
        }
      }
    });
    _agoraEngine.muteLocalVideoStream(!_isVideoEnabled);
  }
  void _onSwitchCamera() => _agoraEngine.switchCamera();
}
Future<void> _onCallEnd(BuildContext context) async {
  await _agoraEngine.leaveChannel();
  if (context.mounted) {
    Navigator.of(context).pop();
  }
}


