@isTest
private class ContactRepositoryTest {


@IsTest
    static void findContactByIdTest() {
        Contact contact = [SELECT Id FROM Contact LIMIT 1];
        ContactRepository repository = new ContactRepository();
        Contact foundContact = repository.findContactById(contact.Id);
        System.assertEquals(contact.Id, foundContact.Id, 'Found contact should have the same Id as the contact in the database');
    }

}