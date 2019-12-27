public class LightningFileUploadHandler {
   
    
    @AuraEnabled
    public static String Fileupload(ContentVersion files){
        String result;
        try{
            insert files;
            result='Success'; 
        }catch(exception e){
            result =e.getMessage();
        }
       return  result;
    } 
	@AuraEnabled
    public static list<ContentVersion> getfile(){
        list<ContentVersion > filelist=[select Title,FileExtension,FileType,Description from ContentVersion ];
        return filelist;
    }
 }