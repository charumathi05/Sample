/**
* @name: AccountDescriptionUpdate 
* @description: Whenever a Account is inserted then it will update the description with name of the account
*/
public class AccountDescriptionUpdate {

    public static void updateDescription(List<Account> accounts) {
        for (Account a : accounts) {
            a.Description = a.Name;
        }
    }
}