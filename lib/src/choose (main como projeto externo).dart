import 'package:flutter/material.dart';
import 'color.dart';
import 'bio/bio_details.dart';
import 'bio/CharBio.dart';
import 'bio/bio_api.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/*import 'internac/initialize_i18n.dart' show initializeI18n;
import 'internac/constant.dart' show languages;
import 'package:exercicio_16/localizations.dart'
    show MyLocalizations, MyLocalizationsDelegate;*/
//import 'game.dart'; // para ir para batalha após selecionar personagem

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'choose',
      theme: ThemeData(primarySwatch: primaryBlack),
      home: Choose(),
    );
  }
}

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  CharApi _api = new CharApi();
  List<CharBio> _charbiolist;

  @override
  void initState() {
    super.initState();
    getBios();
  }

  /*void listenForChars() async {
    final Stream<CharBio> stream = await _api.getChars();
    stream.listen((CharBio beer) => setState(() => _charbio.add(beer)));
  }*/

  List<GestureDetector> _buildGridTileList(int count) =>
      List.generate(count, (index) {
        CharBio charbio = _charbiolist[index];
        return GestureDetector(
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DetailsBio(charbio)),
                );
              }
            },
            child: Container(
              child: Image.asset('assets/images/pic$index (Personalizado).jpg'),
            ));
      });

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 171,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Choose your Destiny'),
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'StarJedi',
              color: Color(0xFFFFFF00),
              fontSize: 24.0,
            ),
          ),
        ),
        body: _buildGrid(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 16.0,
            //padding: new EdgeInsets.only(top: 16.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hold for Bio',
                    style: new TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'StarJedi',
                      color: new Color(0xFF26C6DA),
                    )),
              ],
            ),
          ),
        ));
  }

  void getBios() async {
    _charbiolist = await _api.loadJsonFromApi();
    setState(() {});
  }
} 
