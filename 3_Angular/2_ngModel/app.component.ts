import { Component } from '@angular/core';
import { Todo, TodoClass, TodoStatusType } from './@models/todo.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  title = "OneTodo";
  toggleAll = false;
  nowTodoStatusType = TodoStatusType.All;
  TodoStatusType = TodoStatusType;
  todoInputModel = '';

  todoDataList: Todo[] = [
    { Status: true, Thing: '第1件事情', Editing: false },
    { Status: true, Thing: '第2件事情', Editing: false },
    { Status: true, Thing: '第3件事情', Editing: false }
  ];

  toggleAllFn() {
    this.toggleAll = !this.toggleAll;
    this.todoDataList.forEach(item => {
      item.Status = this.toggleAll;
    });
  }

  clickCheck(item: Todo) {
    item.Status = !item.Status;
    if (this.todoCompleted.length === this.todoDataList.length) {
      this.toggleAll = true;
    } else {
      this.toggleAll = false
    }
  }

  // deleteTodo(index: number) {
  //   // this.todoDataList.splice(index, 1, { Status: false, Thing: '第5566件事情' });
  //   this.todoDataList.splice(index, 1);
  // }

  deleteTodo(item: Todo) {
    this.todoDataList = this.todoDataList.filter(data => data !== item);
  }

  addTodo() {
    const todo: Todo = { Status: true, Thing: this.todoInputModel, Editing: false };
    this.todoDataList.push(todo);
    this.todoInputModel = '';
  }

  edit(item: Todo) {
    item.Editing = true;
  }

  setTodoStatusType(type: number) {
    console.log(window.location.href);
    this.nowTodoStatusType = type;
  }

  get todoActive(): Todo[] {
    return this.todoDataList.filter(data => !data.Status);
  }

  get todoCompleted(): Todo[] {
    return this.todoDataList.filter(data => data.Status);
  }

  get nowTodoList(): Todo[] {
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

  clearCompleted() {
    this.todoDataList = this.todoActive;
  }

  // addTodo(event: KeyboardEvent) {
  //   if (event.key === 'Enter') {
  //     const value = (event.target as HTMLInputElement).value;
  //     this.todoDataList.push({Status: true, Thing: value});
  //     (event.target as HTMLInputElement).value = '';
  //   }
  // }

}

