/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_http_crud_example/controllers/providers/todo.dart';
import 'package:api_http_crud_example/models/todo.dart';
import 'package:api_http_crud_example/views/screens/crud/list.dart';
import 'package:api_http_crud_example/views/widgets/buttons.dart';
import 'package:api_http_crud_example/views/widgets/text_form_fields.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);

  final _createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = context.read<TodoProvider>();
    final TextEditingController titleController =
        TextEditingController(text: todoProvider.title ?? '');
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.title != null ? todoProvider.title!.length : 0,
        ),
      ),
    );
    final TextEditingController completedController =
        TextEditingController(text: todoProvider.completed ?? '');
    completedController.value = completedController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.completed != null
              ? todoProvider.completed!.length
              : 0,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _createKey,
            child: Column(
              children: [
                iTextFormField(
                    context,
                    'Todo Text',
                    'Enter Todo Text',
                    Icons.title,
                    (val) => todoProvider.setTitle(val),
                    titleController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormField(
                    context,
                    'Todo Completed',
                    'Enter Todo Completed',
                    Icons.description,
                    (val) => todoProvider.setCompleted(val),
                    completedController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _createKey, 'Add Todo', () {
                  // TODO: complete add function api with real api server or local host
                  todoProvider.addToList(TodoModel(
                      id: DateTime.now().microsecond.toString(),
                      title: todoProvider.title,
                      completed: todoProvider.completed));
                  todoProvider.setTitle('');
                  todoProvider.setCompleted('');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoList()));
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
