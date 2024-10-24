

import 'package:flutter/material.dart';

getResponsiveSize(BuildContext context,{double? multiplier}){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double textSizeMultiplier =
  width>900
      ?0.015:
  width>700
      ?0.020:
  width>500
      ?0.025:
  width>400
      ?0.032:
  width<350
      ?0.036:0.032;
  double multiplierLimit =
  width>900
      ?900:
  width>700
      ?700:
  width>500
      ?500:
  width<350
      ?350:400;
  double baseTextSize = width*textSizeMultiplier;
  double limit = multiplierLimit*textSizeMultiplier*1.2;
  return (baseTextSize>limit?limit:baseTextSize)*(multiplier??1);
}
