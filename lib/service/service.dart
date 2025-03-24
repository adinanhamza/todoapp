import 'dart:developer';
import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:todo_app/model/model.dart';

class Apiservice{
  final baseurl = 'https://67dfeb987635238f9aabba10.mockapi.io/todo/data';
  Dio dio = Dio();


//   Future<List<todomodel>> fetchTodo()async{
//  try {
//       final response = await dio.get(baseurl);
//       if(response.statusCode == 200){
//         log('response from api : ${response.toString()}');
//         return (response.data as List).map((e)=> todomodel.fromjson(e)).toList();
//       }else{
//       throw Exception('failed fetching data ${response.statusCode}');
//       }

//  } catch (e) {
//   log('error in todo : $e');
//   throw Exception('failed to get data $e');
   
//  }
//   }

Future <List<todomodel>> fetchTodo() async {
try {
  final response = await dio.get(baseurl);
  if(response.statusCode == 200){
    log('response from api : ${response.toString()}');
    return (response.data as List).map((e)=> todomodel.fromjson(e)).toList();
  }else{
    throw Exception('failed to fetch data: ${response.statusCode}');
    
  }
} catch (e) {
  log('error in todo : $e');
  throw Exception('failed to get data from api: $e ');
}

}

// Future<void>addTodo(todomodel todo)async{
// final data = todo.tojson();
// try {
//   final response = await dio.post(baseurl,data: data);
//   if(response.statusCode == 201){
//     log('todo added successfully');
//   }else{
//     log('failed to add todo');
//   }
// } catch (e) {

//   log('error in add todo : $e');
// }
// }

Future<void>addtodo(todomodel todo)async{
  final data = todo.tojson();
  try {
    final response = await dio.post(baseurl,data: data);
    if(response.statusCode == 201){
      log('added todo successfully ');
    }else{
      log('failed to add todo');
    }
  } catch (e) {
    log('error in add todo : $e');
  }
}




// Future<void> UpdateTodo(todomodel todo,String id)async{
// final data = todo.tojson();
// try {
//   final response = await dio.put('$baseurl/$id',data: data);
//   log('todo updated successfully');
// } catch (e) {
//   log('error in update todo : $e');
  
// }
// }


Future<void>UpdateTodo(todomodel updatedtodo,String title)async{
  final data = updatedtodo.tojson();
  try {
    final response = await dio.patch('$baseurl/$title',data: data);
    log('updated todo is successfully');
  } catch (e) {
    log('error in updated todo :$e');
  }
}

// Future<void>deleteTodo(String id)async{
//   try {
//     await dio.delete('$baseurl/$id');
//     log('todo deleted successfully');
//   } catch (e) {
//     log('error in delete todo : $e');
//   }
// }
Future<void>deleteTodo(String id)async{
  try {
    await dio.delete('$baseurl/$id');
    log('deleted todo successfully');
  } catch (e) {
    log('error in delete todo : $e');
  }
}


}