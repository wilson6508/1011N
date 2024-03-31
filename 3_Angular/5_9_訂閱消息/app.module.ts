import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { MissionControlComponent } from './mission-control/mission-control.component';
import { AstronautComponent } from './mission-control/astronaut/astronaut.component';

@NgModule({
  declarations: [
    AppComponent,
    MissionControlComponent,
    AstronautComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule, // 引入這個
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
