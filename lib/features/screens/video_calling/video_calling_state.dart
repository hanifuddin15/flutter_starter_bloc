part of 'video_calling_cubit.dart';

enum VideCallingStatus {
  initial,
  connecting,
  connected,
  disconnecting,
  disconnected,
}

class VideoCallingState extends Equatable {
  final VideCallingStatus status;

  final bool isMicEnabled;
  final bool isCameraEnabled;

  final bool isJoining;

  const VideoCallingState({
    this.status = VideCallingStatus.initial,
    this.isMicEnabled = false,
    this.isCameraEnabled = false,
    this.isJoining = false,
  });
  VideoCallingState copyWith({
    final VideCallingStatus? status,
    final bool? isMicEnabled,
    final bool? isCameraEnabled,
    final bool? isJoining,
  }) {
    return VideoCallingState(
      status: status ?? this.status,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      isJoining: isJoining ?? this.isJoining,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    isMicEnabled,
    isCameraEnabled,
    isJoining,
  ];
}
