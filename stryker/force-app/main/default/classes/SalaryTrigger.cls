public class SalaryTrigger {
    public static void UpdateTotSalary(Map<Id,Salary__c>Oldmap,Map<Id,Salary__c>Newmap){
        list<string>Empids=new list<string>();
        for(Salary__c salobj:Oldmap.values()){
            if(Oldmap.get(salobj.id).Basic_Salary__c!=Newmap.get(salobj.id).Basic_Salary__c ||
               Oldmap.get(salobj.id).HRA__c!=Newmap.get(salobj.id).HRA__c ||
               Oldmap.get(salobj.id).Other_Allowance__c!=Newmap.get(salobj.id).Other_Allowance__c){
                   Empids.add(salobj.Employ_Id__c);
               }
        }
        if(!Empids.isEmpty()){
            list<Employe__c>emplist=new list<Employe__c>();
            for(Employe__c empobj:[select id,Employ_Id__c,Total_salary__c from Employe__c where Employ_Id__c IN:Empids]){
                for(Salary__c salobj:Newmap.values()){
                    empobj.Total_salary__c=salobj.Basic_Salary__c+salobj.HRA__c+salobj.Other_Allowance__c;
                    emplist.add(empobj);
                }
            }
            if(!emplist.isEmpty()){
                update emplist;
            }
        }
    }
}