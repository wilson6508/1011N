import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  title = "OneTodo";
  toggleAll=false;
  todoDataList = [
    { Status: true, Thing: '第1件事情' },
    { Status: true, Thing: '第2件事情' },
    { Status: true, Thing: '第3件事情' }
  ];

  toggleAllFn() {
    this.toggleAll = !this.toggleAll;
    this.todoDataList.forEach(item => {
      item.Status = this.toggleAll;
    });
  }

  clickCheck(item: any) {
    item.Status = !item.Status;
  }

  deleteTodo(index: number) {
    // this.todoDataList.splice(index, 1, { Status: false, Thing: '第5566件事情' });
    this.todoDataList.splice(index, 1);
  }

  addTodo(input: HTMLInputElement) {
    this.todoDataList.push({Status: true, Thing: input.value});
    input.value = '';
  }  

  // addTodo(event: KeyboardEvent) {
  //   if (event.key === 'Enter') {
  //     const value = (event.target as HTMLInputElement).value;
  //     this.todoDataList.push({Status: true, Thing: value});
  //     (event.target as HTMLInputElement).value = '';
  //   }
  // }

}

