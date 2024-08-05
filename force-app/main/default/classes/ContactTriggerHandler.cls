/**
* @name: ContactTriggerHandler
* @description: This class will update the Total_Contacts_Count__c field on the Account with this count.
*/
public class ContactTriggerHandler {

    /**
* @name: updateAccountTotalContactsCount
* @description: This method will update the Total_Contacts_Count__c field on the Account with the current count of associated contacts.
* @param newContacts: List of new Contacts.
* @return: void 
*/
    public static void updateAccountTotalContactsCount(List<Contact> newContacts) {
        Set<Id> accountIdsToUpdate = new Set<Id>();
        
        for (Contact contact : newContacts) {
            if (contact.AccountId != null) {
                accountIdsToUpdate.add(contact.AccountId);
            }
        }
        if(!accountIdsToUpdate.isEmpty()){
            updateTotalContactsCountOnAccount(accountIdsToUpdate);
        }
    }
    
    /**
* @name: updateTotalContactsCountOnAccount 
* @description: This method will update the Total_Contacts_Count__c field on the Account with the current count of associated contacts.
* @param accountIdsToUpdate: Set of Account IDs to update.
* @return: void 
*/
    @future
    public static void updateTotalContactsCountOnAccount(Set<Id> accountIdsToUpdate) {
        List<Account> accountsToUpdate = [SELECT Id, Total_Contacts_Count__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIdsToUpdate];
        for (Account acc : accountsToUpdate) {
            acc.Total_Contacts_Count__c = acc.Contacts.size();
        }
        Database.update(accountsToUpdate, false);
    }
}