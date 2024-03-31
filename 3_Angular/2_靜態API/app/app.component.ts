import { Component, OnInit } from '@angular/core';
import { Todo, TodoClass, TodoStatusType } from './@models/todo.model';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  constructor(private http: HttpClient) {}
  ngOnInit(): void {
    // throw new Error('Method not implemented.');
    this.http.get<Todo[]>('assets/todo.json').subscribe(data => {
      this.todoDataList = data;
    });
  }

}
