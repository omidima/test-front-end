import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageUpload extends StatelessWidget {
  const ImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 162,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF5F5F5)
      ),
      child: Stack(alignment: Alignment.center, children: [
        Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: const [
          Icon(Icons.add, color: Color(0xff2f97ce),),
          // SizedBox(height: 10,),
          Text("تصویر کارت ملی")
        ],),
        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.red,),
            onPressed: () {},
          ),
        )
      ],),
    );
  }
}