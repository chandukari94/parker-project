import { LightningElement, track} from 'lwc';

// import uiRecordApi to create record
import { createRecord } from 'lightning/uiRecordApi';
// importing to show toast notifictions
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

// importing Account fields
import OPPORTUNITY_OBJECT from '@salesforce/schema/OPPORTUNITY';
import NAME_FIELD from '@salesforce/schema/OPPORTUNITY.Name';
import STAGENAME_FIELD from '@salesforce/schema/OPPORTUNITY.StageName';
import CLOSEDATE_FIELD from '@salesforce/schema/OPPORTUNITY.CloseDate';


export default class CreateOPP extends LightningElement {
    @track error; 

    // this object have record information
    @track OPPRecord = {
        Name : NAME_FIELD,
        StageName : STAGENAME_FIELD,
        CloseDate : CLOSEDATE_FIELD
    };
    handleNameChange(event) {
        this.OPPRecord.Name = event.target.value;
        window.console.log('Name ==> '+this.OPPRecord.Name);
    }

    handlestageChange(event) {
        this.OPPRecord.StageName = event.target.value;
        window.console.log('stagename ==> '+this.OPPRecord.StageName);
        window.console.log('object ==> '+JSON.stringify(OPPORTUNITY_OBJECT));
    }

    handleCloseDateChange(event) {
        this.OPPRecord.CloseDate = event.target.value;
        window.console.log('closedate ==> '+this.OPPRecord.CloseDate);
    }


    handleSave() {
        const fields = {};

        fields[NAME_FIELD.fieldApiName] = this.OPPRecord.Name;
        fields[CLOSEDATE_FIELD.fieldApiName] = this.OPPRecord.CloseDate;
        fields[STAGENAME_FIELD.fieldApiName] = this.OPPRecord.StageName;
       
       
        // Creating record using uiRecordApi
        let recordInput = { apiName: OPPORTUNITY_OBJECT.objectApiName, fields }
        createRecord(recordInput)
        .then(result => {
            // Clear the user enter values
            this.accRecord = {};

            window.console.log('result ===> '+result);
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Opportunity Created Successfully!!',
                variant: 'success'
            }),);
        })
        .catch(error => {
            this.error = JSON.stringify(error);
        });
    }
}