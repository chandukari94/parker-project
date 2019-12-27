trigger pro_trigggg on Project__c (before insert) {
   
       project_app.sendemail(trigger.new);
  
}