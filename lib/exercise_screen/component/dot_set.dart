import 'package:exercise/exercise_screen/component/dot.dart';
import 'package:exercise/resource/pallet.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DotSet extends StatefulWidget {
  final int? indexValueOne;
  final int? indexValueTwo;
  final int? indexValueThree;
  const DotSet(
      {Key? key, this.indexValueOne, this.indexValueTwo, this.indexValueThree})
      : super(key: key);

  @override
  State<DotSet> createState() => _DotSetState();
}

class _DotSetState extends State<DotSet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(
          index: widget.indexValueOne,
        ),
        10.width,
        Dot(
          index: widget.indexValueTwo,
        ),
        10.width,
        Dot(
          index: widget.indexValueThree,
        ),
      ],
    );
  }
}
