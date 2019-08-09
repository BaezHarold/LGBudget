@isTest
public class TestData {
    
    public static void createTestBudgets(Integer numBuds) {
        List<Budget__c> listOfBudgets = new List<Budget__c>();
        
        List<String> pickListValues = new List<String> {'Shopping', 'Food & Dining', 'Auto & Transport', 'Entertainment'};
        
        for(integer i = 0; i < numBuds; i++) {
            Budget__c newBudget = new Budget__c(Name='TestBudget ' + i, TotalBudget__c=(Decimal)(Math.random()*15*900), 
                                        BudgetFor__c=pickListValues[Math.mod(i,pickListValues.size())], StartMonthOfBudget__c=System.today());
            listOfBudgets.add(newBudget);
        }
        insert listOfBudgets;
    }
    
    public static void createTestAccounts(Integer numAccs) {
        List<Account__C> listOfAccounts = new List<Account__c>();
        
        List<String> pickListAccountType = new List<String> {'Checking', 'Saving'};
        
        List<String> pickListCompany = new List<String> {'Chase Bank', 'Wells Fargo', 'Bank Of America', 'PNC'};
            
        List<String> pickListTypeOfCard = new List<String> {'Discover', 'American Express', 'Amazon', 'Walmart', 'Target', 'Sony', 'BarclayCard', 'Other'};  
        
        List<String> pickListTypeOfAccount = new List<String> {'Bank', 'Credit Cards'};
        
        for(Integer j = 0; j < numAccs; j++) {
            String accountType = pickListTypeOfAccount[Math.mod(j,pickListTypeOfAccount.size())];
            if(accountType == 'Bank') {
				Account__c newBankAccount = new Account__c(Name='TestAccount ' + j, TypeOfAccount__c=pickListTypeOfAccount[Math.mod(j,pickListTypeOfAccount.size())],
                                                      Company__c=pickListCompany[Math.mod(j,pickListCompany.size())], AmountAvailable__c=(Decimal)(Math.random()*15*900),
                                                      AccountType__c='Bank');                
            } else {
                Account__c newCreditCard = new Account__c(Name='TestAccount ' + j, TypeOfCreditCard__c=pickListTypeOfCard[Math.mod(j,pickListTypeOfCard.size())],
                                                      AvailableCredit__c=(Decimal)(Math.random()*15*900), TotalCredit__c=(Decimal)(Math.random()*15*900), CurrentBalance__c=(Decimal)(Math.random()*15*900));             
            }
        }
        
        
    }

}