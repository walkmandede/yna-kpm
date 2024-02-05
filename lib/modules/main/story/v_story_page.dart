import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_constants.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/c_main_controller.dart';
import 'package:wedding_app/modules/main/story/c_story_controller.dart';

import '../../../constants/app_assets.dart';


String storyData = """First time we met:
Our story began during our high school days. In those teenage years, I handed her a heartfelt love letter. Unfortunately, we had to put our connection on hold as the demands of our studies took center stage. However, fate had a way of bringing us back together. We met again when we became university students, thanks to mutual friends’ connections. Seeing her familiar face sparked memories of that long-forgotten love letter. As the days turned into months, our connection rekindled. On the memorable date of August 23, 2013, we took a leap of faith and officially started dating.

From Milestone to Memories:
Our 11-Year Journey
In our 11 years of dating, we've faced life's challenges together, growing stronger with each milestone. Through difficulties, we've developed a deep understanding and connection, standing united. Some highlights include unforgettable moments in Ngapali and cherished memories in the captivating Ngwe Saung. These travel experiences have been more than destinations; they've been the backdrop to our growth, laughter, and bond strengthening. As we continue this remarkable journey, the adventures we've had serve as milestones in our shared story.

Our engagement (26 Nov 2023):
Our journey, filled with ups and downs, brought us closer. It was during one of those challenging moments that we realized the depth of our love and commitment. In a simple, heartfelt moment, amidst life's trials, we got engaged.""";

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoryController());
    MainPageController mainPageController = Get.find();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(AppAssets.storyBg).image,
              fit: BoxFit.cover
            )
        ),
        padding: EdgeInsets.symmetric(
          horizontal: (Get.height * 0.025)
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final pageSize = Size(constraints.maxWidth,constraints.maxHeight);
            return SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              key: const PageStorageKey("Story Page"),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (Get.mediaQuery.padding.top).heightBox(),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical: (Get.height * 0.005)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                          "Our Story",
                          style: GoogleFonts.alexBrush(
                            fontSize: 40,
                          )
                      ),
                    ),
                    gap2(),
                    SizedBox(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 353/436,
                        child: Image.asset(AppAssets.storyMale),
                      ),
                    ),
                    gap1(),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical: (Get.height * 0.005)
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                              "Hello, I am ",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              )
                          ),
                          Text(
                              "Yan Nyein Aung ",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                    gap2(),
                    SizedBox(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 353/436,
                        child: Image.asset(AppAssets.storyFemale),
                      ),
                    ),
                    gap1(),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical: (Get.height * 0.005)
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                              "and I am ",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              )
                          ),
                          Text(
                              "Kyi Phyu Mon. ",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                    gap2(),
                    Text(
                        "Our story start with . . .",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        )
                    ),
                    gap3(),
                    title("First time we met"),
                    gap2(),
                    bodyText("Our story began during our high school days. In those teenage years, I handed her a heartfelt love letter. Unfortunately, we had to put our connection on hold as the demands of our studies took center stage."),
                    gap2(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: pageSize.width * 0.3,
                          child: Column(
                            children: [
                              Image.asset(
                                AppAssets.story1,
                                width: double.infinity,
                              ),
                              gap1(),
                              Image.asset(
                                AppAssets.story2,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                        10.widthBox(),
                        Expanded(
                          child: Column(
                            children: [
                              bodyText("However, fate had a way of bringing us back together. We met again when we became university students, thanks to mutual friends’ connections. Seeing her familiar face sparked memories of that long-forgotten love letter."),
                              gap1(),
                              bodyText("As the days turned into months, our connection rekindled. On the memorable date of August 23, 2013, we took a leap of faith and officially started dating")
                            ],
                          ),
                        )
                      ],
                    ),
                    gap3(),
                    title("From Milestone to Memories:\nOur 11-Year Journey"),
                    gap2(),
                    bodyText("In our 11 years of dating, we've faced life's challenges together, growing stronger with each milestone. Through difficulties, we've developed a deep understanding and connection, standing united."),
                    gap2(),
                    bodyText("Some highlights include unforgettable moments in Ngapali and cherished memories in the captivating Ngwe Saung. These travel experiences have been more than destinations; they've been the backdrop to our growth, laughter, and bond strengthening. As we continue this remarkable journey, the adventures we've had serve as milestones in our shared story."),
                    gap2(),
                    Image.asset(AppAssets.story3in1),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 8,
                    //       child: Image.asset(AppAssets.story3),
                    //     ),
                    //     Expanded(
                    //       flex: 6,
                    //       child: Image.asset(AppAssets.story4),
                    //     ),
                    //   ],
                    // ),
                    gap3(),
                    title("Our engagement"),
                    gap1(),
                    subTitle("26 Nov, 2023 @ Somewhere"),
                    gap2(),
                    bodyText("Our journey, filled with ups and downs, brought us closer. It was during one of those challenging moments that we realized the depth of our love and commitment. In a simple, heartfelt moment, amidst life's trials, we got engaged."),
                    gap2(),
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(AppAssets.storyEngage),
                    ),
                    (Get.height * 0.2).heightBox(),
                    (Get.mediaQuery.padding.bottom).heightBox(),
                  ]
              ),
            );
          },
        ),
      ),
    );
  }

  Widget title(String text){
    return Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold
        )
    );
  }

  Widget subTitle(String text){
    return Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          color: AppColors.red
        )
    );
  }

  Widget bodyText(String text){
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      strutStyle: StrutStyle(
          height: AppConstants.baseTextHeight
      ),
    );
  }

  Widget gap1(){
    return 10.heightBox();
  }

  Widget gap2(){
    return 20.heightBox();
  }

  Widget gap3(){
    return 50.heightBox();
  }

}
