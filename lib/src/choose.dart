import 'package:counter/src/bio/CharBio.dart';
import 'package:counter/src/bio/bio_details.dart';
import 'package:counter/src/game.dart';
import 'package:flutter/material.dart';
/*import 'color.dart';
import 'bio_details.dart';
import 'CharBio.dart';
import 'bio_api.dart';*/
import 'screens/main_page.dart';
import 'game.dart';
import 'models/models.dart';
import 'heroes.dart';
import 'models/appstate.dart';
import 'package:frideos/frideos.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  CharBio _charBio;

  /*void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => GamePage())),
    );
        super.initState();
  }*/

  /*Widget _switchTab(AppTab tab, AppState appState) {
    switch (tab) {
      //case AppTab.main:
        //return BioPage();
        //break;
      case AppTab.game:
        return GamePage();
        break;
      /*case AppTab.summary:
        return SummaryPage(stats: appState.swBloc.stats);
        break;*/
      default:
        return GamePage();
    }
  }*/

  List<Hero> _buildGridTileList(int count) {
    return List.generate(count, (i) {
      return Hero(
          tag: '$i',
          child: GestureDetector(
              onLongPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HeroesPage(i))), // implementar busca no JSON
              child: Container(
                  child:
                      Image.asset('assets/images/pic$i (Personalizado).jpg'))));
    });
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 171,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(15));

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);

    /* ValueBuilder(
      streamed: appState.tabController,
      builder: (context, snapshot) => Scaffold(
            appBar: snapshot.data != AppTab.choose ? null : AppBar(),
            body: _switchTab(snapshot.data, appState),
          ),
    );*/

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Choose your Destiny'),
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'StarJedi',
              color: Color(0xFFFFFF00),
              fontSize: 21.0,
            ),
          ),
        ),
        body: _buildGrid(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 102.0,
            //padding: new EdgeInsets.only(top: 16.0),
            child: new Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hold for Bio',
                    style: new TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'StarJedi',
                      color: new Color(0xFF26C6DA),
                    )),
                Container(
                  height: 36,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 36,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(35),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: 2.0,
                            spreadRadius: 2.5),
                      ]),
                  child: RaisedButton(
                    color: Colors.black,
                    autofocus: true,
                    child: Text('Do iT',
                        style: new TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'StarJedi',
                          color: Colors.red, //new Color(0xFF26C6DA),
                        )),
                    onPressed: appState.playGame,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
