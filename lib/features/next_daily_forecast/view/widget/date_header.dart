import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DateHeader extends StatelessWidget {
  final int pageIndex;
  final int maxPage;
  final String date;
  final VoidCallback onBackPressed;
  final VoidCallback onNextPressed;

  const DateHeader({
    Key? key,
    required this.pageIndex,
    required this.date,
    required this.onBackPressed,
    required this.onNextPressed,
    required this.maxPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      if (pageIndex != 0)
        IconButton(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: context.colors.onSurface,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onBackPressed,
            icon: const Icon(
              Icons.navigate_before,
              size: 24,
            )),
      date.text.bold.xl.makeCentered().p8().flexible(),
      if (pageIndex != maxPage - 1)
        IconButton(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: context.colors.onSurface,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onNextPressed,
            icon: const Icon(
              Icons.navigate_next,
              size: 24,
            )),
    ]
        .hStack(
          alignment: MainAxisAlignment.center,
        )
        .p8();
  }
}
