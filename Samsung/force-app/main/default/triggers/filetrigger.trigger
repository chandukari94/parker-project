trigger filetrigger on ContentVersion (after update) {
    for(ContentVersion cv:Trigger.new){
        set<ID> docids=new set<ID>();
        user u=[select id from user];
        if(cv.check__c==true){
         docids.add(cv.ContentDocumentId);
        }
        list<ContentDocumentLink>docslist=[SELECT Id, ContentDocumentId, ShareType, Visibility FROM ContentDocumentLink where ContentDocumentId IN:docids];
        for(ContentDocumentLink cdl:docslist){
            
        }
    }
}