public class loan_usecase {
    //These variables are Customer details .
    
    public string lastname {set;get;}
	public string firstname {set;get;}
    public string email {set;get;}
    public integer phone {set;get;}
    
    //These variables are Property details.
    
    public string type {set;get;}
    public decimal price {set;get;}
    public string area {set;get;}
    public string location {set;get;}
    
    //These variables are Education Details.
    
    public string qualification {set;get;}
    public string city {set;get;}
    public integer amount {set;get;}
    public string course {set;get;}
    
    
    public string loantype {set;get;} //this variable is Picklist.
    public string selected {set;get;} // this variable is Rendered.
     
    
    
    public void go(){
                      
                      if(loantype=='none')
                         {
                           apexpages.message msg1=new apexpages.message(apexpages.Severity.ERROR,'choose any one option');
                                 Apexpages.addMessage(msg1);
                          }
                        	else
                            { 
                                if(loantype=='education') //if loantype=education getting rendered value education will work.
                                	{
                              		    selected='education';
                           		    }
                                else
                            		{
                             		    selected='houseing'; //else loantype=houseing getting rendered value houseing will work.
                           		    }
                  		   }
        
                     } 
    public void cancel(){ //this"cancel" method will work cancel button.
         loantype='none';
        selected='';
    }
}