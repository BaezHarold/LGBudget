@isTest
public class TestTransactionTriggers {
    
    @testSetup
    static void setup() {
        TestData.createTestBudgets(6);
    }
    
    @isTest
    static void testupdateAmountInAccount() {
        
        //AccountAvailableAmount.updateAmountInAccount();
    }

}