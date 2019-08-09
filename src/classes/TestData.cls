@isTest
public class TestData {
    
    public static void createTestBudgets(Integer numBuds) {
        List<Budget__c> listOfBudgets = new List<Budget__c>();
        
        List<String> pickListValues = new List<String> {'Shopping', 'Food & Dining', 'Auto & Transport', 'Entertainment'};
        
        for(integer i = 0; i < numBuds; i++) {
            Budget__c a = new Budget__c(Name='TestBudget' + i, TotalBudget__c=(Decimal)(Math.random()*15*900), 
                                        BudgetFor__c=pickListValues[Math.mod(i,pickListValues.size())], StartMonthOfBudget__c=System.today());
            listOfBudgets.add(a);
        }
        insert listOfBudgets;
    }
    
    public static void createTestAccounts(Integer numAccs) {
        List<Account__C> listOfAccounts = new List<Account__c>();
        
        List<String> pickListValues = new List<String> {'Bank', 'Credit Cards'};
       	
        
    }

}