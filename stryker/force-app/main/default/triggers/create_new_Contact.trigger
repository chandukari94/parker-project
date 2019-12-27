trigger create_new_Contact on Account (Before insert,After insert) {

    if(Trigger.isBefore==true){
    before_insert.data(trigger.new);
    }
    if(trigger.isAfter==true){
     Create_Contact.contact_create(Trigger.new);   
    }
    }