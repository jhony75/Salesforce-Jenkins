public with sharing class ContactRepository extends AbstractRepository{
    public Contact findContactById(Id contactId) {
        return [SELECT Id, Name FROM Contact WHERE Id = :contactId WITH SECURITY_ENFORCED];
    }
}