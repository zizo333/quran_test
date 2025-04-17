import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/presentation/widgets/app_scaffold.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // padding: AppSizes.screenPadding,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(quran.getSurahName(18)),
        ),
        body: Center(
          child: Text(
            '${quran.getVerse(10, 5)} {٥} ',
            style: TextStyle(fontSize: 22.sp, height: 1.7),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quran/quran.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as m;
// import 'package:flutter/services.dart';
// import 'package:quran/quran.dart' as quran;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wakelock_plus/wakelock_plus.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// class QuranReadingPage extends StatefulWidget {
//   const QuranReadingPage({super.key});

//   @override
//   State<QuranReadingPage> createState() => _QuranReadingPageState();
// }

// class _QuranReadingPageState extends State<QuranReadingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class QuranDetailsPage extends StatefulWidget {
//   // var highlighSurah;
//   QuranDetailsPage(
//       {required this.pageNumber, required this.jsonData, required this.shouldHighlightText, required this.highlightVerse, required this.quarterJsonData, required this.shouldHighlightSura, super.key,});
//   int pageNumber;
//   var jsonData;
//   var quarterJsonData;
//   final bool shouldHighlightText;
//   var highlightVerse;
//   var shouldHighlightSura;

//   @override
//   State<QuranDetailsPage> createState() => QuranDetailsPageState();
// }

// class QuranDetailsPageState extends State<QuranDetailsPage> {
//   final ScrollController _scrollController = ScrollController();
  

//   var currentVersePlaying;
//   int index = 0;
//   void setIndex() {
//     setState(() {
//       index = widget.pageNumber;
//     });
//   }

//   double valueOfSlider = 0;

//   late Timer timer;
//   Directory? appDir;
//   Future<void> initialize() async {
//     appDir = await getTemporaryDirectory();
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   Future<void> checkIfSelectHighlight() async {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (selectedSpan != '') {
//         setState(() {
//           selectedSpan = '';
//         });
//       }
//     });
//   }

//   int playIndexPage = 0;

//   @override
//   void initState() {
//     initialize();
//     checkIfSelectHighlight();
//     setIndex();
//     changeHighlightSurah();
//     highlightVerseFunction();
//     _scrollController.addListener(_scrollListener);

//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

//     _pageController = PageController(initialPage: index);
//     _pageController.addListener(_pagecontroller_scrollListner);
//     WakelockPlus.enable();
//     super.initState();
//   }


//   void _scrollListener() {
//     if (_scrollController.position.isScrollingNotifier.value &&
//         selectedSpan != '') {
//       setState(() {
//         selectedSpan = '';
//       });
//     } else {}
//   }

//   void _pagecontroller_scrollListner() {
//     if (_pageController.position.isScrollingNotifier.value &&
//         selectedSpan != '') {
//       setState(() {
//         selectedSpan = '';
//       });
//     } else {}
//   }

//   var highlightVerse;
//   var shouldHighlightText;
//   Future<void> changeHighlightSurah() async {
//     await Future.delayed(const Duration(seconds: 2));
//     widget.shouldHighlightSura = false;
//   }

//   void highlightVerseFunction() {
//     setState(() {
//       shouldHighlightText = widget.shouldHighlightText;
//     });
//     if (widget.shouldHighlightText) {
//       setState(() {
//         highlightVerse = widget.highlightVerse;
//       });

//       Timer.periodic(const Duration(milliseconds: 400), (timer) {
//         if (mounted) {
//           setState(() {
//             shouldHighlightText = false;
//           });
//         }
//         Timer(const Duration(milliseconds: 200), () {
//           if (mounted) {
//             setState(() {
//               shouldHighlightText = true;
//             });
//           }
//           if (timer.tick == 4) {
//             if (mounted) {
//               setState(() {
//                 highlightVerse = '';

//                 shouldHighlightText = false;
//               });
//             }
//             timer.cancel();
//           }
//         });
//       });
//     }
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

//     WakelockPlus.disable();
//     getTotalCharacters(quran.getVersesTextByPage(widget.pageNumber));
//     super.dispose();
//   }

//   int total = 0;
//   int total1 = 0;
//   int total3 = 0;
//   int getTotalCharacters(List<String> stringList) {
//     total = 0;
//     for (final str in stringList) {
//       total += str.length;
//     }
//     // print(total);
//     return total;
//   }

//   void checkIfAyahIsAStartOfSura() {}
//   String? swipeDirection;
//   late PageController _pageController;

//   RegExp english = RegExp('[a-zA-Z]');

//   String selectedSpan = '';

//   late Uint8List _imageFile;
//   Result checkIfPageIncludesQuarterAndQuarterIndex(array, pageData, indexes) {
//     for (var i = 0; i < array.length; i++) {
//       final int surah = array[i]['surah'];
//       final int ayah = array[i]['ayah'];
//       for (var j = 0; j < pageData.length; j++) {
//         final int pageSurah = pageData[j]['surah'];
//         final int start = pageData[j]['start'];
//         final int end = pageData[j]['end'];
//         if ((surah == pageSurah) && (ayah >= start) && (ayah <= end)) {
//           final targetIndex = i + 1;
//           for (var hizbIndex = 0; hizbIndex < indexes.length; hizbIndex++) {
//             final List<int> hizb = indexes[hizbIndex];
//             for (var quarterIndex = 0;
//                 quarterIndex < hizb.length;
//                 quarterIndex++) {
//               if (hizb[quarterIndex] == targetIndex) {
//                 return Result(true, i, hizbIndex, quarterIndex);
//               }
//             }
//           }
//         }
//       }
//     }
//     return Result(false, -1, -1, -1);
//   } //Create an instance of ScreenshotController

//   double currentHeight = 2;
//   double currentLetterSpacing = 0;
//   final bool _isVisible = true;

//   List<GlobalKey> richTextKeys = List.generate(
//     604,
//     (_) => GlobalKey(),
//   );
//   GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       key: scaffoldKey,
//       endDrawer: SizedBox(
//         height: screenSize.height,
//         width: screenSize.width * .5,
//       ),
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           Builder(
//             builder: (context2) {
//               if (getValue('alignmentType') == 'pageview') {
//                 return PageView.builder(
//                   physics: const CustomPageViewScrollPhysics(),
//                   onPageChanged: (a) {
//                     setState(() {
//                       selectedSpan = '';
//                     });
//                     index = a;
//                     updateValue('lastRead', a);
//                   },
//                   controller: _pageController,
//                   // onPageChanged: _onPageChanged,
//                   reverse: context.locale.languageCode == 'ar' ? false : true,
//                   itemCount: quran.totalPagesCount +
//                       1 /* specify the total number of pages */,
//                   itemBuilder: (context, index) {
//                     final isEvenPage = index.isEven;

//                     if (index == 0) {
//                       return ColoredBox(
//                         color: const Color(0xffFFFCE7),
//                         child: Image.asset(
//                           'assets/images/quran.jpg',
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     }

//                     return Container(
//                       decoration: BoxDecoration(
//                           color:
//                               backgroundColors[getValue('quranPageolorsIndex')],
//                           boxShadow: [
//                             if (isEvenPage) // Add shadow only for even-numbered pages
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius:
//                                     5, // Controls the spread of the shadow
//                                 blurRadius: 10, // Controls the blur effect
//                                 offset: const Offset(
//                                     -5, 0,), // Left side shadow for even numbers
//                               ),
//                           ],
//                           //index % 2 == 0
//                           border: Border.fromBorderSide(BorderSide(
//                               color:
//                                   primaryColors[getValue('quranPageolorsIndex')]
//                                       .withOpacity(.05),),),),
//                       child: Scaffold(
//                         resizeToAvoidBottomInset: false,
//                         backgroundColor: Colors.transparent,
//                         body: SafeArea(
//                           child: Padding(
//                             padding: EdgeInsets.only(right: 12.0.w, left: 12.w),
//                             child: SingleChildScrollView(
//                               // physics: const ClampingScrollPhysics(),
//                               controller: _scrollController,
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     width: screenSize.width,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: (screenSize.width * .27).w,
//                                           child: Row(
//                                             children: [
//                                               IconButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                   icon: Icon(
//                                                     Icons.arrow_back_ios,
//                                                     size: 24.sp,
//                                                     color: secondaryColors[getValue(
//                                                         'quranPageolorsIndex',)],
//                                                   ),),
//                                               Text(
//                                                   widget.jsonData[
//                                                       quran.getPageData(
//                                                                   index,)[0]
//                                                               ['surah'] -
//                                                           1]['name'],
//                                                   style: TextStyle(
//                                                       color: secondaryColors[
//                                                           getValue(
//                                                               'quranPageolorsIndex',)],
//                                                       fontFamily: 'Taha',
//                                                       fontSize: 14.sp,),),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: (screenSize.width * .32).w,
//                                           child: Center(
//                                             child: Stack(
//                                               children: [
//                                                 if (checkIfPageIncludesQuarterAndQuarterIndex(
//                                                         widget.quarterJsonData,
//                                                         quran
//                                                             .getPageData(index),
//                                                         indexes,)
//                                                     .includesQuarter)
//                                                   if (checkIfPageIncludesQuarterAndQuarterIndex(
//                                                           widget
//                                                               .quarterJsonData,
//                                                           quran.getPageData(
//                                                               index,),
//                                                           indexes,)
//                                                       .includesQuarter)
//                                                     EasyContainer(
//                                                       borderRadius: 12.r,
//                                                       color: secondaryColors[
//                                                               getValue(
//                                                                   'quranPageolorsIndex',)]
//                                                           .withOpacity(.5),
//                                                       borderColor: primaryColors[
//                                                           getValue(
//                                                               'quranPageolorsIndex',)],
//                                                       showBorder: true,
//                                                       height: 20.h,
//                                                       width: 160.w,
//                                                       padding: 0,
//                                                       margin: 0,
//                                                       child: Text(
//                                                         checkIfPageIncludesQuarterAndQuarterIndex(
//                                                                         widget
//                                                                             .quarterJsonData,
//                                                                         quran.getPageData(
//                                                                             index,),
//                                                                         indexes,)
//                                                                     .includesQuarter ==
//                                                                 true
//                                                             ? "${"page".tr()} $index | ${(checkIfPageIncludesQuarterAndQuarterIndex(widget.quarterJsonData, quran.getPageData(index), indexes).quarterIndex + 1) == 1 ? "" : "${checkIfPageIncludesQuarterAndQuarterIndex(widget.quarterJsonData, quran.getPageData(index), indexes).quarterIndex}/${4}"} ${"hizb".tr()} ${checkIfPageIncludesQuarterAndQuarterIndex(widget.quarterJsonData, quran.getPageData(index), indexes).hizbIndex + 1} | ${"juz".tr()} ${getJuzNumber(getPageData(index)[0]["surah"], getPageData(index)[0]["start"])} "
//                                                             : "${"page".tr()} $index | ${"juz".tr()} ${getJuzNumber(getPageData(index)[0]["surah"], getPageData(index)[0]["start"])}",
//                                                         style: TextStyle(
//                                                           fontFamily:
//                                                               'aldahabi',
//                                                           fontSize: 10.sp,
//                                                           color: backgroundColors[
//                                                               getValue(
//                                                                   'quranPageolorsIndex',)],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                 if (checkIfPageIncludesQuarterAndQuarterIndex(
//                                                             widget
//                                                                 .quarterJsonData,
//                                                             quran.getPageData(
//                                                                 index,),
//                                                             indexes,)
//                                                         .includesQuarter ==
//                                                     false)
//                                                   EasyContainer(
//                                                     borderRadius: 12.r,
//                                                     color: secondaryColors[getValue(
//                                                             'quranPageolorsIndex',)]
//                                                         .withOpacity(.5),
//                                                     borderColor: backgroundColors[
//                                                         getValue(
//                                                             'quranPageolorsIndex',)],
//                                                     showBorder: true,
//                                                     height: 20.h,
//                                                     width: 120.w,
//                                                     padding: 0,
//                                                     margin: 0,
//                                                     child: Center(
//                                                       child: Text(
//                                                         "${"page".tr()} $index | ${"juz".tr()} ${getJuzNumber(getPageData(index)[0]["surah"], getPageData(index)[0]["start"])}",
//                                                         style: TextStyle(
//                                                           fontFamily:
//                                                               'aldahabi',
//                                                           fontSize: 12.sp,
//                                                           color: backgroundColors[
//                                                               getValue(
//                                                                   'quranPageolorsIndex',)],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: (screenSize.width * .27).w,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                             children: [
//                                               IconButton(
//                                                   onPressed: () {
//                                                     showSettingsSheet(context);
//                                                   },
//                                                   icon: Icon(
//                                                     Icons.settings,
//                                                     size: 24.sp,
//                                                     color: secondaryColors[getValue(
//                                                         'quranPageolorsIndex',)],
//                                                   ),),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   if (index == 1 || index == 2)
//                                     SizedBox(
//                                       height: screenSize.height * .15,
//                                     ),
//                                   BlocBuilder<QuranPagePlayerBloc,
//                                           QuranPagePlayerState>(
//                                       bloc: qurapPagePlayerBloc,
//                                       builder: (context, state) {
//                                         if (state is QuranPagePlayerInitial ||
//                                             state is QuranPagePlayerIdle) {
//                                           return Directionality(
//                                               textDirection:
//                                                   m.TextDirection.rtl,
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(0),
//                                                 child: SizedBox(
//                                                   width: double.infinity,
//                                                   child: RichText(
//                                                     key:
//                                                         richTextKeys[index - 1],
//                                                     textDirection:
//                                                         m.TextDirection.rtl,
//                                                     textAlign: (index == 1 ||
//                                                             index == 2 ||
//                                                             index > 570)
//                                                         ? TextAlign.center
//                                                         : TextAlign.center,
//                                                     locale: const Locale('ar'),
//                                                     text: TextSpan(
//                                                       style: TextStyle(
//                                                         color: primaryColors[
//                                                             getValue(
//                                                                 'quranPageolorsIndex',)],
//                                                         fontSize: getValue(
//                                                                 'pageViewFontSize',)
//                                                             .toDouble(),
//                                                         fontFamily: getValue(
//                                                             'selectedFontFamily',),
//                                                       ),
//                                                       children: quran
//                                                           .getPageData(index)
//                                                           .expand((e) {
//                                                         final spans =
//                                                             <InlineSpan>[];
//                                                         for (var i = e['start'];
//                                                             i <= e['end'];
//                                                             i++) {
//                                                           // Header
//                                                           if (i == 1) {
//                                                             spans
//                                                                 .add(WidgetSpan(
//                                                               child: HeaderWidget(
//                                                                   e: e,
//                                                                   jsonData: widget
//                                                                       .jsonData,),
//                                                             ),);
//                                                             if (index != 187 &&
//                                                                 index != 1) {
//                                                               spans.add(
//                                                                   WidgetSpan(
//                                                                 child: Basmallah(
//                                                                     index: getValue(
//                                                                         'quranPageolorsIndex',),),
//                                                               ),);
//                                                             }
//                                                             if (index == 187) {
//                                                               spans.add(
//                                                                   WidgetSpan(
//                                                                 child:
//                                                                     Container(
//                                                                   height: 10.h,
//                                                                 ),
//                                                               ),);
//                                                             }
//                                                           }

//                                                           // Verses
//                                                           spans.add(TextSpan(
//                                                             recognizer:
//                                                                 LongPressGestureRecognizer()
//                                                                   ..onLongPress =
//                                                                       () {
//                                                                     showAyahOptionsSheet(
//                                                                         index,
//                                                                         e['surah'],
//                                                                         i,);
//                                                                     print(
//                                                                         'longpressed',);
//                                                                   }
//                                                                   ..onLongPressDown =
//                                                                       (details) {
//                                                                     setState(
//                                                                         () {
//                                                                       selectedSpan =
//                                                                           " ${e["surah"]}$i";
//                                                                     });
//                                                                   }
//                                                                   ..onLongPressUp =
//                                                                       () {
//                                                                     setState(
//                                                                         () {
//                                                                       selectedSpan =
//                                                                           '';
//                                                                     });
//                                                                     print(
//                                                                         'finished long press',);
//                                                                   }
//                                                                   ..onLongPressCancel =
//                                                                       () =>
//                                                                           setState(
//                                                                               () {
//                                                                             selectedSpan =
//                                                                                 '';
//                                                                           }),
//                                                             text: i ==
//                                                                     e['start']
//                                                                 ? "${quran.getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(0, 1)}\u200A${quran.getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(1)}"
//                                                                 : quran
//                                                                     .getVerseQCF(
//                                                                         e[
//                                                                             'surah'],
//                                                                         i,)
//                                                                     .replaceAll(
//                                                                         ' ',
//                                                                         '',),
//                                                             //  i == e["start"]
//                                                             // ? "${quran.getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(0, 1)}\u200A${quran.getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(1).substring(0,  quran.getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(1).length - 1)}"
//                                                             // :
//                                                             // quran.getVerseQCF(e["surah"], i).replaceAll(' ', '').substring(0,  quran.getVerseQCF(e["surah"], i).replaceAll(' ', '').length - 1),
//                                                             style: TextStyle(
//                                                               color: bookmarks
//                                                                       .where((element) =>
//                                                                           element['suraNumber'] ==
//                                                                               e[
//                                                                                   'surah'] &&
//                                                                           element['verseNumber'] ==
//                                                                               i,)
//                                                                       .isNotEmpty
//                                                                   ? Color(int.parse(
//                                                                       "0x${bookmarks.where((element) => element["suraNumber"] == e["surah"] && element["verseNumber"] == i).first["color"]}",),)
//                                                                   : primaryColors[
//                                                                       getValue(
//                                                                           'quranPageolorsIndex',)],
//                                                               height:
//                                                                (index ==
//                                                                           1 ||
//                                                                       index ==
//                                                                           2)
//                                                                   ? 2.h
//                                                                   : 1.95.h
//                                                                   ,
//                                                               letterSpacing:
//                                                                   0.w,
//                                                               wordSpacing: 0,
//                                                               fontFamily:
//                                                                   "QCF_P${index.toString().padLeft(3, "0")}",
//                                                               fontSize: index ==
//                                                                           1 ||
//                                                                       index == 2
//                                                                   ? 28.sp
//                                                                   : index == 145 ||
//                                                                           index ==
//                                                                               201
//                                                                       ? index == 532 ||
//                                                                               index ==
//                                                                                   533
//                                                                           ? 22.5
//                                                                               .sp
//                                                                           : 22.4
//                                                                               .sp
//                                                                       : 22.9.sp,
//                                                               backgroundColor: shouldHighlightText
//                                                                   ? quran.getVerse(e['surah'], i) == widget.highlightVerse
//                                                                       ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.25)
//                                                                       : selectedSpan == " ${e["surah"]}$i"
//                                                                           ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.25)
//                                                                           : Colors.transparent
//                                                                   : selectedSpan == " ${e["surah"]}$i"
//                                                                       ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.25)
//                                                                       : Colors.transparent,
//                                                             ),
//                                                             children: const <TextSpan>[
//                                                               // TextSpan(
//                                                               //   text: quran.getVerseQCF(e["surah"], i).substring(quran.getVerseQCF(e["surah"], i).length - 1),
//                                                               //   style:  TextStyle(
//                                                               //     color: isVerseStarred(
//                                                               //                                                     e[
//                                                               //                                                         "surah"],
//                                                               //                                                     i)
//                                                               //                                                 ? Colors
//                                                               //                                                     .amber
//                                                               //                                                 : secondaryColors[getValue("quranPageolorsIndex")] // Change color here
//                                                               //   ),
//                                                               // ),
//                                                             ],
//                                                           ),);
//                                                         }
//                                                         return spans;
//                                                       }).toList(),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),);
//                                         } else if (state
//                                             is QuranPagePlayerPlaying) {
//                                           // printYellow("playing");
//                                           return Directionality(
//                                             textDirection: m.TextDirection.rtl,
//                                             child: StreamBuilder<Duration?>(
//                                                 stream: state.audioPlayerStream,
//                                                 builder: (context, snapshot) {
//                                                   if (snapshot.hasData) {
//                                                     final currentDuration =
//                                                         snapshot.data!
//                                                             .inMilliseconds;
//                                                     if (currentDuration !=
//                                                         state.durations[state
//                                                                 .durations
//                                                                 .length -
//                                                             1]['endDuration']) {
//                                                       currentVersePlaying =
//                                                           state.durations
//                                                               .where((element) {
//                                                         return element[
//                                                                     'startDuration'] <=
//                                                                 currentDuration &&
//                                                             currentDuration <=
//                                                                 element[
//                                                                     'endDuration'];
//                                                       }).first;
//                                                     }

//                                                     return Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               0,),
//                                                       child: SizedBox(
//                                                           width:
//                                                               double.infinity,
//                                                           // height: screenSize.height,
//                                                           child: RichText(
//                                                             //textWidthBasis: TextWidthBasis.parent,
//                                                             key: richTextKeys[
//                                                                 index - 1],
//                                                             textDirection: m
//                                                                 .TextDirection
//                                                                 .rtl,
//                                                             textAlign: (index ==
//                                                                         1 ||
//                                                                     index ==
//                                                                         2 ||
//                                                                     index > 570)
//                                                                 ? TextAlign
//                                                                     .center
//                                                                 : TextAlign
//                                                                     .center,
//                                                             locale:
//                                                                 const Locale(
//                                                                     'ar',),
//                                                             text: TextSpan(
//                                                               style: TextStyle(
//                                                                 color: primaryColors[
//                                                                     getValue(
//                                                                         'quranPageolorsIndex',)], //wordSpacing: -.3,
//                                                                 fontSize: getValue(
//                                                                         'pageViewFontSize',)
//                                                                     .toDouble() //.sp
//                                                                 ,
//                                                                 //
//                                                                 fontFamily:
//                                                                     getValue(
//                                                                         'selectedFontFamily',),
//                                                               ),
//                                                               locale:
//                                                                   const Locale(
//                                                                       'ar',),
//                                                               children: quran
//                                                                   .getPageData(
//                                                                       index,)
//                                                                   .expand((e) {
//                                                                 // print(e);
//                                                                 final
//                                                                     spans = <InlineSpan>[];
//                                                                 for (var i = e[
//                                                                         'start'];
//                                                                     i <=
//                                                                         e['end'];
//                                                                     i++) {
//                                                                   // Header
//                                                                   if (i == 1) {
//                                                                     spans.add(
//                                                                         WidgetSpan(
//                                                                       child: HeaderWidget(
//                                                                           e: e,
//                                                                           jsonData:
//                                                                               widget.jsonData,),
//                                                                     ),);

//                                                                     if (index !=
//                                                                             187 &&
//                                                                         index !=
//                                                                             1) {
//                                                                       spans.add(
//                                                                           WidgetSpan(
//                                                                               child: Basmallah(
//                                                                         index: getValue(
//                                                                             'quranPageolorsIndex',),
//                                                                       ),),);
//                                                                     }
//                                                                     if (index ==
//                                                                         187) {
//                                                                       spans.add(
//                                                                           WidgetSpan(
//                                                                               child: Container(
//                                                                         height:
//                                                                             10.h,
//                                                                       ),),);
//                                                                     }
//                                                                   }

//                                                                   // Verses
//                                                                   spans.add(
//                                                                       TextSpan(
//                                                                     locale:
//                                                                         const Locale(
//                                                                             'ar',),
//                                                                     recognizer:
//                                                                         LongPressGestureRecognizer()
//                                                                           ..onLongPress =
//                                                                               () {
//                                                                             // print(
//                                                                             //     "$index, ${e["surah"]}, ${e["start"] + i - 1}");
//                                                                             showAyahOptionsSheet(
//                                                                                 index,
//                                                                                 e['surah'],
//                                                                                 i,);
//                                                                             print('longpressed');
//                                                                           }
//                                                                           ..onLongPressDown =
//                                                                               (details) {
//                                                                             setState(() {
//                                                                               selectedSpan = " ${e["surah"]}$i";
//                                                                             });
//                                                                           }
//                                                                           ..onLongPressUp =
//                                                                               () {
//                                                                             setState(() {
//                                                                               selectedSpan = '';
//                                                                             });
//                                                                             print('finished long press');
//                                                                           }
//                                                                           ..onLongPressCancel = () =>
//                                                                               setState(() {
//                                                                                 selectedSpan = '';
//                                                                               }),
//                                                                     text: quran
//                                                                         .getVerseQCF(
//                                                                             e[
//                                                                                 'surah'],
//                                                                             i,)
//                                                                         .replaceAll(
//                                                                             ' ',
//                                                                             '',),
//                                                                     style:
//                                                                         TextStyle(
//                                                                       color: primaryColors[
//                                                                           getValue(
//                                                                               'quranPageolorsIndex',)],
//                                                                       // letterSpacing: .05,
//                                                                       height: (index == 1 ||
//                                                                               index ==
//                                                                                   2)
//                                                                           ? 2.h
//                                                                           : 1.95
//                                                                               .h,
//                                                                       letterSpacing:
//                                                                           0.w,
//                                                                       // fontSize: 22.sp,
//                                                                       // wordSpacing: -1.4,
//                                                                       fontFamily:
//                                                                           "QCF_P${index.toString().padLeft(3, "0")}"
//                                                                       // getValue(
//                                                                       //     "selectedFontFamily")
//                                                                       ,
//                                                                       fontSize:
//                                                                           22.9.sp,
//                                                                       backgroundColor: bookmarks
//                                                                               .where((element) => element['suraNumber'] == e['surah'] && element['verseNumber'] == i)
//                                                                               .isNotEmpty
//                                                                           ? Color(int.parse("0x${bookmarks.where((element) => element["suraNumber"] == e["surah"] && element["verseNumber"] == i).first["color"]}")).withOpacity(.19)
//                                                                           : (i == currentVersePlaying['verseNumber'] && e['surah'] == state.suraNumber)
//                                                                               ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.28)
//                                                                               : shouldHighlightText
//                                                                                   ? quran.getVerse(e['surah'], i) == widget.highlightVerse
//                                                                                       ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.25)
//                                                                                       : selectedSpan == " ${e["surah"]}$i"
//                                                                                           ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.25)
//                                                                                           : Colors.transparent
//                                                                                   : selectedSpan == " ${e["surah"]}$i"
//                                                                                       ? highlightColors[getValue('quranPageolorsIndex')].withOpacity(.25)
//                                                                                       : Colors.transparent,
//                                                                     ),
//                                                                     children: const [
//                                                                       // TextSpan(
//                                                                       //     locale: const Locale(
//                                                                       //         "ar"),
//                                                                       //     text:
//                                                                       //         " ${convertToArabicNumber((i).toString())} " //               quran.getVerseEndSymbol()
//                                                                       //     ,
//                                                                       //     style: TextStyle(
//                                                                       //         color: isVerseStarred(
//                                                                       //                 e[
//                                                                       //                     "surah"],
//                                                                       //                 i)
//                                                                       //             ? Colors.amber
//                                                                       //             : secondaryColors[
//                                                                       //                 getValue(
//                                                                       //                     "quranPageolorsIndex")],
//                                                                       //         fontFamily:
//                                                                       //             "KFGQPC Uthmanic Script HAFS Regular")),

//                                                                       //               ],
//                                                                       //             ),
//                                                                       //           ),
//                                                                       //         ),
//                                                                       //     ),
//                                                                       //     ),
//                                                                     ],
//                                                                   ),);
//                                                                   if (bookmarks
//                                                                       .where((element) =>
//                                                                           element['suraNumber'] ==
//                                                                               e[
//                                                                                   'surah'] &&
//                                                                           element['verseNumber'] ==
//                                                                               i,)
//                                                                       .isNotEmpty) {
//                                                                     spans.add(WidgetSpan(
//                                                                         alignment: PlaceholderAlignment.middle,
//                                                                         child: Icon(
//                                                                           Icons
//                                                                               .bookmark,
//                                                                           color:
//                                                                               Color(int.parse("0x${bookmarks.where((element) => element["suraNumber"] == e["surah"] && element["verseNumber"] == i).first["color"]}")),
//                                                                         ),),);
//                                                                   }
//                                                                 }
//                                                                 return spans;
//                                                               }).toList(),
//                                                             ),
//                                                           ),),
//                                                     );
//                                                   } else {
//                                                     return Directionality(
//                                                       textDirection:
//                                                           m.TextDirection.rtl,
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(0),
//                                                         child: SizedBox(
//                                                             width:
//                                                                 double.infinity,
//                                                             // height: screenSize.height,
//                                                             child: RichText(
//                                                               //textWidthBasis: TextWidthBasis.parent,
//                                                               key: richTextKeys[
//                                                                   index - 1],
//                                                               textDirection: m
//                                                                   .TextDirection
//                                                                   .rtl,
//                                                               textAlign: (index ==
//                                                                           1 ||
//                                                                       index ==
//                                                                           2 ||
//                                                                       index >
//                                                                           570)
//                                                                   ? TextAlign
//                                                                       .center
//                                                                   : TextAlign
//                                                                       .center,
//                                                               locale:
//                                                                   const Locale(
//                                                                       'ar',),
//                                                               text: TextSpan(
//                                                                 style:
//                                                                     TextStyle(
//                                                                   color: primaryColors[
//                                                                       getValue(
//                                                                           'quranPageolorsIndex',)], //wordSpacing: -.3,
//                                                                   fontSize: getValue(
//                                                                           'pageViewFontSize',)
//                                                                       .toDouble() //.sp
//                                                                   ,
// //
//                                                                   fontFamily:
//                                                                       getValue(
//                                                                           'selectedFontFamily',),
//                                                                 ),
//                                                                 locale:
//                                                                     const Locale(
//                                                                         'ar',),
//                                                                 children: quran
//                                                                     .getPageData(
//                                                                         index,)
//                                                                     .expand(
//                                                                         (e) {
//                                                                   // pri