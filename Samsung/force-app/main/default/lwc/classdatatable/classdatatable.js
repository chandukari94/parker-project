import { LightningElement ,wire,track} from 'lwc';
import getAllOpps from '@salesforce/apex/Allopportunitys.getAllOpps';

export default class Classdatatable extends LightningElement {
    @track columns = [{
        label: 'Opportunity name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    }
    ];
    @track error;
    @track data ;
    @wire(getAllOpps)
    wiredOpps({
        error,
        data
    }) {
        if (data) {
            this.data = data;
            //console.log(data);
           // console.log(JSON.stringify(data, null, '\t'));
        } else if (error) {
            this.error = error;
        }
    }
}