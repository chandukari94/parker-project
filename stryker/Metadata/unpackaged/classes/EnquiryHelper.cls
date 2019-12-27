public class EnquiryHelper {
    public void autonumbergen(list<Enquiry__c>lstenuiry){
        for(Enquiry__c lstobj:lstenuiry){
            if(lstobj.Enquiry_Number__c==Null){
                lstobj.Enquiry_Number__c='1';
            }else{
                lstobj.Enquiry_Number__c=lstobj.Enquiry_Number__c+1;
            }
        }
    }
}