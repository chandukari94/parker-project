public class filecontent {
    @AuraEnabled
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) { 
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        ContentVersion contentVersion = new ContentVersion(
            versionData = EncodingUtil.base64Decode(base64Data),
            title = fileName,
            pathOnClient =  '/' + fileName,
            FirstPublishLocationId = parentId);
        insert contentVersion; 
        User U=[SELECT Id FROM User where Alias='mman'];
        ContentDocumentLink cdli = new ContentDocumentLink();
        cdli.ContentDocumentId = contentVersion.ContentDocumentId;
        cdli.LinkedEntityId = 'U.Id';
        cdli.ShareType = 'C';
        cdli.Visibility = 'AllUsers';
        try{
             Insert cdli;
        }catch(Exception e) {
           e.getMessage();
        }
       
        return contentVersion.Id;
    }
    
    @AuraEnabled
    public static Id saveTheChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) { 
        if (fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            appendToFile(fileId, base64Data);
        }
        return Id.valueOf(fileId);
    }
    
    private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        ContentVersion contentVersion = [SELECT Id, versionData FROM ContentVersion WHERE Id = :fileId];
        String existingBody = EncodingUtil.base64Encode(contentVersion.versionData);
        contentVersion.versionData = EncodingUtil.base64Decode(existingBody + base64Data); 
        update contentVersion;   
    }
    @AuraEnabled
    public static list<ContentVersion> getfile(){
        list<ContentVersion > filelist=[select Title,FileExtension,FileType,Description from ContentVersion ];
        return filelist; 
    }
}