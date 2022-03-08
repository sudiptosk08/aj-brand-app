import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
    required this.imagePath,
    this.function,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;
  final String imagePath;
  final Function? function;

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              widget.imagePath,
              width: widget.width.toDouble(),
              height: widget.height.toDouble(),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 12,
              top: 12,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedItem = !selectedItem;
                    
                  });
                },
                child: CircleAvatar(
                    backgroundColor: KColor.white,
                    maxRadius: 15,
                    child: selectedItem == false
                        ? Icon(
                            Icons.favorite,
                            color: KColor.red,
                            size: 18,
                          )
                        : Icon(
                            Icons.check,
                            color: KColor.grey,
                            size: 18,
                          )),
              ))
        ]);
  }
}
