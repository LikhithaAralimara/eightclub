// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class ExperienceSelectionScreen extends StatefulWidget {
// //   @override
// //   _ExperienceSelectionScreenState createState() => _ExperienceSelectionScreenState();
// // }
// //
// // class _ExperienceSelectionScreenState extends State<ExperienceSelectionScreen> {
// //   List<dynamic> experiences = [];
// //   Set<int> selectedExperiences = {};  // To store selected experience IDs
// //   TextEditingController textController = TextEditingController();  // Textfield controller
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchExperiences();
// //   }
// //
// //   Future<void> fetchExperiences() async {
// //     final response = await http.get(Uri.parse('https://staging.cos.8club.co/experiences'));
// //     if (response.statusCode == 200) {
// //       final jsonData = json.decode(response.body);
// //       setState(() {
// //         experiences = jsonData['data']['experiences'];
// //       });
// //     } else {
// //       throw Exception('Failed to load experiences');
// //     }
// //   }
// //
// //   // Toggle selection of experiences
// //   void toggleExperienceSelection(int id) {
// //     setState(() {
// //       if (selectedExperiences.contains(id)) {
// //         selectedExperiences.remove(id);
// //       } else {
// //         selectedExperiences.add(id);
// //       }
// //     });
// //   }
// //
// //   // Method to handle "Next" button press
// //   void onNextButtonPressed() {
// //     print("Selected Experience IDs: $selectedExperiences");
// //     print("User Text Input: ${textController.text}");
// //
// //     // Navigate to next page (you can replace with actual navigation logic)
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => NextPage()),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Select Experiences")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: experiences.isEmpty
// //                   ? Center(child: CircularProgressIndicator())
// //                   : GridView.builder(
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   crossAxisSpacing: 16.0,
// //                   mainAxisSpacing: 16.0,
// //                   childAspectRatio: 0.8,
// //                 ),
// //                 itemCount: experiences.length,
// //                 itemBuilder: (context, index) {
// //                   final experience = experiences[index];
// //                   final bool isSelected = selectedExperiences.contains(experience['id']);
// //                   return GestureDetector(
// //                     onTap: () => toggleExperienceSelection(experience['id']),
// //                     child: Stack(
// //                       children: [
// //                         ColorFiltered(
// //                           colorFilter: isSelected
// //                               ? ColorFilter.mode(
// //                             Colors.transparent,
// //                             BlendMode.multiply,
// //                           )
// //                               : ColorFilter.mode(
// //                             Colors.grey,
// //                             BlendMode.saturation,
// //                           ),
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               image: DecorationImage(
// //                                 image: NetworkImage(experience['image_url']),
// //                                 fit: BoxFit.cover,
// //                               ),
// //                               borderRadius: BorderRadius.circular(10.0),
// //                             ),
// //                           ),
// //                         ),
// //                         if (isSelected)
// //                           Positioned(
// //                             top: 8,
// //                             right: 8,
// //                             child: Icon(
// //                               Icons.check_circle,
// //                               color: Colors.green,
// //                               size: 24,
// //                             ),
// //                           ),
// //                         Positioned(
// //                           bottom: 8,
// //                           left: 8,
// //                           child: Text(
// //                             experience['name'],
// //                             style: TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             TextField(
// //               controller: textController,
// //               maxLines: 3,
// //               maxLength: 250,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter additional information...',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: onNextButtonPressed,
// //               child: Text('Next'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class NextPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Next Page")),
// //       body: Center(
// //         child: Text("This is the next page!"),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
//
// class ExperienceSelectionScreen extends StatefulWidget {
//   @override
//   _ExperienceSelectionScreenState createState() => _ExperienceSelectionScreenState();
// }
//
// class _ExperienceSelectionScreenState extends State<ExperienceSelectionScreen> {
//   List<dynamic> experiences = [];
//   Set<int> selectedExperiences = {};  // To store selected experience IDs
//   TextEditingController textController = TextEditingController();  // Textfield controller
//   Dio dio = Dio();  // Instantiate Dio
//
//   @override
//   void initState() {
//     super.initState();
//     fetchExperiences();
//   }
//
//   Future<void> fetchExperiences() async {
//     try {
//       final response = await dio.get('https://staging.cos.8club.co/experiences');
//       if (response.statusCode == 200) {
//         setState(() {
//           experiences = response.data['data']['experiences'];
//         });
//       }
//     } catch (e) {
//       print('Failed to load experiences: $e');
//     }
//   }
//
//   // Toggle selection of experiences
//   void toggleExperienceSelection(int id) {
//     setState(() {
//       if (selectedExperiences.contains(id)) {
//         selectedExperiences.remove(id);
//       } else {
//         selectedExperiences.add(id);
//       }
//     });
//   }
//
//   // Method to handle "Next" button press
//   void onNextButtonPressed() {
//     print("Selected Experience IDs: $selectedExperiences");
//     print("User Text Input: ${textController.text}");
//
//     // Navigate to next page (you can replace with actual navigation logic)
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => NextPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       // appBar: AppBar(title: Text("Select Experiences")),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100), // Adjust the height to your desired size
//         child: Container(
//           width: 390,
//           height: 100,
//           padding: const EdgeInsets.only(
//             top: 56,
//             left: 16,
//             right: 16,
//             bottom: 24,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.1),
//             // color: Colors.red
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 20,
//                 height: 20,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(),
//                 child: Icon(Icons.arrow_back,color: Colors.white,), // Placeholder, replace with your icon
//               ),
//               // const SizedBox(width: 39),
//               // Container(width: 240, height: 8, child: Stack()), // Placeholder for custom widget
//               Container(width: 250, height: 8,child:  Image.asset(
//                 'images/appbar1.jpg',
//                 fit: BoxFit.cover,
//               ),),
//
//               // const SizedBox(width: 39),
//               Container(
//                 width: 20,
//                 height: 20,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(),
//                 child: Icon(Icons.close,color: Colors.white,), // Placeholder, replace with your icon
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 width: 335,
//                 height: 92,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '01',
//                             style: TextStyle(
//                               color: Colors.white.withOpacity(0.1599999964237213),
//                               fontSize: 12,
//                               fontFamily: 'Space Grotesk',
//                               fontWeight: FontWeight.w400,
//                               // height: 0.11,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       'What kind of hotspots do you want to host?',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontFamily: 'Space Grotesk',
//                         fontWeight: FontWeight.w700,
//                         // height: 0.06,
//                         letterSpacing: -0.48,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Expanded(
//             //   child: experiences.isEmpty
//             //       ? Center(child: CircularProgressIndicator())
//             //       : GridView.builder(
//             //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //       crossAxisCount: 2,
//             //       crossAxisSpacing: 16.0,
//             //       mainAxisSpacing: 16.0,
//             //       childAspectRatio: 0.8,
//             //     ),
//             //     itemCount: experiences.length,
//             //     itemBuilder: (context, index) {
//             //       final experience = experiences[index];
//             //       final bool isSelected = selectedExperiences.contains(experience['id']);
//             //       return GestureDetector(
//             //         onTap: () => toggleExperienceSelection(experience['id']),
//             //         child: Stack(
//             //           children: [
//             //             ColorFiltered(
//             //               colorFilter: isSelected
//             //                   ? ColorFilter.mode(
//             //                 Colors.transparent,
//             //                 BlendMode.multiply,
//             //               )
//             //                   : ColorFilter.mode(
//             //                 Colors.grey,
//             //                 BlendMode.saturation,
//             //               ),
//             //               child: Container(
//             //                 decoration: BoxDecoration(
//             //                   image: DecorationImage(
//             //                     image: NetworkImage(experience['image_url']),
//             //                     fit: BoxFit.cover,
//             //                   ),
//             //                   borderRadius: BorderRadius.circular(10.0),
//             //                 ),
//             //               ),
//             //             ),
//             //             if (isSelected)
//             //               Positioned(
//             //                 top: 8,
//             //                 right: 8,
//             //                 child: Icon(
//             //                   Icons.check_circle,
//             //                   color: Colors.green,
//             //                   size: 24,
//             //                 ),
//             //               ),
//             //             // Positioned(
//             //             //   bottom: 8,
//             //             //   left: 8,
//             //             //   child: Text(
//             //             //     experience['name'],
//             //             //     style: TextStyle(
//             //             //       color: Colors.white,
//             //             //       fontSize: 16,
//             //             //       fontWeight: FontWeight.bold,
//             //             //     ),
//             //             //   ),
//             //             // ),
//             //           ],
//             //         ),
//             //       );
//             //     },
//             //   ),
//             // ),
//             Expanded(
//               child: experiences.isEmpty
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: experiences.length,
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 itemBuilder: (context, index) {
//                   // print(experiences[index]);
//                   final experience = experiences[index];
//                   final bool isSelected = selectedExperiences.contains(experience['id']);
//                   return GestureDetector(
//                     onTap: () => toggleExperienceSelection(experience['id']),
//                     child: Stack(
//                       children: [
//                         ColorFiltered(
//                           colorFilter: isSelected
//                               ? ColorFilter.mode(
//                             Colors.transparent,
//                             BlendMode.multiply,
//                           )
//                               : ColorFilter.mode(
//                             Colors.grey,
//                             BlendMode.saturation,
//                           ),
//                           child:
//                           Transform(
//                           transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(experience['id'] % 2 == 0 ? -0.05 : 0.05),
//                           child:
//                           Container(
//
//                   height:96,
//                             width: 96, // Adjust width as needed
//                             margin: const EdgeInsets.only(right: 16.0), // Spacing between cards
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(experience['image_url']),
//                                 fit: BoxFit.cover,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),)
//                         ),
//                         // if (isSelected)
//                         //   Positioned(
//                         //     top: 8,
//                         //     right: 8,
//                         //     child: Icon(
//                         //       Icons.check_circle,
//                         //       color: Colors.green,
//                         //       size: 24,
//                         //     ),
//                         //   ),
//                         // Uncomment this block if you want to display the experience name
//                         // Positioned(
//                         //   bottom: 8,
//                         //   left: 8,
//                         //   child: Text(
//                         //     experience['name'],
//                         //     style: TextStyle(
//                         //       color: Colors.white,
//                         //       fontSize: 16,
//                         //       fontWeight: FontWeight.bold,
//                         //     ),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             SizedBox(height: 20),
//             TextField(
//               controller: textController,
//               maxLines: 3,
//               maxLength: 250,
//               decoration: InputDecoration(
//                 hintText: 'Enter additional information...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: onNextButtonPressed,
//               child: Text('Next'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Next Page")),
//       body: Center(
//         child: Text("This is the next page!"),
//       ),
//     );
//   }
// }
import 'package:eightclub/OnBoardingQuestionScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ExperienceSelectionScreen extends StatefulWidget {
  @override
  _ExperienceSelectionScreenState createState() => _ExperienceSelectionScreenState();
}

class _ExperienceSelectionScreenState extends State<ExperienceSelectionScreen> {
  List<dynamic> experiences = [];
  Set<int> selectedExperiences = {}; // To store selected experience IDs
  TextEditingController textController = TextEditingController(); // Textfield controller
  Dio dio = Dio(); // Instantiate Dio

  @override
  void initState() {
    super.initState();
    fetchExperiences();
  }

  Future<void> fetchExperiences() async {
    try {
      final response = await dio.get('https://staging.cos.8club.co/experiences');
      if (response.statusCode == 200) {
        setState(() {
          experiences = response.data['data']['experiences'];
        });
      }
    } catch (e) {
      print('Failed to load experiences: $e');
    }
  }

  // Toggle selection of experiences
  void toggleExperienceSelection(int id) {
    setState(() {
      if (selectedExperiences.contains(id)) {
        selectedExperiences.remove(id);
      } else {
        selectedExperiences.add(id);
      }
    });
  }

  // Method to handle "Next" button press
  void onNextButtonPressed() {
    print("Selected Experience IDs: $selectedExperiences");
    print("User Text Input: ${textController.text}");

    // Navigate to next page (you can replace with actual navigation logic)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnboardingQuestionScreen()
          // NextPage()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Adjust the height to your desired size
        child: Container(
          width: 390,
          height: 100,
          padding: const EdgeInsets.only(
            top: 56,
            left: 16,
            right: 16,
            bottom: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Icon(Icons.arrow_back, color: Colors.white,), // Placeholder, replace with your icon
              ),
              Container(
                width: 250,
                height: 8,
                child: Image.asset(
                  'images/appbar1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Icon(Icons.close, color: Colors.white,), // Placeholder, replace with your icon
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          Expanded(
          flex: 3,
            child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                width: 335,
                // height: 92,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '01',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.1599999964237213),
                              fontSize: 12,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,

                      child: Text(
                        'What kind of hotspots do you want to host?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.48,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: experiences.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: experiences.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final experience = experiences[index];
                  final bool isSelected = selectedExperiences.contains(experience['id']);
                  return GestureDetector(
                    onTap: () => toggleExperienceSelection(experience['id']),
                    child: Stack(
                      children: [
                          Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(index % 2 == 0 ? -0.05 : 0.05), // Alternate rotation
                            child: Opacity(
                              opacity:isSelected?1:0.35,
                              child:
                                Container(
                                  height: 96,
                                  width: 96, // Adjust width as needed
                                  margin: const EdgeInsets.only(right: 16.0), // Spacing between cards
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(experience['image_url']),
                                      fit: BoxFit.fitHeight,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 20),

            Expanded(
              flex: 3,
              child: Container(
                width: 358,
                // height: 159.11,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05), // Adjusted opacity for better readability
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.transparent), // Optional: Add a border if needed
                ),
                child: TextField(
                  controller: textController,
                  maxLines: null, // Allows for multiple lines of input
                  decoration: InputDecoration(
                    hintText: '/ Describe your perfect hotspot',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5), // Hint text color and opacity
                    ),
                    border: InputBorder.none, // Removes the default underline
                    contentPadding: EdgeInsets.zero, // Adjust padding as needed
                  ),
                  style: TextStyle(
                    color: Colors.white, // Text color when typing
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            GestureDetector(
              onTap: onNextButtonPressed,
              child: Container(
                width: 358,
                // height: 56,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0.50, 0.49),
                    radius: 25.53,
                    colors: [Color(0xFF222222), Color(0xFF999999), Color(0xFF222222)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0x7F101010)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    ),
                    // const SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: 24,
                      height: 24,
                      child: Icon(Icons.arrow_forward,color: Colors.white,),
                    ),
                  ],
                ),
              ),
            )
            // ElevatedButton(
            //   onPressed: onNextButtonPressed,
            //   child: Text('Next'),
            // ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page")),
      body: Center(
        child: Text("This is the next page!"),
      ),
    );
  }
}
