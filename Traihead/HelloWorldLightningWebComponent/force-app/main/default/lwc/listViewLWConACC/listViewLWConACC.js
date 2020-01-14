import {LightningElement, wire,track } from 'lwc';
import {getListUi} from 'lightning/uiListApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
 
export default class ListViewLWConACC extends LightningElement {
    @track sobjectResult;
    @wire(getListUi, {
        objectApiName: ACCOUNT_OBJECT,
        listViewApiName: 'All'
    })
    wiredlistView({
        error,
        data
    }) {
        if (data) {
            this.sobjectResult = data.records.records;
        } else if (error) {
            this.error = error;
        }
    }
 
   
}
 