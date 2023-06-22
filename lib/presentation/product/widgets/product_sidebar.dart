import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/group_button.dart';
import '../../widgets/image_upload_widget.dart';
import '../../widgets/product_option.dart';
import '../../widgets/user_profile.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

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
                DropdownButton(
                    items: const [],
                    onChanged: (value) {},
                    hint: const Text("روز")),
                const Text("و"),
                DropdownButton(
                    items: const [],
                    onChanged: (value) {},
                    hint: const Text("روز")),
                const Text("تامین میشود."),
              ],
            )),
        const ImageUpload(),
        const UserProfile()
      ],
    );
  }
}
