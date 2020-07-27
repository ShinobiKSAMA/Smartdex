import 'package:flutter/material.dart';
import 'package:smartdex/comman/get.dart';

class DexDetails extends StatelessWidget {

  final List<dynamic> type;
  final dynamic cdex;
  final dynamic img;

  const DexDetails({
    Key key,
    @required this.type,
    @required this.cdex,
    @required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color x = getColor(type[0])==Color(0xFFEFD743) ? Colors.black : Colors.white;

    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "SmartDex",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: x,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: x,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            //centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          body: Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height - AppBar().preferredSize.height -24,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("#"+cdex.num.toString(), style: numStyB.apply(color: x.withOpacity(0.7)),),
                  Center(
                    child: Container(
                      //color: Colors.transparent,
                      width: 150.0,
                      height: 150.0,
                      child: img,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(child: Text(getName(cdex.name), style: nameStyB.apply(color: x),)),
                  SizedBox(height: 10,),
                  getCat(type),
                  SizedBox(height: 10,),
                  Text('Species: '+cdex.species, style: species.apply(color: x),),
                  SizedBox(height: 10,),
                  Wrap(
                    children: <Widget>[
                      Text('Height: '+cdex.height, style: hw.apply(color: x),),
                      SizedBox(width: 5,),
                      Text('Weight: '+cdex.weight, style: hw.apply(color: x),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Stats:', style: species.apply(color: x),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('HP: '+cdex.stats.hp, style: sw.apply(color: x),),
                              SizedBox(height: 3,),
                              Text('Attack: '+cdex.stats.attack, style: sw.apply(color: x),),
                              SizedBox(height: 3,),
                              Text('Defense: '+cdex.stats.defense, style: sw.apply(color: x),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Sp. Attack: '+cdex.stats.spAttack, style: sw.apply(color: x),),
                              SizedBox(height: 3,),
                              Text('Sp. Defense: '+cdex.stats.spDefense, style: sw.apply(color: x),),
                              SizedBox(height: 3,),
                              Text('Speed: '+cdex.stats.speed, style: sw.apply(color: x),),
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Evolutions Chart:', style: species.apply(color: x),),
                  SizedBox(height: 10,),
                  getEvo(cdex.evolution, getColor(type[0])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}