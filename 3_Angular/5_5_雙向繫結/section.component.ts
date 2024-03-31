import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Todo } from 'src/app/@models/todo.model';
import { TodoApiService } from 'src/app/@services/todo-api.service';

@Component({
  selector: 'app-section',
  templateUrl: './section.component.html',
  styleUrls: ['./section.component.scss']
})
export class SectionComponent implements OnInit {
  @Input()
  nowTodoList!: Todo[]
  @Input()
  todoCompleted!: Todo[];
  @Input()
  todoDataList!: Todo[];
  @Output()
  todoDataListChange = new EventEmitter<Todo[]>();

  get toggleAllBtn() {
    if (this.todoCompleted.length === this.todoDataList.length) {
      return true;
    } else {
      return false;
    }
  };

  constructor(private todoApiService: TodoApiService) { }

  ngOnInit(): void { }

  clickCheck(item: Todo) {
    item.Status = !item.Status;
    this.todoApiService.修改(item).subscribe();
  }

  edit(item: Todo) {
    if (item.CanEdit) {
      item.Editing = true;
    }
  }

  delete(item: Todo) {
    this.todoApiService.刪除(item).subscribe();
    this.todoDataList = this.todoDataList.filter(data => data !== item);
    this.todoDataListChange.emit(this.todoDataList);
    // 有改變記憶體位址 -> 雙向綁定
    // 單純操作如 push splice -> 父傳子
  }

  update(item: Todo) {
    this.todoApiService.修改(item).subscribe();
    item.Editing = false;
  }

  toggleAll() {
    const toggle = !this.toggleAllBtn;
    this.todoDataList.forEach(data => {
      data.Status = toggle;
    });
    this.todoApiService.全部狀態統一(toggle).subscribe();
  }

}
