import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  title = "OneTodo";
  placeholder = "What needs to be done?7788"

  toggleAll=false;

  c1=false;
  c2=false;
  c3=false;

  z1="";

  btnFn(event:MouseEvent) {
    console.log(event);
  }

  toggleAllFn() {
    this.toggleAll = !this.toggleAll;
    this.c1 = this.toggleAll;
    this.c2 = this.toggleAll;
    this.c3 = this.toggleAll;
    
    if (this.toggleAll) {
      this.z1 = "smallText";
    } else {
      this.z1 = "";
    }
  }

}

