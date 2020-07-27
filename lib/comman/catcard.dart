import 'package:flutter/material.dart';
import 'package:smartdex/comman/get.dart';

class CatCard extends StatelessWidget {
  final String type;

  const CatCard({
    Key key,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color x = getColor(type)==Color(0xFFEFD743) ? Colors.black : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: getColor(type),
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      margin: EdgeInsets.only(right: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(type.toString(), style: typeSty.apply(color: x),),
      ),
    );
  }
}