trigger leadtrigger on Lead (before insert,before update) {
    for(Lead l:trigger.new){
        if(l.phone==null){
            l.phone='99099090';
        }
    }
}