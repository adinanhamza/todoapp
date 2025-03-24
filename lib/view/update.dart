import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/provider.dart';
import 'package:todo_app/model/model.dart';


class EditTodoPage extends StatefulWidget {
  final todomodel todo; 

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(text: widget.todo.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateTodo() {
      final updatedTodo = todomodel(
        id: widget.todo.id, 
        title: _titleController.text, 
        description: _descriptionController.text,
      );

      Provider.of<Todoprovider>(context, listen: false)
          .UpdateTodo(updatedTodo);

      Navigator.pop(context); 
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) =>
                  value!.isEmpty ? 'Title cannot be empty' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) =>
                  value!.isEmpty ? 'Description cannot be empty' : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _updateTodo,
                child: const Text('Update Todo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
