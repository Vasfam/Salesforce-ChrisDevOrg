@isTest
public class TestVerifyDate {
    @isTest static void testPriorDate(){
        Date date1,date2,expecteddate;
        date1 = Date.newInstance(2016, 1, 1);
        date2 = Date.newInstance(2016, 3, 1);
        expecteddate = Date.newInstance(2016, 1, 31);
        Date returneddate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(expecteddate, returneddate);
           
    }
    
    @isTest static void testValidDate(){
        Date date1,date2,expecteddate;
        date1 = Date.newInstance(2016, 1, 1);
        date2 = Date.newInstance(2016, 1, 15);
        expecteddate = Date.newInstance(2016, 1, 15);
        Date returneddate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(expecteddate, returneddate);
           
    }
    

}