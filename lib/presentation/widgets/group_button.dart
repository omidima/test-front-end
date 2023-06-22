import 'package:flutter/material.dart';

class GroupButton extends StatefulWidget {
  final List<GroupButtonItem> children;
  final Function(int index)? onSelected;
  const GroupButton(
      {super.key,
      required this.children,
      this.onSelected});

  @override
  State<GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  int _activeItem = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF1F1F1)),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
            children: widget.children
                .asMap()
                .map((key, value) => MapEntry(
                    key,
                    InkWell(
                      child: _activeItem == key
                          ? GroupButtonItem(
                              title: value.title,
                              isActive: true,
                            )
                          : value,
                      onTap: () {
                        widget.onSelected?.call(key);
                        setState(() {
                          _activeItem = key;
                        });
                      },
                    )))
                .values
                .toList()),
      ),
    );
  }
}

class GroupButtonItem extends StatelessWidget {
  final bool? isActive;
  final String title;

  const GroupButtonItem({super.key, this.isActive, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive != null ? const Color(0xff48E9FC) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Text(title),
    );
  }
}
