import { Component } from '@angular/core';
import { Todo, TodoClass } from './@models/todo.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  title = "OneTodo";
  toggleAll=false;
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
  }

  deleteTodo(index: number) {
    // this.todoDataList.splice(index, 1, { Status: false, Thing: '第5566件事情' });
    this.todoDataList.splice(index, 1);
  }

  addTodo(input: HTMLInputElement) {
    const todo: Todo = {Status: true, Thing: input.value, Editing: false};
    this.todoDataList.push(todo);
    input.value = '';
  }

  edit(item: Todo) {
    item.Editing = true;
  }

  update(item: Todo, value: string) {
    item.Thing = value;
    item.Editing = false;
  }  

  // addTodo(event: KeyboardEvent) {
  //   if (event.key === 'Enter') {
  //     const value = (event.target as HTMLInputElement).value;
  //     this.todoDataList.push({Status: true, Thing: value});
  //     (event.target as HTMLInputElement).value = '';
  //   }
  // }

}

