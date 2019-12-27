trigger fileshareOnContentDocument on ContentDocument (after insert) {
    for (ContentDocument cd : Trigger.New) {
        String orgId = UserInfo.getOrganizationId();
        system.debug(orgId);
        ContentDocumentLink[] cdl = [SELECT LinkedEntityId, ContentDocumentId FROM ContentDocumentLink WHERE ContentDocumentId =: cd.Id AND LinkedEntityId =: orgId];
        if (cdl.size() == 0) {
            system.debug(cd.Id);
            ContentDocumentLink cdli = new ContentDocumentLink(ContentDocumentId = cd.Id, LinkedEntityId = orgId, ShareType = 'C', Visibility = 'AllUsers');
            try {
                insert(cdli);
            } catch(DmlException e) { System.debug('Exception occurred on insert: ' + e.getMessage()); }
        }      
    }

}