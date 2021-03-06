@isTest
public class OpportunityTrigger_Test {
    
    public static testmethod void test01(){
        Pricebook2 pb = new Pricebook2(Name='Standard Price Book');
        insert pb;
        Product2 pro = new Product2(Name='Test Product', isActive=true, Family = 'Test');
        insert pro;
        PricebookEntry pe = new PricebookEntry(Product2Id=pro.Id, Pricebook2Id=Test.getStandardPricebookId(),UnitPrice=100,isActive=true);
        insert pe;
        PricebookEntry pe2 = new PricebookEntry(Product2Id=pro.Id, Pricebook2Id=pb.Id,UnitPrice=100,isActive=true);
        insert pe2;
        Account acc = new Account(Name='Test Account');
        insert acc;
        
        Test.startTest();
        Opportunity opp = new Opportunity(Name='Test opp',CloseDate=system.today(),StageName='Negotiation',AccountId=acc.Id, Close_on_Resale_Final_Estimate__c=System.today());
        insert opp;
        Test.stopTest();
    }
    
}