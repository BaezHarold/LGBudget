public class IncomeTransaction {
    
    public static void updateAccount(List<Transaction__c> transactions) {
        
        // Create a list of id for Account that is being selected
        List<Id> accountIdsPick = new List<Id>();
        for(Transaction__c tList : transactions) {
            accountIdsPick.add(tlist.Account__c);
        }
        
        List<Account__c> accountsCurrentlyInDatabase = [SELECT AmountAvailable__c, AvailableCredit__c, AccountType__c FROM Account__c WHERE Id IN : accountIdsPick];
        
        
        for(Transaction__c tran : transactions) {
            for(Account__c acco : accountsCurrentlyInDatabase) {
                if(tran.Account__c == acco.Id) {
                    if(tran.Income__c == TRUE) {
                        System.debug('Income Checkbox ' + tran.Income__c);
                    	if(acco.AccountType__c == 'Bank') {
                       	 acco.AmountAvailable__c = acco.AmountAvailable__c + tran.Amount__c; 
                    	} else if(acco.AccountType__c == 'Credit Card') {
                        	acco.AvailableCredit__c = acco.AvailableCredit__c + tran.Amount__c;
                    	}
                    }
                }
            }            
        }
        update accountsCurrentlyInDatabase;
    }
}