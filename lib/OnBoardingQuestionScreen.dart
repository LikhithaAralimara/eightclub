// // import 'package:flutter/material.dart';
// // import 'package:flutter_sound/flutter_sound.dart'; // Add the Flutter Sound package for audio recording
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:video_player/video_player.dart'; // Add the video player package for video playback
// //
// // class OnboardingQuestionScreen extends StatefulWidget {
// //   @override
// //   _OnboardingQuestionScreenState createState() => _OnboardingQuestionScreenState();
// // }
// //
// // class _OnboardingQuestionScreenState extends State<OnboardingQuestionScreen> {
// //   TextEditingController textController = TextEditingController();
// //   late FlutterSoundRecorder _recorder; // For audio recording
// //   bool isRecording = false;
// //   String recordedAudioPath = '';
// //   late VideoPlayerController videoController; // For video playback
// //   String recordedVideoPath = '';
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _recorder = FlutterSoundRecorder();
// //     initializeAudio();
// //   }
// //
// //   Future<void> initializeAudio() async {
// //     await _recorder.openAudioSession();
// //   }
// //
// //   // Future<void> startRecording() async {
// //   //   setState(() {
// //   //     isRecording = true;
// //   //   });
// //   //   recordedAudioPath = await _recorder.startRecorder(toFile: 'audio.aac'); // Adjust file type as needed
// //   //
// //   //   // recordedAudioPath = await _recorder.startRecorder(toFile: 'audio.aac'); // Adjust file type as needed
// //   // }
// //   Future<void> startRecording() async {
// //     // Ensure you have permission to record
// //     final permissionStatus = await Permission.microphone.request();
// //     if (permissionStatus.isGranted) {
// //       setState(() {
// //         isRecording = true;
// //       });
// //
// //       // Start recording without assigning to recordedAudioPath
// //       await _recorder.startRecorder(toFile: 'audio.aac'); // Adjust file type as needed
// //     } else {
// //       // Handle permission denial here, e.g., show a message
// //       print("Microphone permission denied.");
// //     }
// //   }
// //
// //
// //   Future<void> stopRecording() async {
// //     recordedAudioPath = (await _recorder.stopRecorder())!;
// //     setState(() {
// //       isRecording = false;
// //     });
// //   }
// //
// //   void deleteAudio() {
// //     setState(() {
// //       recordedAudioPath = '';
// //     });
// //   }
// //
// //   void deleteVideo() {
// //     setState(() {
// //       recordedVideoPath = '';
// //       if (videoController != null) {
// //         videoController.dispose();
// //       }
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _recorder.closeAudioSession();
// //     videoController?.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         title: Text('Onboarding Questions'),
// //         backgroundColor: Colors.grey[850],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Describe your perfect hotspot:',
// //               style: TextStyle(color: Colors.white, fontSize: 18),
// //             ),
// //             SizedBox(height: 10),
// //             Container(
// //               width: 358,
// //               height: 159.11,
// //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white.withOpacity(0.05),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: TextField(
// //                 controller: textController,
// //                 maxLines: 5,
// //                 maxLength: 600,
// //                 decoration: InputDecoration(
// //                   hintText: '/ Describe your perfect hotspot',
// //                   hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
// //                   border: InputBorder.none,
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             if (recordedAudioPath.isEmpty)
// //               ElevatedButton(
// //                 onPressed: isRecording ? stopRecording : startRecording,
// //                 child: Text(isRecording ? 'Stop Recording' : 'Record Audio'),
// //               ),
// //             if (recordedAudioPath.isNotEmpty) ...[
// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     onPressed: deleteAudio,
// //                     child: Text('Delete Audio'),
// //                   ),
// //                 ],
// //               ),
// //               // Here you would add your waveform visualization
// //             ],
// //             SizedBox(height: 20),
// //             if (recordedVideoPath.isEmpty)
// //               ElevatedButton(
// //                 onPressed: () {
// //                   // Add video recording functionality here
// //                 },
// //                 child: Text('Record Video'),
// //               ),
// //             if (recordedVideoPath.isNotEmpty) ...[
// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     onPressed: deleteVideo,
// //                     child: Text('Delete Video'),
// //                   ),
// //                   SizedBox(width: 20),
// //                   // Optionally show a video player here
// //                   // VideoPlayer(videoController),
// //                 ],
// //               ),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart'; // Add the Flutter Sound package for audio recording
// import 'package:permission_handler/permission_handler.dart';
// import 'package:video_player/video_player.dart'; // Add the video player package for video playback
//
// class OnboardingQuestionScreen extends StatefulWidget {
//   @override
//   _OnboardingQuestionScreenState createState() => _OnboardingQuestionScreenState();
// }
//
// class _OnboardingQuestionScreenState extends State<OnboardingQuestionScreen> {
//   TextEditingController textController = TextEditingController();
//   late FlutterSoundRecorder _recorder; // For audio recording
//   bool isRecording = false;
//   String recordedAudioPath = '';
//   late VideoPlayerController videoController; // For video playback
//   String recordedVideoPath = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _recorder = FlutterSoundRecorder();
//     initializeAudio();
//   }
//
//   Future<void> initializeAudio() async {
//     await _recorder.openAudioSession();
//   }
//
//   // Request microphone permission
//   Future<bool> requestMicrophonePermission() async {
//     final status = await Permission.microphone.request();
//     if (status.isGranted) {
//       return true;
//     } else if (status.isDenied || status.isPermanentlyDenied) {
//       // Handle the case where permission is permanently denied
//       _showPermissionDeniedDialog('Microphone');
//       return false;
//     }
//     return false;
//   }
//
//   // Request camera permission
//   Future<bool> requestCameraPermission() async {
//     final status = await Permission.camera.request();
//     if (status.isGranted) {
//       return true;
//     } else if (status.isDenied || status.isPermanentlyDenied) {
//       _showPermissionDeniedDialog('Camera');
//       return false;
//     }
//     return false;
//   }
//
//   // Show dialog when permission is denied
//   void _showPermissionDeniedDialog(String permission) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('$permission Permission Denied'),
//         content: Text('Please enable $permission permission in settings to use this feature.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> startRecording() async {
//     // Ensure you have permission to record
//     if (await requestMicrophonePermission()) {
//       setState(() {
//         isRecording = true;
//       });
//
//       // Start recording without assigning to recordedAudioPath
//       await _recorder.startRecorder(toFile: 'audio.aac'); // Adjust file type as needed
//     }
//   }
//
//   Future<void> stopRecording() async {
//     recordedAudioPath = (await _recorder.stopRecorder())!;
//     setState(() {
//       isRecording = false;
//     });
//   }
//
//   void deleteAudio() {
//     setState(() {
//       recordedAudioPath = '';
//     });
//   }
//
//   Future<void> recordVideo() async {
//     // Ensure camera permission is granted
//     if (await requestCameraPermission()) {
//       // Add video recording functionality here
//       print("Camera permission granted. Start recording video...");
//     }
//   }
//
//   void deleteVideo() {
//     setState(() {
//       recordedVideoPath = '';
//       videoController?.dispose();
//     });
//   }
//
//   @override
//   void dispose() {
//     _recorder.closeAudioSession();
//     videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Onboarding Questions'),
//         backgroundColor: Colors.grey[850],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Describe your perfect hotspot:',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Container(
//               width: 358,
//               height: 159.11,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.05),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: TextField(
//                 controller: textController,
//                 maxLines: 5,
//                 maxLength: 600,
//                 decoration: InputDecoration(
//                   hintText: '/ Describe your perfect hotspot',
//                   hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             if (recordedAudioPath.isEmpty)
//               ElevatedButton(
//                 onPressed: isRecording ? stopRecording : startRecording,
//                 child: Text(isRecording ? 'Stop Recording' : 'Record Audio'),
//               ),
//             if (recordedAudioPath.isNotEmpty) ...[
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: deleteAudio,
//                     child: Text('Delete Audio'),
//                   ),
//                 ],
//               ),
//             ],
//             SizedBox(height: 20),
//             if (recordedVideoPath.isEmpty)
//               ElevatedButton(
//                 onPressed: recordVideo,
//                 child: Text('Record Video'),
//               ),
//             if (recordedVideoPath.isNotEmpty) ...[
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: deleteVideo,
//                     child: Text('Delete Video'),
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart'; // Add the Flutter Sound package for audio recording
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart'; // Add the video player package for video playback

class OnboardingQuestionScreen extends StatefulWidget {
  @override
  _OnboardingQuestionScreenState createState() => _OnboardingQuestionScreenState();
}

class _OnboardingQuestionScreenState extends State<OnboardingQuestionScreen> {
  TextEditingController textController = TextEditingController();
  late FlutterSoundRecorder _recorder; // For audio recording
  bool isRecording = false;
  String recordedAudioPath = '';
  late VideoPlayerController videoController; // For video playback
  String recordedVideoPath = '';

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    await _recorder.openAudioSession();
  }

  // Request microphone permission
  Future<bool> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Handle the case where permission is permanently denied
      _showPermissionDeniedDialog('Microphone');
      return false;
    }
    return false;
  }

  // Request camera permission
  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      _showPermissionDeniedDialog('Camera');
      return false;
    }
    return false;
  }

  // Show dialog when permission is denied
  void _showPermissionDeniedDialog(String permission) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$permission Permission Denied'),
        content: Text('Please enable $permission permission in settings to use this feature.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> startRecording() async {
    // Ensure you have permission to record
    if (await requestMicrophonePermission()) {
      setState(() {
        isRecording = true;
      });

      // Start recording
      await _recorder.startRecorder(toFile: 'audio.aac'); // Adjust file type as needed
    }
  }

  Future<void> stopRecording() async {
    recordedAudioPath = (await _recorder.stopRecorder())!;
    setState(() {
      isRecording = false;
    });
  }

  void deleteAudio() {
    setState(() {
      recordedAudioPath = '';
    });
  }

  Future<void> recordVideo() async {
    // Ensure camera permission is granted
    if (await requestCameraPermission()) {
      // Add video recording functionality here
      print("Camera permission granted. Start recording video...");
    }
  }

  void deleteVideo() {
    setState(() {
      recordedVideoPath = '';
      videoController?.dispose();
    });
  }

  @override
  void dispose() {
    _recorder.closeAudioSession();
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Onboarding Questions'),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Describe your perfect hotspot:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 358,
              height: 159.11,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: textController,
                maxLines: 5,
                maxLength: 600,
                decoration: InputDecoration(
                  hintText: '/ Describe your perfect hotspot',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (recordedAudioPath.isEmpty)
              ElevatedButton(
                onPressed: isRecording ? stopRecording : startRecording,
                child: Text(isRecording ? 'Stop Recording' : 'Record Audio'),
              ),
            if (recordedAudioPath.isNotEmpty) ...[
              Row(
                children: [
                  ElevatedButton(
                    onPressed: deleteAudio,
                    child: Text('Delete Audio'),
                  ),
                ],
              ),
            ],
            SizedBox(height: 20),
            if (recordedVideoPath.isEmpty)
              ElevatedButton(
                onPressed: recordVideo,
                child: Text('Record Video'),
              ),
            if (recordedVideoPath.isNotEmpty) ...[
              Row(
                children: [
                  ElevatedButton(
                    onPressed: deleteVideo,
                    child: Text('Delete Video'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
