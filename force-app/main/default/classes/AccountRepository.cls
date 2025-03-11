public with sharing class AccountRepository extends AbstractRepository{
    public Account findAccountById(Id accountId) {
        return [SELECT Id, Name FROM Account WHERE Id = :accountId WITH SECURITY_ENFORCED];
    }
}