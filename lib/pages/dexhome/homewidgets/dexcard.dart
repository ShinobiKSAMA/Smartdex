import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smartdex/comman/faderoute.dart';
import 'package:smartdex/comman/get.dart';
import 'package:smartdex/pages/dexdetails/dexdetails.dart';

class DexCard extends StatelessWidget {
  final String name;
  final String num;
  final List<dynamic> type;
  final dynamic cdex;

  const DexCard({
    Key key,
    @required this.num,
    @required this.name,
    @required this.type,
    @required this.cdex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color x = getColor(type[0])==Color(0xFFEFD743) ? Colors.black : Colors.white;
    var y = CachedNetworkImage(
      imageUrl: cdex.image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(x),
      )),
    );

    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.maxFinite,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5, 0.9],
            colors: [
              getColor(type[0]).withOpacity(0.8),
              getColor(type[0])
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("#"+num.toString(), style: numStyS.apply(color: x),),
                SizedBox(height: 5.0,),
                Text(getName(name), style: nameStyS.apply(color: x),),
                SizedBox(height: 5.0,),
                getCat(type),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 100,
                width: 100,
                child: y,
              ),
            )
          ]
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          FadeRoute(
            widget: DexDetails(cdex: cdex, type: type, img: y)
          )
        );
      },
    );
  }
}