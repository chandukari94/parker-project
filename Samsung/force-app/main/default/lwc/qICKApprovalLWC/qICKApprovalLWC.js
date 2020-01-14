import { LightningElement ,wire,track} from 'lwc';
import approve from '@salesforce/apex/Approve_createAcc.approve';

export default class QICKApprovalLWC extends LightningElement {
    @track error;
    @track data ;
    @wire(approve)
    wiredOpps({
        error,
        data
    }){
        if (data) {
            this.data = data;
           
        } else if (error) {
            this.error = error;
        }
    } 
}