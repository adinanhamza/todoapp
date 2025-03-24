import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/provider.dart';
import 'package:todo_app/view/add.dart';
import 'package:todo_app/view/view.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 @override
 void initState(){
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_){
    Provider.of<Todoprovider>(context,listen: false).getTodo();
  });
 }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<Todoprovider>(context);

    return Consumer<Todoprovider>(
      builder: (context, valuepro, child) => 
       Scaffold(
        
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
