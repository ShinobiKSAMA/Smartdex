import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartdex/comman/catcard.dart';

//Method To Remove Name Repetition
String getName(String name) {
  return name;
}

//Method to Split Types
Widget getCat(List<dynamic> catList) {
  if (catList.length>1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: catList.map((item) => CatCard(type: item)).toList(),
    );
  }
  else {
    return CatCard(type: catList[0]);
  }
}

//Method for Evolutions
Widget getEvo(List<dynamic> evo, Color y) {
    if (evo.length>0) {
      List<Widget> list = new List<Widget>();
      for(var i=0; i<evo.length; i++) {
        list.add(Container(
          decoration: BoxDecoration(
            color: y,
            borderRadius: BorderRadius.all(Radius.circular(1000)),
          ),
          margin: EdgeInsets.only(right: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              evo[i].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: y==Color(0xFFEFD743) ? Colors.black : Colors.white,
              ),
            ),
          ),
        ));
        if(i < evo.length-1){
          list.add(
            Row(
              children: <Widget>[
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.0,
                  color: y==Color(0xFFEFD743) ? Colors.black : Colors.white,
                ),
                SizedBox(width: 5),
              ],
            )
          );
        }
      }
      return Row(children: list,);
    }
    else {
      return Text('No Evolutions', style: hw.apply(color: y==Color(0xFFEFD743) ? Colors.black : Colors.white),);
    }
}

//Method for Getting Color From Type
Color getColor(String type) {
  Color color;
  if(type.contains("Grass")) {
    color = Color(0xFF5EBD58);
  }
  else if(type.contains("Fire")) {
    color = Color(0xFFFBA04E);
  }
  else if(type.contains("Water")) {
    color = Color(0xFF519ADF);
  }
  else if(type.contains("Electric")) {
    color = Color(0xFFEFD743);
  }
  else if(type.contains("Bug")) {
    color = Color(0xFF9ABF2E);
  }
  else if(type.contains("Dark")) {
    color = Color(0xFF5F606D);
  }
  else if(type.contains("Normal")) {
    color = Color(0xFF959AA3);
  }
  else if(type.contains("Ice")) {
    color = Color(0xFF7CD3C6);
  }
  else if(type.contains("Poison")) {
    color = Color(0xFFAD63CA);
  }
  else if(type.contains("Flying")) {
    color = Color(0xFF96AFE1);
  }
  else if(type.contains("Fighting")) {
    color = Color(0xFFC56E60);
  }
  else if(type.contains("Ground")) {
    color = Color(0xFFDA7C4C);
  }
  else if(type.contains("Psychic")) {
    color = Color(0xFFF87A79);
  }
  else if(type.contains("Rock")) {
    color = Color(0xFFCABB8B);
  }
  else if(type.contains("Ghost")) {
    color = Color(0xFF5B6CB7);
  }
  else if(type.contains("Dragon")) {
    color = Color(0xFF0772C8);
  }
  else if(type.contains("Steel")) {
    color = Color(0xFF548EA1);
  }
  else if(type.contains("Fairy")) {
    color = Color(0xFFEF95E6);
  }
  else {
    color = Color(0xFF);
  }
  return color;
}

//Style for Index Number
const TextStyle numStyS = TextStyle(
  fontWeight: FontWeight.bold,
);
const TextStyle numStyB = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
);

//Style for Name
const TextStyle nameStyS = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
);
const TextStyle nameStyB = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 27.0,
);

//Style for Type
const TextStyle typeSty = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
  color: Colors.white,
);

//Style for Width and Height
const TextStyle hw = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
);

//Style for Stats
const TextStyle sw = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

//Style for Species
const TextStyle species = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);