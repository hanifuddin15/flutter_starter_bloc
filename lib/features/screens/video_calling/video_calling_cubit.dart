import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'video_calling_state.dart';

class VideoCallingCubit extends Cubit<VideoCallingState> {
  VideoCallingCubit() : super(VideoCallingInitial());
}
