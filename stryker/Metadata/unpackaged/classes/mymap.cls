public class mymap {
    public map<string,list<string>> mymap            {set;get;}
    public list<selectoption> C_list                 {set;get;}
    public list<selectoption> P_list                 {set;get;}
    public string pick                          {set;get;}
    
    public mymap(){
        mymap=new map<string,list<string>>();
        list<string> H_list=new list<string>{'S.R Nagar','Hitech-City','Ameerpet','Kukatpally'};
        list<string> B_list=new list<string>{'Marathalli','Whitefield','E-City','Belandur','ITPL'};
        list<string> V_list=new list<string>{'RK-Beach','Jagadamba','Dwaraka Nagar','Maddelapalem','Rushikonda'};
            mymap.put('Hyderabad',H_list);
        	mymap.put('Bangalore',B_list);
        	mymap.put('Vishakapattanam',V_list);
        	
        C_list=new list<selectoption>();
        P_list=new list<selectoption>();
        
        selectoption o=new selectoption('none','-None-');
        C_list.add(o);
        P_list.add(o);
        
        set<string> myclist=mymap.keyset();
        for(string s:myclist){
            selectoption op=new selectoption(s,s);
            C_list.add(op);
        }
    }
    public void callme(){
        P_list.clear();
        selectoption so=new selectoption('none','-None-');
         P_list.add(so);
        if(pick!='none'){
            List<String> myplaces =mymap.get(pick);
            for(String s: myplaces){
              selectoption op=new selectoption(s,s);  
                 P_list.add(op);
            }
        }
         
    }
}