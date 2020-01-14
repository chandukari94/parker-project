public class Employehandler {
    public static void createEnquiry(list<Employe__c>Employelist){
        list<Enquiry__c>listOfEnquiry=new list<Enquiry__c>(); 
        for(Employe__c empobj:Employelist){
            if(empobj.Enquiry__c==true){
                Enquiry__c enqobj=new Enquiry__c();
                enqobj.name='employe-1';
                enqobj.Employe__c=empobj.Id;
                listOfEnquiry.add(enqobj);
            }
        }
         insert listOfEnquiry;
    }
    
    public static void updateEnquiry(map<Id,Employe__c> oldemp,map<Id,Employe__c> newemp){
        set<id> updateids=new set<id>();
        set<Id> empids=oldemp.keyset();
        for(id key:empids){
            Employe__c olddata=oldemp.get(key);
            Employe__c newdata=newemp.get(key);
            if(olddata.Enquiry__c!=newdata.Enquiry__c){
                updateids.add(key);
            }
        }  
        list<Employe__c>acclist=[select id from Employe__c where id in:updateids];
        list<Enquiry__c>enquirylist=new list<Enquiry__c>();
        for(Employe__c empobj:acclist){
            Enquiry__c obj=new Enquiry__c();
            obj.name='employe-12';
            obj.Employe__c=empobj.Id;
            enquirylist.add(obj);
        }
        insert enquirylist;
    }
    public static void updateEmployeAmount(list<Employe__c>listOfEmploye){
        list<decimal> empAmountids=new list<decimal>();
        for(Employe__c empobj:listOfEmploye){
            if(empobj.Amount__c==NUll ){
               empobj.Amount__c=10000;
            }
        }
    }
}