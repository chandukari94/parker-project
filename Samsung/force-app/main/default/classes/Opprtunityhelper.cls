public class Opprtunityhelper {
    Public static void updatestage(map<Id,Opportunity> OPPoldmap,map<Id,Opportunity> OPPnewmap){
        set<ID>oppids=new set<ID>();
        for(Opportunity opp:OPPoldmap.Values()){
            if(OPPoldmap.get(opp.id).StageName!=OPPnewmap.get(opp.id).StageName){
                oppids.add(opp.id);
            }
        }
        if(!oppids.isEmpty()){
            for(Opportunity op:[select id,StageName,(select WhatId  FROM Tasks) from Opportunity where ID IN:oppids]){
                // (select WhatId  FROM Tasks)
                if(op.Tasks.size()>=1){
                    opportunity newRecords=OPPnewmap.get(op.id);
                    newRecords.StageName.addError('you Cannot Change the StageName Task are Pending for this Opportunity');
                }
            }
        }
    }
}