import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import First_Name from '@salesforce/schema/Contact.FirstName';
import Last_Name from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
export default class ContactCreator extends LightningElement {
    objectApiName = CONTACT_OBJECT;
    fields = [First_Name, Last_Name, Email];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Contact created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}