trigger Contacttrigger on SOBJECT (before insert) {
    for(Contact obj:trigger.new){
        if(obj.mail=Null){
            obj.phone.addError('fill the phone');
        }
    }
}