trigger TransactionTrigger on Transaction__c (before insert, before update, after insert, after update) {
 // This trigger will try to make sure that data is inserted that are suppose to be inserted and also
 // Try to update the Account and Budget object 
 
	if(Trigger.isBefore) {
		if(Trigger.isInsert){
            TransactionMatchesBudget.checkingTransactionGoToCorrectMonthBudget(Trigger.new);
			TransactionMatchesBudget.checkingTransactionsToGoInCorrectBudget(Trigger.new);            
		} else if(Trigger.isUpdate) {
			
		}
	} else {
		if(Trigger.isInsert) {
			AccountAvailableAmount.updateAvailableAmountInAccount(Trigger.new);
		} else if(Trigger.isUpdate) {
			
		}
	}
}