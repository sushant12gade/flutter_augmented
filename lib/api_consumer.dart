 
import 'dart:typed_data';
import 'package:flutter_ar_app/global.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;



class ApiConsumer
{
  Future<Uint8List> removeImageBackgroundApi(String imagePath) async
  {
    //request

    var requestApi=http.MultipartRequest(
      "POST",
      Uri.parse("https://api.remove.bg/v1.0/removebg")
    );
    //which img file to send 

    requestApi.files.add(
      await http.MultipartFile.fromPath(
        "image_file",
        imagePath
      )
    );

    requestApi.headers.addAll({
      "X-API-Key": FlutterConfig.get('APIKEYREMOVEIMAGEBAKGROUND')
    });

    //send request and recive respond 
    final responseFromApi=await requestApi.send();

    if(responseFromApi.statusCode == 200)
    {
      http.Response getTransparentImageFromResponse= await http.Response.fromStream(responseFromApi);
      return getTransparentImageFromResponse.bodyBytes;

    }
    else
    {
      throw Exception("Error Occured::"+responseFromApi.statusCode.toString());
    }

  }
}