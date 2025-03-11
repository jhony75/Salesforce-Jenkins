@isTest
private class ContactRepositoryTest {


@IsTest
    static void findContactByIdTest() {
        Account account = new Account(Name = 'Test Account');
        insert account;
        
        Contact contato = new Contact(LastName = 'Test Contact', AccountId = account.Id);
        insert contato;

        Contact con = [SELECT Id FROM Contact LIMIT 1];
        ContactRepository repository = new ContactRepository();
        
        Contact foundContact = repository.findContactById(con.Id);
        
        System.assertEquals(con.Id, foundContact.Id, 'Found contact should have the same Id as the contact in the database');
    }

}