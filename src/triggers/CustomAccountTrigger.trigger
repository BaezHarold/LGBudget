trigger CustomAccountTrigger on Account__c (before insert) {

    if(Trigger.isBefore) {
		if(Trigger.isInsert){
            AccountAvailableAmount.updateAvailableAmountInAccount(Trigger.new);
		} else if(Trigger.isUpdate) {
			
		}
	} else {
		if(Trigger.isInsert) {
			
		} else if(Trigger.isUpdate) {
			
		}
	}

}