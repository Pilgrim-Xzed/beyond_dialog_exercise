import 'package:exercise/exercise_screen/exercise_provider.dart';
import 'package:exercise/resource/pallet.dart';
import 'package:exercise/resource/screen_config.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


// Dot widget 
class Dot extends StatelessWidget {
  final int? index;
  const Dot({ Key? key,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    var exerciseProvider = Provider.of<ExerciseProvider>(context,listen: true);
    return CircleAvatar(
    radius: getProportionateScreenHeight(26),
    backgroundColor:index==exerciseProvider.currentIndex?Pallet.red:Pallet.grey,  
    );
  }
}