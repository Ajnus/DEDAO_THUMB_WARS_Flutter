import 'package:flutter/material.dart';
import 'package:frideos/frideos.dart';
import '../models/appstate.dart';
import '../models/category.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);

    // seria captura de câmera

    /*Future<void> _optionsDialogBox() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: new Text('Take a picture'),
                      onTap: openCamera,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    GestureDetector(
                      child: new Text('Select from gallery'),
                      onTap: openGallery,
                    ),
                  ],
                ),
              ),
            );
          });
    }*/

    return FadeInWidget(
      duration: 750,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: ValueBuilder<List<Category>>(
          streamed: appState.categoriesStream,
          noDataChild: const CircularProgressIndicator(),
          builder: (context, snapshot) {
            final categories = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 56.0),
                      child: const Text(
                        ' DEDão\tWARS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 46.0,
                          fontFamily: 'StarJedi',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFF00),
                          letterSpacing: 4.0,
                          shadows: [
                            Shadow(
                              blurRadius: 8.0,
                              color: Colors.lightBlueAccent,
                              offset: Offset(3.0, 4.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Select a mode:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 14.0,
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                    ValueBuilder<Category>(
                      streamed: appState.categoryChosen,
                      builder: (context, snapshotCategory) =>
                          DropdownButton<Category>(
                        isExpanded: true,
                        value: snapshotCategory.data,
                        onChanged: appState.setCategory,
                        items: categories
                            .map<DropdownMenuItem<Category>>(
                              (value) => DropdownMenuItem<Category>(
                                value: value,
                                child: Text(
                                  value.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 36,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(35),
                        ),
                        /*boxShadow: [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 2.0,
                              spreadRadius: 2.5),
                        ]*/),
                    child: const Text(
                      'New Profile',
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                      
                    ),
                  ),
                  //onTap: _optionsDialogBox(),
                ),
                GestureDetector(
                  child: Container(
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
                    child: /*RaisedButton(onPressed: null) const */Text(
                      'Play',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: appState.startGame,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
