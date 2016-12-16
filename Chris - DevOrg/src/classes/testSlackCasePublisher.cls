@isTest
public class testSlackCasePublisher {
    @isTest static void testSlackCase() {
        Case testcase = new Case(Subject = 'testcase subject Ent Del');
        insert testcase;
        
        testcase = [Select Subject From Case where Subject = :testcase.Subject];
        system.assertEquals('testcase subject Ent Del', testcase.Subject);
    }
}