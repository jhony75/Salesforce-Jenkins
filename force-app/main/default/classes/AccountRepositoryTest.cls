@isTest
private class AccountRepositoryTest {


@IsTest
    static void findAccountByIdTest() {
        Account account = new Account(Name = 'Test Account');
        insert account;

        Test.startTest();
        AccountRepository accountRepository = new AccountRepository();
        Account retrievedAccount = accountRepository.findAccountById(account.Id);
        Test.stopTest();

        System.assertEquals(account.Id, retrievedAccount.Id);
        System.assertEquals(account.Name, retrievedAccount.Name);
    }


@IsTest
    static void saveAccountTest() {
        Account account = new Account(Name = 'Test Account');
        AccountRepository accountRepository = new AccountRepository();
        accountRepository.save(account);

        Test.startTest();
        Account retrievedAccount = accountRepository.findAccountById(account.Id);
        Test.stopTest();

        System.assertEquals(account.Id, retrievedAccount.Id);
        System.assertEquals(account.Name, retrievedAccount.Name);
    }


@IsTest
    static void saveAccountListTest() {
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Test Account 1'));
        accounts.add(new Account(Name = 'Test Account 2'));

        Test.startTest();
        AccountRepository accountRepository = new AccountRepository();
        accountRepository.save(accounts);
        Test.stopTest();

        List<Account> retrievedAccounts = [SELECT Id, Name FROM Account];
        System.assertEquals(2, retrievedAccounts.size());
        System.assertEquals('Test Account 1', retrievedAccounts[0].Name);
        System.assertEquals('Test Account 2', retrievedAccounts[1].Name);
    }


@IsTest
    static void removeAccountTest() {
        Account account = new Account(Name = 'Test Account');
        insert account;

        Test.startTest();
        AccountRepository accountRepository = new AccountRepository();
        accountRepository.remove(account);
        Test.stopTest();

        List<Account> accounts = [SELECT Id, Name FROM Account];
        System.assertEquals(0, accounts.size());
    }


@IsTest
    static void removeAccountListTest() {
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Test Account 1'));
        accounts.add(new Account(Name = 'Test Account 2'));
        insert accounts;

        Test.startTest();
        AccountRepository accountRepository = new AccountRepository();
        accountRepository.remove(accounts);
        Test.stopTest();

        List<Account> retrievedAccounts = [SELECT Id, Name FROM Account];
        System.assertEquals(0, retrievedAccounts.size());
    }

}