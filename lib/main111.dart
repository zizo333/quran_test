// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'المصحف الرقمي',
//       theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'UthmanicHafs'),
//       home: const MushafScreen(),
//     );
//   }
// }

// class MushafScreen extends StatefulWidget {
//   const MushafScreen({super.key});

//   @override
//   State<MushafScreen> createState() => _MushafScreenState();
// }

// class _MushafScreenState extends State<MushafScreen> {
//   List<dynamic> quranData = [];
//   int currentPage = 0;
//   bool isLoading = true;
//   List<bool> showAyah = [];

//   @override
//   void initState() {
//     super.initState();
//     loadQuranData();
//   }

//   Future<void> loadQuranData() async {
//     try {
//       final data = await rootBundle.loadString('assets/data/quran.json');
//       final jsonData = json.decode(data);
//       setState(() {
//         quranData = jsonData;
//         showAyah = List.filled(quranData.length, true);
//         isLoading = false;
//       });
//     } catch (e) {
//       debugPrint('Error loading Quran data: $e');
//     }
//   }

//   void toggleAyahVisibility(int index) {
//     setState(() {
//       showAyah[index] = !showAyah[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text('المصحف الرقمي'), centerTitle: true),
//       body: PageView.builder(
//         itemCount: quranData.length,
//         onPageChanged: (index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         itemBuilder: (context, pageIndex) {
//           final surah = quranData[pageIndex];
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 // اسم السورة
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 20),
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Colors.green.withOpacity(0.3),
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   child: Text(
//                     'سورة ${surah['name']}',
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ),

//                 // آيات السورة
//                 Column(
//                   children: List.generate(surah['verses'].length, (ayahIndex) {
//                     final ayah = surah['verses'][ayahIndex];
//                     return GestureDetector(
//                       onTap: () => toggleAyahVisibility(ayahIndex),
//                       child: Container(
//                         margin: const EdgeInsets.only(bottom: 15),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             // نص الآية
//                             Text(
//                               showAyah[ayahIndex] ? ayah['text'] : '﷽',
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 color:
//                                     showAyah[ayahIndex]
//                                         ? Colors.black
//                                         : Colors.grey[400],
//                                 fontFamily: 'UthmanicHafs',
//                               ),
//                             ),
//                             // رقم الآية
//                             if (showAyah[ayahIndex])
//                               Container(
//                                 margin: const EdgeInsets.only(top: 5),
//                                 child: Text(
//                                   ayah['id'].toString(),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.green[700],
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'الصفحة ${currentPage + 1} من ${quranData.length}',
//                 style: const TextStyle(fontSize: 16),
//               ),
//               Text(
//                 'سورة ${quranData[currentPage]['name']}',
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // void main() {
// //   runApp(const QuranApp());
// // }

// // class QuranApp extends StatelessWidget {
// //   const QuranApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'المصحف الرقمي',
// //       theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'UthmanicHafs'),
// //       home: const MushafPage(),
// //     );
// //   }
// // }

// // class MushafPage extends StatefulWidget {
// //   const MushafPage({super.key});

// //   @override
// //   State<MushafPage> createState() => _MushafPageState();
// // }

// // class _MushafPageState extends State<MushafPage> {
// //   List<dynamic> _quranData = [];
// //   bool _isLoading = true;
// //   final Map<int, String> _surahNames = {
// //     1: "الفاتحة",
// //     2: "البقرة" /* أضف بقية السور... */,
// //   };

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadQuranData();
// //   }

// //   Future<void> _loadQuranData() async {
// //     try {
// //       final data = await rootBundle.loadString('assets/data/quran.json');
// //       setState(() {
// //         _quranData = json.decode(data);
// //         _isLoading = false;
// //       });
// //     } catch (e) {
// //       debugPrint('Error loading Quran data: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('المصحف الرقمي'), centerTitle: true),
// //       body:
// //           _isLoading
// //               ? const Center(child: CircularProgressIndicator())
// //               : PageView.builder(
// //                 itemCount: _quranData.length,
// //                 itemBuilder: (context, surahIndex) {
// //                   final surah = _quranData[surahIndex];
// //                   return SingleChildScrollView(
// //                     padding: const EdgeInsets.all(16),
// //                     child: Column(
// //                       children: [
// //                         // عنوان السورة
// //                         Container(
// //                           padding: const EdgeInsets.symmetric(vertical: 16),
// //                           child: Text(
// //                             'سورة ${_surahNames[surah['id']] ?? '${surah['id']}'}',
// //                             style: const TextStyle(
// //                               fontSize: 28,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.green,
// //                             ),
// //                           ),
// //                         ),
// //                         // آيات السورة
// //                         ListView.builder(
// //                           physics: const NeverScrollableScrollPhysics(),
// //                           shrinkWrap: true,
// //                           itemCount: surah['verses'].length,
// //                           itemBuilder: (context, ayahIndex) {
// //                             return AyahWidget(
// //                               text: surah['verses'][ayahIndex]['text'],
// //                               number: surah['verses'][ayahIndex]['id'],
// //                             );
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //     );
// //   }
// // }

// // class AyahWidget extends StatefulWidget {
// //   final String text;
// //   final int number;

// //   const AyahWidget({required this.text, required this.number, super.key});

// //   @override
// //   State<AyahWidget> createState() => _AyahWidgetState();
// // }

// // class _AyahWidgetState extends State<AyahWidget> {
// //   bool _isVisible = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () => setState(() => _isVisible = !_isVisible),
// //       child: Container(
// //         margin: const EdgeInsets.only(bottom: 12),
// //         padding: const EdgeInsets.all(12),
// //         decoration: BoxDecoration(
// //           color: _isVisible ? Colors.white : Colors.grey[200],
// //           borderRadius: BorderRadius.circular(8),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.grey.withOpacity(0.1),
// //               blurRadius: 3,
// //               offset: const Offset(0, 1),
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           children: [
// //             // نص الآية
// //             Text(
// //               _isVisible ? widget.text : '﷽',
// //               textAlign: TextAlign.right,
// //               style: TextStyle(
// //                 fontSize: 24,
// //                 color: _isVisible ? Colors.black : Colors.grey,
// //                 fontFamily: 'UthmanicHafs',
// //               ),
// //             ),
// //             // رقم الآية
// //             if (_isVisible)
// //               Container(
// //                 margin: const EdgeInsets.only(top: 8),
// //                 padding: const EdgeInsets.all(4),
// //                 decoration: BoxDecoration(
// //                   color: Colors.green[50],
// //                   shape: BoxShape.circle,
// //                 ),
// //                 child: Text(
// //                   widget.number.toString(),
// //                   style: const TextStyle(fontSize: 14, color: Colors.green),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter/services.dart' as rootBundle;

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'اختبار القرآن',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: QuranQuizPage(),
// //     );
// //   }
// // }

// // class QuranQuizPage extends StatefulWidget {
// //   const QuranQuizPage({super.key});

// //   @override
// //   _QuranQuizPageState createState() => _QuranQuizPageState();
// // }

// // class _QuranQuizPageState extends State<QuranQuizPage> {
// //   List<dynamic> quranData = [];
// //   int currentSurahIndex = 0;
// //   int currentAyahIndex = 0;
// //   List<bool> revealedAyat = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     loadQuranData();
// //   }

// //   Future<void> loadQuranData() async {
// //     final jsonData = await rootBundle.rootBundle.loadString(
// //       'assets/data/quran.json',
// //     );
// //     setState(() {
// //       quranData = json.decode(jsonData);
// //       if (quranData.isNotEmpty &&
// //           quranData[currentSurahIndex]['verses'].isNotEmpty) {
// //         revealedAyat = List.filled(
// //           quranData[currentSurahIndex]['verses'].length,
// //           false,
// //         );
// //         revealedAyat[0] = true; // إظهار الآية الأولى فقط
// //       }
// //     });
// //   }

// //   void toggleAyahVisibility(int index) {
// //     setState(() {
// //       revealedAyat[index] = !revealedAyat[index];
// //     });
// //   }

// //   void nextAyah() {
// //     if (currentAyahIndex < quranData[currentSurahIndex]['verses'].length - 1) {
// //       setState(() {
// //         currentAyahIndex++;
// //         revealedAyat[currentAyahIndex] = true;
// //       });
// //     } else if (currentSurahIndex < quranData.length - 1) {
// //       // انتقل إلى السورة التالية
// //       setState(() {
// //         currentSurahIndex++;
// //         currentAyahIndex = 0;
// //         revealedAyat = List.filled(
// //           quranData[currentSurahIndex]['verses'].length,
// //           false,
// //         );
// //         revealedAyat[0] = true;
// //       });
// //     }
// //   }

// //   void previousAyah() {
// //     if (currentAyahIndex > 0) {
// //       setState(() {
// //         currentAyahIndex--;
// //         revealedAyat[currentAyahIndex] = true;
// //       });
// //     } else if (currentSurahIndex > 0) {
// //       // انتقل إلى السورة السابقة
// //       setState(() {
// //         currentSurahIndex--;
// //         currentAyahIndex = quranData[currentSurahIndex]['verses'].length - 1;
// //         revealedAyat = List.filled(
// //           quranData[currentSurahIndex]['verses'].length,
// //           false,
// //         );
// //         revealedAyat[currentAyahIndex] = true;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (quranData.isEmpty) {
// //       return Scaffold(body: Center(child: CircularProgressIndicator()));
// //     }

// //     final surah = quranData[currentSurahIndex];
// //     final ayah = surah['verses'][currentAyahIndex];

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('اختبار القرآن - ${surah['name']}'),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: surah['verses'].length,
// //                 itemBuilder: (context, index) {
// //                   final verse = surah['verses'][index];
// //                   return GestureDetector(
// //                     onTap: () => toggleAyahVisibility(index),
// //                     child: Container(
// //                       margin: EdgeInsets.symmetric(vertical: 8.0),
// //                       padding: EdgeInsets.all(16.0),
// //                       decoration: BoxDecoration(
// //                         color:
// //                             revealedAyat[index]
// //                                 ? Colors.white
// //                                 : Colors.grey[200],
// //                         borderRadius: BorderRadius.circular(10),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.grey.withOpacity(0.3),
// //                             spreadRadius: 1,
// //                             blurRadius: 3,
// //                             offset: Offset(0, 2),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.end,
// //                         children: [
// //                           Text(
// //                             revealedAyat[index]
// //                                 ? verse['text']
// //                                 : 'اضغط لإظهار الآية',
// //                             textAlign: TextAlign.right,
// //                             style: TextStyle(
// //                               fontSize: 24,
// //                               fontFamily: 'UthmanicHafs',
// //                               color:
// //                                   revealedAyat[index]
// //                                       ? Colors.black
// //                                       : Colors.grey,
// //                             ),
// //                           ),
// //                           if (revealedAyat[index])
// //                             Text(
// //                               '(${index + 1})',
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.blue,
// //                               ),
// //                             ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 ElevatedButton(onPressed: previousAyah, child: Text('السابقة')),
// //                 ElevatedButton(onPressed: nextAyah, child: Text('التالية')),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
