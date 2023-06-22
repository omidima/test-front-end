import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/presentation/widgets/group_button.dart';

class ProductOption extends StatefulWidget {
  final IconData icon;
  final Widget child;
  final String title;

  const ProductOption(
      {super.key,
      required this.child,
      required this.title,
      required this.icon});

  @override
  State<ProductOption> createState() => _ProductOptionState();
}

class _ProductOptionState extends State<ProductOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.greenAccent,
            ),
            const SizedBox(width: 5,),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15,),
            if (widget.child is GroupButton) widget.child
          ],
        ),
        if (widget.child is! GroupButton) widget.child
      ],
    );
  }
}
