public class EnquiryHandler {
    public static void onBeforeInsert(list<Enquiry__c>lstenuiry){
        	EnquiryHelper helperobj=new EnquiryHelper();
        	helperobj.autonumbergen(lstenuiry);
        }
    }