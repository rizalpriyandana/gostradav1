// ignore_for_file: use_key_in_widget_constructors

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gostradav1/app/ui/pages/library/detailsearch.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/pages/library/detailbook.dart';
import 'package:gostradav1/app/ui/pages/library/historypeminjaman.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:sizer/sizer.dart';

class Libraryv2 extends StatefulWidget {
  @override
  State<Libraryv2> createState() => _Libraryv2State();
}

class _Libraryv2State extends State<Libraryv2> with TickerProviderStateMixin {
  LibraryController c = Get.find<LibraryController>();
  late TabController tc;
  int currentindex = 0;
  bool vis = true;
  bool vis2 = true;
  bool vissearch = false;

  // String _getTabTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'Kesehatan';
  //     case 1:
  //       return 'Kedokteran';
  //     case 2:
  //       return 'Ilmu Keperawatan';
  //     case 3:
  //       return 'Kebidanan';
  //     default:
  //       return '';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 4, vsync: this);

    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Visibility(
        visible: vis2,
        child: SpeedDial(
          activeIcon: Icons.close,
          icon: Icons.more_horiz_outlined,
          backgroundColor: DataColors.primary600,
          children: [
            SpeedDialChild(
                child: Image.asset(
                  'assets/icon/history-book.png',
                  height: 20.sp,
                  width: 20.sp,
                  color: DataColors.primary700,
                ),
                onTap: () {
                  Get.to(HistoryPeminjamanBuku());
                },
                label: "History Peminjaman",
                labelStyle: TextStyle(
                    color: DataColors.primary, fontWeight: FontWeight.w600))
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text(
      //     "E-Library",
      //     style: TextStyle(
      //         fontSize: 14.sp,
      //         fontWeight: FontWeight.bold,
      //         color: DataColors.primary700),
      //   ),
      //   backgroundColor: DataColors.white,
      //   centerTitle: true,
      //   elevation: 0,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Get.back();
      //     },
      //     child: Padding(
      //       padding: EdgeInsets.all(10.sp),
      //       child: Image.asset(
      //         'assets/icon/home.png',
      //         height: 15.sp,
      //         width: 15.sp,
      //         color: DataColors.primary700,
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     InkWell(
      //       onTap: () {
      //         Get.to(HistoryPeminjamanBuku());
      //       },
      //       child: Padding(
      //         padding: EdgeInsets.only(right: 15.sp, top: 2.sp),
      //         child: Image.asset(
      //           'assets/icon/history-book.png',
      //           height: 24.sp,
      //           width: 24.sp,
      //           color: DataColors.primary700,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 0.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 0.sp),
                  child: Container(
                    width: double.infinity,
                    height: 180.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.sp),
                        bottomRight: Radius.circular(5.sp),
                      ),
                      color: DataColors.primary100,
                    ),
                    padding: EdgeInsets.only(
                        top: 30.sp, bottom: 0.sp, right: 10.sp, left: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Selamat datang, \ndi STRADA LIBRARY",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: DataColors.primary700),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.sp),
                              child: Image.asset(
                                'assets/icon/library.png',
                                height: 50.sp,
                                width: 50.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          "Mau pinjam buku apa hari ini?",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: DataColors.primary700),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 35.sp,
                              width: 240.sp,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 25.sp),
                                  hintText: "Cari....",
                                  hintStyle: TextStyle(
                                    color: DataColors.primary400,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.sp,
                                        right: 5.sp,
                                        top: 8.sp,
                                        bottom: 8.sp),
                                    child: Image.asset(
                                      'assets/icon/search.png',
                                      height: 20.sp,
                                      width: 20.sp,
                                      color: HexColor("#3C5595"),
                                    ),
                                  ),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: DataColors.primary700),
                                      borderRadius:
                                          BorderRadius.circular(10.sp)),
                                  fillColor: DataColors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: DataColors.white),
                                      borderRadius:
                                          BorderRadius.circular(10.sp)),
                                ),
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    if (value.isEmpty) {
                                      vis = true;
                                      vis2 = true;
                                      vissearch = false;
                                    } else {
                                      vis = false;
                                      vis2 = true;
                                      vissearch = true;
                                    }
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    vis2 = false;
                                    vis = true;
                                  });
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: "ini filter search",
                                    toastLength: Toast.LENGTH_LONG);
                              },
                              child: Container(
                                padding: EdgeInsets.all(0.sp),
                                height: 35.sp,
                                width: 35.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: DataColors.primary600),
                                child: Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Image.asset(
                                    'assets/icon/filter.png',
                                    height: 15.sp,
                                    width: 15.sp,
                                    color: DataColors.primary100,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Expanded(
                  //   child: CarouselSlider(
                  //       items: [
                  //         Container(
                  //           height: 250.sp,
                  //           width: 450.sp,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10.sp),
                  //               image: const DecorationImage(
                  //                   image: AssetImage('assets/images/bg1.jpg'),
                  //                   fit: BoxFit.fill)),
                  //         ),
                  //         // Container(
                  //         //   height: 250.sp,
                  //         //   width: 450.sp,
                  //         //   decoration: BoxDecoration(
                  //         //       borderRadius: BorderRadius.circular(10.sp),
                  //         //       image: const DecorationImage(
                  //         //           image: AssetImage('assets/images/bg2.jpg'), fit: BoxFit.fill)),
                  //         // ),
                  //         Container(
                  //           height: 250.sp,
                  //           width: 550.sp,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10.sp),
                  //               image: const DecorationImage(
                  //                   image: AssetImage('assets/images/bg3.jpg'),
                  //                   fit: BoxFit.fill)),
                  //         ),
                  //         Container(
                  //           height: 250.sp,
                  //           width: 450.sp,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10.sp),
                  //               image: const DecorationImage(
                  //                   image: AssetImage('assets/images/bg4.jpg'),
                  //                   fit: BoxFit.fill)),
                  //         ),
                  //       ],
                  //       options: CarouselOptions(
                  //         aspectRatio: 2.3,
                  //         initialPage: 0,
                  //         viewportFraction: 0.8,
                  //         enlargeCenterPage: true,
                  //         scrollDirection: Axis.horizontal,
                  //         autoPlay: true,
                  //       )),
                  // ),
                ),
                Visibility(
                  visible: vissearch,
                  child: Container(
                      width: double.infinity,
                      height: 600.sp,
                      padding: EdgeInsets.only(
                          top: 35.sp, left: 10.sp, right: 10.sp),
                      child: DetailSearchBook()),
                ),
                Visibility(
                  visible: vis,
                  child: Container(
                    padding: EdgeInsets.all(0.sp),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 35.sp),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 0.sp),
                                        child: Text(
                                          "Rekomendasi Buku",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 0.sp),
                                        child: Text(
                                          "Banyak buku yang direkomendasikan disini",
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.normal,
                                              color: DataColors.primary700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 53.sp,
                                  ),
                                  Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.blues),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7.sp,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 7.sp),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kategori Buku",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: DataColors.primary700),
                                      ),
                                      Text(
                                        "Banyak pilihan buku sesuai kategori",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.normal,
                                            color: DataColors.primary700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 85.sp,
                                  ),
                                  Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.blues),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.sp,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.sp, right: 0.sp),
                          child: Container(
                            padding: EdgeInsets.only(left: 0.sp, right: 0.sp),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.only(
                                  left: 0.sp,
                                  right: 0.sp,
                                  top: 5.sp,
                                  bottom: 5.sp),
                              indicator: BoxDecoration(
                                  // border: Border.all(color: DataColors.primary800),
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: DataColors.bluesky),
                              controller: tc,
                              isScrollable: true,
                              labelPadding:
                                  EdgeInsets.only(right: 10.sp, left: 10.sp),
                              labelColor: DataColors.primary800,
                              indicatorColor: DataColors.white,
                              unselectedLabelColor: DataColors.primary700,
                              tabs: [
                                Tab(
                                    child: Center(
                                  child: Text(
                                    "Kesehatan",
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                                Tab(
                                    child: Center(
                                  child: Text(
                                    "Kedokteran",
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                                Tab(
                                    child: Center(
                                  child: Text(
                                    "Ilmu Keperawatan",
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                                Tab(
                                  child: Center(
                                    child: Text(
                                      "Kebidanan",
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                // Tab(
                                //     child: Container(
                                //   height: 25.sp,
                                //   width: 100.sp,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(color: DataColors.primary800),
                                //     borderRadius: BorderRadius.circular(15.sp),
                                //   ),
                                //   child: Center(
                                //     child: Text(
                                //       "Kesehatan",
                                //       style: TextStyle(
                                //           fontSize: 9.sp, fontWeight: FontWeight.w600),
                                //     ),
                                //   ),
                                // )),
                                // Tab(
                                //     child: Container(
                                //   height: 25.sp,
                                //   width: 100.sp,
                                //   decoration: BoxDecoration(
                                //       border: Border.all(color: DataColors.primary800),
                                //       borderRadius: BorderRadius.circular(15.sp)),
                                //   child: Center(
                                //     child: Text(
                                //       "Kedokteran",
                                //       style: TextStyle(
                                //           fontSize: 9.sp, fontWeight: FontWeight.w600),
                                //     ),
                                //   ),
                                // )),
                                // Tab(
                                //     child: Container(
                                //   height: 25.sp,
                                //   width: 100.sp,
                                //   decoration: BoxDecoration(
                                //       border: Border.all(color: DataColors.primary800),
                                //       borderRadius: BorderRadius.circular(15.sp)),
                                //   child: Center(
                                //     child: Text(
                                //       "Ilmu Keperawatan",
                                //       style: TextStyle(
                                //           fontSize: 9.sp, fontWeight: FontWeight.w600),
                                //     ),
                                //   ),
                                // )),
                                // Tab(
                                //   child: Container(
                                //     height: 25.sp,
                                //     width: 100.sp,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(color: DataColors.primary800),
                                //         borderRadius: BorderRadius.circular(15.sp)),
                                //     child: Center(
                                //       child: Text(
                                //         "Kebidanan",
                                //         style: TextStyle(
                                //             fontSize: 9.sp, fontWeight: FontWeight.w600),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: TabBarView(
                            controller: tc,
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(DetailBookPage(), arguments: [
                                        c.imgkesehatan[index],
                                        c.jenisbukukesehatan[index],
                                        c.namabukukesehatan[index],
                                        c.penulisbukukesehatan[index],
                                        c.ratingbukukesehatan[index],
                                        c.deskripsibukukesehatan[index],
                                        c.pagesbukukesehatan[index],
                                        c.thnterbitbukes[index],
                                        c.kategoribukes[index],
                                        c.labelbukes[index],
                                      ]);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0.sp),
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 125.sp,
                                                width: 95.sp,
                                                decoration: BoxDecoration(
                                                    color: DataColors.semigrey,
                                                    border: Border.all(
                                                        color: DataColors
                                                            .primary800),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/coverbuku/' +
                                                                c.imgkesehatan[
                                                                    index]),
                                                        fit: BoxFit.fill)),
                                              ),
                                              Container(
                                                height: 25.sp,
                                                width: 100.sp,
                                                padding: EdgeInsets.all(0.sp),
                                                child: Text(
                                                  c.namabukukesehatan[index],
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: DataColors
                                                          .primary800),
                                                ),
                                              ),
                                              Container(
                                                height: 22.sp,
                                                width: 100.sp,
                                                padding: EdgeInsets.all(0.sp),
                                                child: Text(
                                                  c.penulisbukukesehatan[index],
                                                  style: TextStyle(
                                                      fontSize: 6.5.sp,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: DataColors.blues),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 6.sp),
                                            child: Container(
                                              height: 10.sp,
                                              width: 100.sp,
                                              padding:
                                                  EdgeInsets.only(right: 0.sp),
                                              child: RatingBar.builder(
                                                itemSize: 10.sp,
                                                initialRating: double.parse(
                                                    c.ratingbukukesehatan[
                                                        index]),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 0.sp),
                                height: 182.sp,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                                msg: "ini index ke $index",
                                                toastLength: Toast.LENGTH_SHORT)
                                            .toString();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 125.sp,
                                                  width: 95.sp,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          DataColors.semigrey,
                                                      border: Border.all(
                                                          color: DataColors
                                                              .primary800),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/coverbuku/' +
                                                                  c.imgkedokteran[
                                                                      index]),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Container(
                                                  height: 25.sp,
                                                  width: 100.sp,
                                                  padding: EdgeInsets.all(0.sp),
                                                  child: Text(
                                                    "Manajemen Kesehatan Masyarakat",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: DataColors
                                                            .primary800),
                                                  ),
                                                ),
                                                Container(
                                                  height: 22.sp,
                                                  width: 100.sp,
                                                  padding: EdgeInsets.all(0.sp),
                                                  child: Text(
                                                    "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                                    style: TextStyle(
                                                        fontSize: 6.5.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            DataColors.blues),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6.sp),
                                              child: Container(
                                                height: 10.sp,
                                                width: 100.sp,
                                                padding: EdgeInsets.only(
                                                    right: 0.sp),
                                                child: RatingBar.builder(
                                                  itemSize: 10.sp,
                                                  initialRating: 4.0,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 2.0),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 0.sp),
                                height: 182.sp,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                                msg: "ini index ke $index",
                                                toastLength: Toast.LENGTH_SHORT)
                                            .toString();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 125.sp,
                                                  width: 95.sp,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          DataColors.semigrey,
                                                      border: Border.all(
                                                          color: DataColors
                                                              .primary800),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/coverbuku/' +
                                                                  c.imgkeperawatan[
                                                                      index]),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Container(
                                                  height: 25.sp,
                                                  width: 100.sp,
                                                  padding: EdgeInsets.all(0.sp),
                                                  child: Text(
                                                    "Manajemen Kesehatan Masyarakat",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: DataColors
                                                            .primary800),
                                                  ),
                                                ),
                                                Container(
                                                  height: 22.sp,
                                                  width: 100.sp,
                                                  padding: EdgeInsets.all(0.sp),
                                                  child: Text(
                                                    "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                                    style: TextStyle(
                                                        fontSize: 6.5.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            DataColors.blues),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6.sp),
                                              child: Container(
                                                height: 10.sp,
                                                width: 100.sp,
                                                padding: EdgeInsets.only(
                                                    right: 0.sp),
                                                child: RatingBar.builder(
                                                  itemSize: 10.sp,
                                                  initialRating: 4.0,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 2.0),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 0.sp),
                                height: 182.sp,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                                msg: "ini index ke $index",
                                                toastLength: Toast.LENGTH_SHORT)
                                            .toString();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 125.sp,
                                                  width: 95.sp,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          DataColors.semigrey,
                                                      border: Border.all(
                                                          color: DataColors
                                                              .primary800),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/coverbuku/' +
                                                                  c.imgkebidanan[
                                                                      index]),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Container(
                                                  height: 25.sp,
                                                  width: 100.sp,
                                                  padding: EdgeInsets.all(0.sp),
                                                  child: Text(
                                                    "Manajemen Kesehatan Masyarakat",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: DataColors
                                                            .primary800),
                                                  ),
                                                ),
                                                Container(
                                                  height: 22.sp,
                                                  width: 100.sp,
                                                  padding: EdgeInsets.all(0.sp),
                                                  child: Text(
                                                    "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                                    style: TextStyle(
                                                        fontSize: 6.5.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            DataColors.blues),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6.sp),
                                              child: Container(
                                                height: 10.sp,
                                                width: 100.sp,
                                                padding: EdgeInsets.only(
                                                    right: 0.sp),
                                                child: RatingBar.builder(
                                                  itemSize: 10.sp,
                                                  initialRating: 4.0,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 2.0),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 5.sp),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Populer Buku",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: DataColors.primary700),
                                      ),
                                      Text(
                                        "Banyak pilihan buku yang populer disini",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.normal,
                                            color: DataColors.primary700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 70.sp,
                                  ),
                                  Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.blues),
                                  ),
                                  // SizedBox(
                                  //   height: 6.sp,
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 6.sp,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 5.sp),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Koleksi Buku Terbaru",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: DataColors.primary700),
                                      ),
                                      Text(
                                        "Banyak koleksi buku terbaru disini",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.normal,
                                            color: DataColors.primary700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 93.sp,
                                  ),
                                  Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.blues),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.sp,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
