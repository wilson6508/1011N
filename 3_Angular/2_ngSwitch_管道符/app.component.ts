import { Component } from '@angular/core';
import { Todo, TodoClass, TodoStatusType } from './@models/todo.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  userLv = 2;
  date = new Date();
}
