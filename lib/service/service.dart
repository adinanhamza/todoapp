import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:todo_app/model/model.dart';

class Apiservice{
  final baseurl = 'https://67dfeb987635238f9aabba10.mockapi.io/data';
  Dio dio = Dio();


  Future<List<todomodel>> getTodo()async{
 try {
      final response = await dio.get(baseurl);
      if(response.statusCode == 200){
        log('response from api : ${response.toString()}');
        return (response.data as List).map((e)=> todomodel.fromjson(e)).toList();
      }else{
      throw Exception('failed fetching data ${response.statusCode}');
      }

 } catch (e) {
  log('error in todo : $e');
  throw Exception('failed to get data $e');
   
 }
  }
}