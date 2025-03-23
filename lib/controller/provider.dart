import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/service/service.dart';

class Todoprovider extends ChangeNotifier{
  Apiservice apiservice = Apiservice();
  List<todomodel> todos = [];
  bool isloading = false;



  Future<void>getTodo()async{
    isloading = true;
    notifyListeners();

    try {
      todos = await apiservice.fetchTodo();
           log('todo added providerdata : ${todos.toString()}');
    } catch (e) {
      log('failed to load todo providerdata : ${e.toString()}');

    }finally{
      isloading = false;
      notifyListeners();
    }
  }

Future <void> addTodos(todomodel todo)async{
   isloading = true;
   notifyListeners();
   
   try {
     await apiservice.addTodo(todo);
     await getTodo();
     log('todo added providerdata : ${todo.toString()}');
   } catch (e) {
     log('failed to add todo : ${e.toString()}');
   }finally{
    isloading = false;
    notifyListeners();
   }
}


Future<void>updateTodo(todomodel todo)async{
  isloading = true;
  notifyListeners();

  try {
    await apiservice.updateTodo(todo, todo.id.toString());
    await getTodo();
    log('todo updated provider data ${todo.toString()}');
  } catch (e) {
    log('failed to update providerdata ${e.toString()}');
  }finally{
    isloading = false;
    notifyListeners();
  }

}


Future<void> deleteTodo(
  String id
)async{
  isloading = true;
  notifyListeners();

  try {
    await apiservice.deleteTodo(id);
    todos.removeWhere((todos)=> todos.id.toString() == id);
    await getTodo();
  } catch (e) {
    log('failed to delete todo providerdata :${e.toString()}');
  }
}
}