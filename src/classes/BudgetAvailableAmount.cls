public class BudgetAvailableAmount {
    
    public static void updateTheBalanceOfBudgets(List<Transaction__c> transactions) {
        
        
        List<Id> budgetIdsPicked = new List<Id>();
        for(Transaction__c trList : transactions) {
            budgetIdsPicked.add(trList.Budget__c);
        }
        
        List<Budget__c> budgetCurrentlyInDatabase = [SELECT TotalBudget__c From Budget__c Where Id IN: budgetIdsPicked];
        
        for(Transaction__c trans : transactions) {
            for(Budget__c bud : budgetCurrentlyInDatabase) {
                if(trans.Budget__c == bud.Id) {
                    bud.TotalBudget__c = bud.TotalBudget__c - trans.Amount__c;
                }
            }
        }
        update budgetCurrentlyInDatabase;
    }
}