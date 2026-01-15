import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

const YOUTUBE_API_KEY = "AIzaSyCCONVFbZBpBPPfnN4gJQl7Hmci3olA3LU";
const CHANNEL_ID = "UCwXdFgeE9KYzlDdR7TG9cMw";
const BASE_URL = "https://www.googleapis.com/youtube/v3";

class Api {
 Future pesquisar(String pesquisa) async{
    http.Response response = await http.get(Uri.parse(
      "$BASE_URL/search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$YOUTUBE_API_KEY"
      "&channelId=$CHANNEL_ID"
      "&q=$pesquisa"
    ));

    if(response.statusCode == 200){
      Map<String, dynamic> jsonData = json.decode(response.body);
      log("resposta:${jsonData["items"][0]["snippet"]["title"].toString()}");
    }
    else{
      log("resposta: paia");
    }
  }
}
