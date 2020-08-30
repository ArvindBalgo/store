import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {ListComponent} from './components/list/list.component';
import {HomeComponent} from './components/home/home.component';
import {ItemComponent} from "./components/item/item.component";


const routes: Routes = [
  { path: '*', component: HomeComponent },
  { path: 'list/:category', component: ListComponent },
  { path: 'list/:category/:store', component: ItemComponent },
  { path: 'home', component: HomeComponent },
  { path: '**', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
