import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';
import 'package:test_app/presentation/product/widgets/product_gallery.dart';
import 'package:test_app/presentation/widgets/group_button.dart';
import 'package:test_app/presentation/widgets/product_option.dart';
import '../../widgets/image_upload_widget.dart';
import '../../widgets/user_profile.dart';
import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();

  HomePage({super.key});

  Widget mobile() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            children: const [
              Text("محصولات"),
              Text(" > "),
              Text(
                "پیراهن مردانه",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const _PageGallery(),
          const _ProductContent()
        ],
      ),
    );
  }

  Widget desktop() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_outlined)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: const [
                            Text("محصولات"),
                            Text(" > "),
                            Text(
                              "پیراهن مردانه",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const _PageGallery(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const Expanded(child: Padding(
                    padding: EdgeInsets.only(top:50.0),
                    child: _ProductContent(),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaledBox(
      width: ResponsiveBreakpoints.of(context).largerThan(MOBILE).obs.isTrue ? 1280 : 380,
      child: ResponsiveBreakpoints.of(context).largerThan(MOBILE).obs.isTrue ? desktop()
          : mobile(),
    );
  }
}

class _ProductContent extends StatelessWidget {
  const _ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProductOption(
            icon: Icons.privacy_tip_outlined,
            title: "آیا کالا گارانتی دارد",
            child: GroupButton(children: [
              GroupButtonItem(title: "بله"),
              GroupButtonItem(title: "خیر")
            ])),
        const SizedBox(
          height: 40,
        ),
        ProductOption(
            icon: Icons.access_time,
            title: "آماده ارسال",
            child: Row(
              children: [
                const Text("این کالا در"),
                const SizedBox(width: 10,),
                DropdownButton(
                    items: const [],
                    onChanged: (value) {},
                    hint: const Text("روز")),
                const Text("و"),
                const SizedBox(width: 10,),
                DropdownButton(
                    items: const [],
                    onChanged: (value) {},
                    hint: const Text("ساعت")),
                    const SizedBox(width: 10,),
                const Text("تامین میشود."),
              ],
            )),
                const SizedBox(height: 10,),

        ImageUpload(),
                const SizedBox(height: 10,),

        SizedBox(
          width: 300,
          child: UserProfile())
      ],
    );
  }
}

class _PageGallery extends StatelessWidget {
  const _PageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductGalley(items: [
      "https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-hero-220907_Full-Bleed-Image.jpg.large.jpg",
      "https://s.yimg.com/uu/api/res/1.2/r59QHlsa_l1FsxxsVl7.6w--~B/aD0xMjYyO3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2022-09/7e16cd50-33ee-11ed-bd7f-45b4dd0372d0.cf.jpg",
      "https://media.suara.com/pictures/653x366/2022/09/08/31258-iphone-14-plus.jpg",
      "https://s.yimg.com/uu/api/res/1.2/Y0sdCqqSrXzmtFWgzjwgZg--~B/aD0xMzMzO3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2022-09/280da9d0-33d8-11ed-beeb-9f0777e02779.cf.jpg",
      "https://cdn.mos.cms.futurecdn.net/9Ln5e3J6wmezqwU7c9pZXY.jpg",
      "https://fdn.gsmarena.com/imgroot/reviews/22/apple-iphone-14-plus/lifestyle/-1200w5/gsmarena_019.jpg"
    ]);
  }
}
