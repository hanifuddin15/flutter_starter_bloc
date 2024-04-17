import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../video_calling_cubit.dart';

class CreatingChannelsScreen extends StatelessWidget {
  const CreatingChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


     body: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: context.read<VideoCallingCubit>().channelNameController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Channel Name',
              labelStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              hintText: 'Enter your channel name...',
              hintStyle: const TextStyle(
                color: Color(0xFF57636C),
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            keyboardType: TextInputType.text,
            validator: context.read<VideoCallingCubit>().channelNameValidator,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: context.read<VideoCallingCubit>().joinRoom(context),
            child: const Text('Join Room'),
          )

        ],
      ),



    );
  }
}
