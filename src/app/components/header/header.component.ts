import { Component, OnInit } from '@angular/core';
import {FormControl} from '@angular/forms';
import {IDropdownSettings} from 'ng-multiselect-dropdown/multiselect.model';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  dropdownList = [];
  selectedItems = [];
  dropdownSettings = {};

  constructor() { }
  ngOnInit(): void {

    this.dropdownList = [
      { item_id: 1, item_text: 'Food' },
      { item_id: 2, item_text: 'Cloth' },
      { item_id: 3, item_text: 'Transport' },
      { item_id: 4, item_text: 'Jewellery' },
      { item_id: 5, item_text: 'Others' }
    ];

    this.dropdownSettings = {
      singleSelection: false,
      idField: 'item_id',
      textField: 'item_text',
      selectAllText: 'Select All',
      unSelectAllText: 'UnSelect All',
      itemsShowLimit: 6,
      allowSearchFilter: true
    };
  }
  onItemSelect(item: any) {
    console.log(item);
  }
  onSelectAll(items: any) {
    console.log(items);
  }

}
