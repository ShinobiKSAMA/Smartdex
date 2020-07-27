import 'package:flutter/material.dart';
import 'package:smartdex/pages/dexhome/homewidgets/dexcard.dart';
import 'package:smartdex/Models/pokemon.dart';
import 'package:smartdex/services.dart';
//import 'package:admob_flutter/admob_flutter.dart';

class DexHome extends StatefulWidget {

  @override
  _DexHomeState createState() => _DexHomeState();
}

class _DexHomeState extends State<DexHome> {

  List<Pokemon> pokemons = List();
  List<Pokemon> filteredPokemons = List();

  Widget appBarTitle = Text(
    "SmartDex",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: Colors.black,
    ),
  );

  Icon actionIcon = Icon(Icons.search, color: Colors.black,);

  @override
  void initState() {
    super.initState();
    
    //Admob.initialize("ca-app-pub-5939941348959951~8193666084");
    //Test Ad
    //Admob.initialize("ca-app-pub-3940256099942544~3347511713");
    
    Services.getPokemons().then((pokeFromJson) {
      setState(() {
        pokemons = pokeFromJson;
        filteredPokemons = pokemons;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[

          //Search
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {

                //If Icon is Search Make it Exit
                if(this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(Icons.close, color: Colors.black,);
                  this.appBarTitle = TextField(
                    decoration: InputDecoration(
                      hintText: "Search By Name or Dex-Number..",
                      border: InputBorder.none,
                    ),
                    onChanged: (string) {
                      setState(() {
                        filteredPokemons = pokemons.where((p) => (
                            p.name.toLowerCase().contains(string.toLowerCase()) ||
                                p.num.contains(string)
                        )).toList();
                      });
                    },
                  );
                }

                //If Icon is Exit Make it Search
                else {
                  this.actionIcon = Icon(Icons.search, color: Colors.black,);
                  this.appBarTitle = Text(
                    "SmartDex",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  );
                  setState(() {
                    filteredPokemons = pokemons;
                  });
                }

              });
            },
          ),
        ],
      ),

      body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Center(
            child: ListView.separated(
              separatorBuilder: (context, int index) {
                return SizedBox(height: 10,);
		/*if(index%6!=0) return SizedBox(height: 10,);
                else{
                  return Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      //AdmobBanner(adUnitId: "ca-app-pub-5939941348959951/7570510242", adSize: AdmobBannerSize.BANNER),
                      //Test Ad
                      AdmobBanner(adUnitId: "ca-app-pub-3940256099942544/6300978111", adSize: AdmobBannerSize.BANNER),
                      SizedBox(height: 10,),
                    ],
                  );
                }*/
              },
              itemBuilder: (BuildContext context, int index) {
                return DexCard(
                  num: filteredPokemons[index].num,
                  name: filteredPokemons[index].name,
                  type: filteredPokemons[index].type,
                  cdex: filteredPokemons[index],
                );
              },
              itemCount: filteredPokemons == null ? 0 : filteredPokemons.length,
            ),
          )
      ),
    );
  }
}