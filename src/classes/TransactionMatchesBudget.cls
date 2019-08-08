public class TransactionMatchesBudget {
    
    public static void checkingTransactionsToGoInCorrectBudget(List<Transaction__c> transactions) {
        
        // Creating List that will store ids of Budget that has been picked when inserting a new Transaction
        List<Id> BudgetIds = new List<Id>();
        for(Transaction__c tList : transactions) {
            BudgetIds.add(tList.Budget__c);
        }
        
        // Creating list to store current Budgets in database that match the ids from the above list
        List<Budget__c> listOfBudgetsInDatabase = [Select Id, BudgetFor__c FROM Budget__c WHERE Id =: BudgetIds];
        
        // this loops through the new transaction being made and the budget in database and compares that it is correct budget type
        for(Transaction__c t : transactions) {
            for(Budget__c c : listOfBudgetsInDatabase) {
                if (t.TypeOfTransaction__c != c.BudgetFor__c) {
                    t.addError('Make sure Transaction is being attached to the correct Budget Ex. Shopping transaction goes to Shopping Budget');
                }
            }
        }
     }
    
    public static void checkingTransactionGoToCorrectMonthBudget(List<Transaction__c> transactions) {
        
        // Create List of ids for Budgets being picked
        List<Id> idForBudgetPicked = new List<Id>();
        for(Transaction__c tra : transactions) {
            idForBudgetPicked.add(tra.Budget__c);
        }
        
        // List for budget that is in database that matches id of budgets being picked when creating transaction
        List<Budget__c> budgetInDatabase = [SELECT Id, StartMonthOfBudget__c FROM Budget__c WHERE Id =: idForBudgetPicked];
        
        // this loops through the new transaction being made and the budget in database and compares the month
        for(Transaction__c tb : transactions) {
            for (Budget__c bb : budgetInDatabase) {
                if(tb.DateOfTransaction__c.month() != bb.StartMonthOfBudget__c.month()) {
                    tb.addError('Make sure matching transaction to correct Budget month');
                }
            }
        }     
    }
}