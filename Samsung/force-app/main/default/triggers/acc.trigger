trigger acc on Account (before insert) {
    list<Account>mylist=new list<Account>();
    For(Account a:trigger.new){
       Account acc=new Account();
        if(acc.Rating=='Hot'){
            acc.Industry='Banking';
        }
        mylist.add(acc);
    }
    insert mylist;
}