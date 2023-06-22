import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductGalley extends StatefulWidget {
  final List<String> items;
  const ProductGalley({super.key, required this.items});

  @override
  State<ProductGalley> createState() => _ProductGalleyState();
}

class _ProductGalleyState extends State<ProductGalley> {
  String _currentItem = '';
  @override
  void initState() {
    super.initState();
    _currentItem = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            child: Image.network(
              _currentItem,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.items
                        .map((element) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _ThumbnailImage(
                                  onTap: (src) {
                                    setState(() {
                                      _currentItem = element;
                                    });
                                  },
                                  src: element),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(220, 138, 138, 138), borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _ThumbnailImage extends StatelessWidget {
  final String src;
  final Function(String src) onTap;

  const _ThumbnailImage({super.key, required this.onTap, required this.src});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(src);
      },
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.network(src, fit: BoxFit.cover,),
      ),
    );
  }
}
