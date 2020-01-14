import { LightningElement ,track} from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

// importing to show toast notifictions

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import class__c_OBJECT from '@salesforce/schema/Class__c';
import NAME_FIELD from '@salesforce/schema/Class__c.Name';
export default class ClassONaproval extends LightningElement {
    @track error;
    @track clsRecord = {
        Name : NAME_FIELD,
    };
   

    handleNameChange(event) {
        this.clsRecord.Name = event.target.value;
        window.console.log('Name ==> '+this.clsRecord.Name);
    }
    

    handleSave() {
        const fields = {};

        fields[NAME_FIELD.fieldApiName] = this.clsRecord.Name;
        
       
        // Creating record using uiRecordApi
        let recordInput = { apiName: class__c_OBJECT.objectApiName, fields }
        createRecord(recordInput)
        .then(result => {
            // Clear the user enter values
            this.clsRecord = {};

            window.console.log('result ===> '+result);
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Approval record Created Successfully!!',
                variant: 'success'
            }),);
        })
        .catch(error => {
            this.error = JSON.stringify(error);
        });
    }
}