import { LightningElement,track } from 'lwc';

export default class Web_one extends LightningElement {
    @track result='This is first web Component';

    invoke(event){
        this.result=event.target.value;
    }
}