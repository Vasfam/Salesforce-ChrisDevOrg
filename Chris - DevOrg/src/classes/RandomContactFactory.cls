public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts,string conLastName){
        List<Contact> contactlist = new List<Contact>();
        
        for(Integer i=0;i<numContacts;i++) {
            Contact c = new Contact(FirstName='Test '+i,LastName=conLastName);
            contactlist.add(c);
        }
    
    return contactlist;
    }
}