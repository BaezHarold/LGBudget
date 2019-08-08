public class AccountAvailableAmount {
    
    public static void updateAvailableAmountInAccount(List<Transaction__c> transactions) {
        
        Set<Id> AccIds = new Set<Id>();
        // Empty List
        List<Decimal> amountMoney = new List<Decimal>();
        
        // List of amount found in Account and then in Transaction
        List<Account__c> accountBankAvailableAmount = [SELECT AmountAvailable__c, AccountType__c FROM Account__c]; // WHERE AccountType__c = 'Bank'
        List<Transaction__c> transactionAmount = [SELECT Amount__c, Account__r.Name FROM Transaction__c];
        
        for(Transaction__c t : transactions){
            Decimal balance = 0;
        }
        
        
        Integer sumAmount = 0;
   		
        
        
        
        
        
        System.debug('Account: ' + accountBankAvailableAmount);
        System.debug('Transaction: ' + transactionAmount);
        System.debug('New Amount: ' + sumAmount);
    }

}