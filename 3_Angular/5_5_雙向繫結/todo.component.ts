import { Component, OnInit } from '@angular/core';
import { Todo, TodoClass, TodoStatusType } from '../@models/todo.model';
import { TodoApiService } from '../@services/todo-api.service';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.scss']
})
export class TodoComponent implements OnInit {
  title = '  OneTodo  ';
  todoDataList: Todo[] = [];
  nowTodoStatusType = TodoStatusType.All;
  toggleAllBtn = false;

  get nowTodoList() {
    let list: Todo[] = [];

    switch (this.nowTodoStatusType) {
      case TodoStatusType.Active:
        list = this.todoActive;
        break;
      case TodoStatusType.Completed:
        list = this.todoCompleted;
        break;
      default:
        list = this.todoDataList;
        break;
    }
    return list;
  }

  get todoActive(): Todo[] {
    return this.todoDataList.filter(data => !data.Status);
  }

  get todoCompleted(): Todo[] {
    return this.todoDataList.filter(data => data.Status);
  }

  constructor(private todoApiService: TodoApiService) { }

  ngOnInit(): void {
    this.getData();
  }

  getData() {
    this.todoApiService.取得資料().subscribe(data => {
      this.todoDataList = data;
      this.todoDataList.forEach(data2 => {
        data2.CanEdit = true;
        data2.Editing = false;
      });
    });
  }

  deleteItem(item: Todo) {
    this.todoDataList = this.todoDataList.filter(data => data !== item);
  }

  clear() {
    this.todoDataList = this.todoActive;
  }

  statusTypeChange(type: number) {
    this.nowTodoStatusType = type;
  }

}
