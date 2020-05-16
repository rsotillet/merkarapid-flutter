

import 'package:flutter/material.dart';


class AnimatedContainerLoad extends AnimatedWidget{

  final Tween<double> _sizeAnim = Tween<double>(begin: 20.0,end:0.0);
  AnimatedContainerLoad({Key key, Animation animation}):super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
        opacity: animation.value,
        child: Transform.translate(
            offset: Offset(0.0, _sizeAnim.evaluate(animation)),
            child: Icon(Icons.keyboard_arrow_up,color: Colors.white,size: 40.0,)
        ));
  }

}