import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PreJoiningDialog extends StatefulWidget {
  const PreJoiningDialog({
    super.key,
    required this.token,
    required this.channelName,
  });

  final String token;
  final String channelName;

  @override
  State<PreJoiningDialog> createState() => _PreJoiningDialogState();
}
class _PreJoiningDialogState extends State<PreJoiningDialog> {
  bool _isMicEnabled = false;
  bool _isCameraEnabled = false;
  bool _isJoining = false;

  Future<void> _getMicPermissions() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final micPermission = await Permission.microphone.request();
      if (micPermission == PermissionStatus.granted) {
        setState(() => _isMicEnabled = true);
      }
    } else {
      setState(() => _isMicEnabled = !_isMicEnabled);
    }
  }

  Future<void> _getCameraPermissions() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final cameraPermission = await Permission.camera.request();
      if (cameraPermission == PermissionStatus.granted) {
        setState(() => _isCameraEnabled = true);
      }
    } else {
      setState(() => _isCameraEnabled = !_isCameraEnabled);
    }
  }

  Future<void> _getPermissions() async {
    await _getMicPermissions();
    await _getCameraPermissions();
  }

  @override
  void initState() {
    _getPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Button for enabling or disabling microphone
    InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        if (_isMicEnabled) {
          setState(() => _isMicEnabled = false);
        } else {
          _getMicPermissions();
        }
      },
      child: CircleAvatar(
        backgroundColor: Colors.redAccent,
        radius: 32.0,
        child: Icon(
          _isMicEnabled
              ? Icons.mic_rounded
              : Icons.mic_off_rounded,
          size: 32,
        ),
      ),
    );

// Button for enabling or disabling camera
    InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        if (_isCameraEnabled) {
          setState(() => _isCameraEnabled = false);
        } else {
          _getCameraPermissions();
        }
      },
      child: CircleAvatar(
        backgroundColor: Colors.redAccent,
        radius: 32.0,
        child: Icon(
          _isCameraEnabled
              ? Icons.videocam_rounded
              : Icons.videocam_off_rounded,
          size: 32,
        ),
      ),
    );
  }





}