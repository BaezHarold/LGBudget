@isTest
public class TestTransactionTriggers {
    
    @testSetup
    static void setup() {
        TestData.createTestBudgets(6);
    }
    
    @isTest
    static void testupdateAmountInAccount() {
        
        // Put this in a loop
        Boolean checkbox = FALSE;
        for(Integer i = 0; i < 10; i++) {
            Double ranNumber = Math.random() * 10; // generate a number between 0.0 and 1.0
            if(ranNumber < 5) {
                checkbox = FALSE;
            } else checkbox = True;
        }
        
        List<Budget__c> budgetList = [SELECT Name, Id, TotalBudget__c FROM Budget__c];
        
        List<Transaction__c> tran1 = new List<Transaction__c>();
       /* tList.add(new Transaction__c(Name='Food', DateOfTransaction__c=System.today(), TypeOfTransaction__c='Food & Dining', 
                                     Amount__c=(Decimal)(Math.random()*15*900), Income__c=checkbox, Budget__c=))
        
        AccountAvailableAmount.updateAmountInAccount(tran1);
        */
       
    }

}