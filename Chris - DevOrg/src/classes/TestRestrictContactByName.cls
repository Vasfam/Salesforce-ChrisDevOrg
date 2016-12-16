@isTest

private class TestRestrictContactByName {
    @isTest static void testInvalidContact(){
        //Setup test data
        
        Account acct = new Account(Name='Testaccount');
        insert acct;
        
        Contact cont = new Contact();
        cont.AccountId = acct.Id;
        cont.LastName = 'INVALIDNAME';
        
        insert cont;
        
        //Run tests
        Test.startTest();
        Database.SaveResult result = Database.insert(cont, false);
        Test.stopTest();
        
    }

}