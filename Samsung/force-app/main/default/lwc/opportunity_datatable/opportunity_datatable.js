import { LightningElement ,wire,track} from 'lwc';
import getAllOpps from '@salesforce/apex/Allopportunitys.getAllOpps';
 
export default class DatatableEx12 extends LightningElement {
    @track columns = [{
            label: 'Opportunity name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        },
        {
            label: 'Stage Name',
            fieldName: 'StageName',
            type: 'text',
            sortable: true
        },
        {
            label: 'Close date',
            fieldName: 'CloseDate',
            type: 'date',
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