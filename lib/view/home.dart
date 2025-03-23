import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/provider.dart';
import 'package:todo_app/view/add.dart';
import 'package:todo_app/view/update.dart';
import 'package:todo_app/view/view.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
 @override
//  void initState(){
//   Provider.of(context)
//  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<Todoprovider>(context);

    return Consumer<Todoprovider>(
      builder: (context, valuepro, child) => 
       Scaffold(
          // Provider.of<Todoprovider>(context).getTodo();
        appBar: AppBar(title: const Text("Todo List")),
        body: 
        provider.isloading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (context, index) {
                  final todo = provider.todos[index];
                  return Card(
                    child: ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.description),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewTodoPage(todo: todo),
                        ),
                      ),
                      trailing: Icon(Icons.table_rows_rounded)
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddTodoPage()),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
