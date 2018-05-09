public class asss {
     public Account getAccount() {

        return [SELECT Id, Name FROM Account
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
     }
}