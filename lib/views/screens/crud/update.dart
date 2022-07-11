/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_http_crud_example/controllers/providers/todo.dart';
import 'package:api_http_crud_example/models/todo.dart';
import 'package:api_http_crud_example/views/screens/crud/list.dart';
import 'package:api_http_crud_example/views/widgets/buttons.dart';
import 'package:api_http_crud_example/views/widgets/text_form_fields.dart';

class UpdateTodo extends StatelessWidget {
  UpdateTodo({Key? key}) : super(key: key);

  final _updateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = context.read<TodoProvider>();
    final TextEditingController titleController =
        TextEditingController(text: todoProvider.selectedTodo!.title);
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.selectedTodo!.title!.length,
        ),
      ),
    );
    final TextEditingController completedController =
        TextEditingController(text: todoProvider.selectedTodo!.completed);
    completedController.value = completedController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.selectedTodo!.completed!.length,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _updateKey,
            child: Column(
              children: [
                iTextFormField(
                  context,
                  'Todo Text',
                  'Enter Todo Text',
                  Icons.title,
                  (val) => todoProvider.selectTodo(TodoModel(
                    id: todoProvider.selectedTodo!.id,
                    title: val,
                    completed: todoProvider.selectedTodo!.completed,
                  )),
                  titleController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormField(
                  context,
                  'Todo Completed',
                  'Enter Todo Completed',
                  Icons.description,
                  (val) => todoProvider.selectTodo(TodoModel(
                      id: todoProvider.selectedTodo!.id,
                      title: todoProvider.selectedTodo!.title,
                      completed: val)),
                  completedController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _updateKey, 'Update Todo', () {
                  // TODO: complete update function api with real api server or local host
                  todoProvider.updateList(TodoModel(
                    id: todoProvider.selectedTodo!.id,
                    title: todoProvider.selectedTodo!.title,
                    completed: todoProvider.selectedTodo!.completed,
                  ));
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
