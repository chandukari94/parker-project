trigger Cheque on Cheque_Details__c (After insert) {
        List<Invoice__c>invicelist=[select id,Name,Company__c,Date__c,Due_Amount__c,Due_Date__c,
                                    Email__c,Status__c,Invoce_Amount__c from Invoice__c where Status__c!='Closed'];
    List<Invoice_Payment__c>payments=new List<Invoice_Payment__c>();
    List<Invoice__c>inlist=new List<Invoice__c>();
    for(Cheque_Details__c ch:Trigger.new){
        for(Invoice__c invc:invicelist){
        Invoice_Payment__c IP=new Invoice_Payment__c();
        IP.Amount__c=ch.Amount__c; 
        IP.Invoice_No__c=invc.id; 
        IP.Cheque_No__c=ch.Id;
        payments.add(IP);
    } 
        for(Invoice__c invc:invicelist){
            invc.Paid_Amount__c=ch.Amount__c;
            invc.Due_Amount__c=invc.Due_Amount__c-ch.Amount__c;
            invc.Invoce_Amount__c=ch.Amount__c;
            update invc;
        }
    }
    insert payments;        
}