public class AccauntsController {
    
    public Account createAccaunts{ get; set;} 
    List<Account> accountsToUpdate = new List<Account>();
    
    // create new 5 accounts
    public static void CreateAccounts() {
       /* List<Account> NewAccounts = new List<Account>();	
        for(Integer i=0;i<5;i++) {
            Account accountsNew = new Account(Name='Salesforce Developers' + ' ' + i, 
                           		BillingCity='Minsk',
                               	Type ='Prospect');
            newAccounts.add(accountsNew);
       	}
        insert NewAccounts;
        system.debug(NewAccounts);*/
        List <Account> NewAccounts = new List <Account>{
            				  new Account(Name='developer1', BillingCity='Minsk', Type ='Other'),
            				  new Account(Name='developer2', BillingCity='Minsk', Type ='Other'),
             				  new Account(Name='developer3', BillingCity='Moscow', Type ='Other'),
                              new Account(Name='developer4', BillingCity='Minsk', Type ='Other'),
                              new Account(Name='developer5', BillingCity='Brest', Type ='Other')};
        insert NewAccounts;
        
    }  
    
    // for table view 5 accounts
     public List <Account> getAccounts() {
        List <Account> accounts = [SELECT Id, Name, BillingCity, Type 
                                   FROM Account 
                                   ORDER BY CreatedDate DESC LIMIT 5];         
        return accounts;
    }
    
    // for updating my table
    public void AfterUpdate(List<Account> newAcc){
        
    }
    
    // delete 5 accounts
    public static void deleteAccaunts(){
        List <Account> deleteLast = [SELECT Id, Name, BillingCity, Type 
                                   FROM Account 
                                   ORDER BY CreatedDate DESC LIMIT 5];         
        delete deleteLast;
    }
    
    //update account name and create contact
    public static void updateAccaunts(){
     
        for(Account accountsToUpdate: [SELECT Id, Name, BillingCity, Type 
                          FROM Account 
                          WHERE BillingCity = 'Minsk'
                   		  LIMIT 5]){
    		accountsToUpdate.BillingCity = 'Brest';
                              update accountsToUpdate;
                              Contact newContact = new Contact();
                              newContact.LastName = 'Helg';
                              newContact.FirstName = 'Tourchin';
                              newContact.AccountId = accountsToUpdate.Id;
                              insert newContact;
   		 }
        
    }
}