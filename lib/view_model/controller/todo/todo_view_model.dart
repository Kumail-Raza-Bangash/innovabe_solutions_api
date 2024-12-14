import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/models/todo/todo_list_model.dart';
import 'package:innovabe_solutions_api/repository/todo_repo/todo_list_repo.dart';

class TodoListViewModel extends GetxController {
  final api = TodoListRepository();

  final rxRequestStatus= Status.LOADING.obs;
  final todoList= TodoListModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setTodoListStatus(TodoListModel _value) => todoList.value = _value;
  
  void todoListApi(){
    api.todoListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setTodoListStatus(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
