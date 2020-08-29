import 'dart:async';

import 'CharBio.dart';
import 'dart:convert';

class CharApi { 
  Future<dynamic> _get() async {
    return jsonDecode(jsonString);
  }

  Future<List<CharBio>> loadJsonFromApi() async { 
    List<dynamic> responseJon = await _get();
    List<CharBio> charbiolist = new List();
    responseJon.forEach((map) => charbiolist.add(CharBio.fromJson(map)));
    return charbiolist;
  }

String jsonString = "[" +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" + 
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "{" + 
    "\"name\":\"Leia Organa\",\"height\":\"150\",\"mass\":\"49\"," +
    "\"hair_color\":\"brown\",\"skin_color\":\"light\",\"eye_color\":\"brown\"," +
    "\"birth_year\":\"19BBY\",\"gender\":\"female\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" +
    "\"name\":\"Obi-Wan Kenobi\",\"height\":\"182\",\"mass\":\"77\"," +
    "\"hair_color\":\"auburn, white\",\"skin_color\":\"fair\",\"eye_color\":\"blue-gray\"," +
    "\"birth_year\":\"57BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" + 
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Darth Vader\",\"height\":\"202\",\"mass\":\"136\"," +
    "\"hair_color\":\"none\",\"skin_color\":\"white\",\"eye_color\":\"yellow\"," +
    "\"birth_year\":\"41.9BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}," +
    "{" + 
    "\"name\":\"Luke Skywalker\",\"height\":\"172\",\"mass\":\"77\"," + 
    "\"hair_color\":\"blond\",\"skin_color\":\"fair\",\"eye_color\":\"blue\"," +
    "\"birth_year\":\"19BBY\",\"gender\":\"male\"" +
    "\"pic\":\"https://images4.alphacoders.com/813/813003.jpg""" +
    "}" +

  "]";
}