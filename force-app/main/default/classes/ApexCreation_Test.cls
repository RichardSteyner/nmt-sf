@IsTest
public class ApexCreation_Test {
    
    public static testmethod void testCreationWithoutContacts(){
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
        Opportunity opp = new Opportunity(Name='Test opp', CloseDate=system.today(), StageName='Closed Won', AccountId=acc.Id, Close_on_Resale_Final_Estimate__c=System.today());
        insert opp;
        ApexCreation.createProjectAndMilestonesLightning(opp.Id);
        Test.stopTest();
    }
    
    public static testmethod void testCreationWithContactContractor(){
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
        
        Opportunity opp = new Opportunity(Name='Test opp', CloseDate=system.today(), StageName='Negotiation', AccountId=acc.Id, Close_on_Resale_Final_Estimate__c=System.today());
        insert opp;
        
        Account accGC = new Account(Name='Richard Urupeque');
        insert accGC;
        
        Contact conGC = new Contact(FirstName='Richard', LastName='Urupeque', AccountId=accGC.Id);
        insert conGC;
        
        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId=opp.Id, ContactId=conGC.Id, Role='General Contractor');
        insert ocr;
        
        Test.startTest();
        opp.StageName = 'Closed Won';
        ApexUtil.OpportunityTrigger1=true;
        update opp;
        ApexCreation.createProjectAndMilestonesLightning(opp.Id);
        Test.stopTest();
    }
    
    public static testmethod void testCreationWithContactPM(){
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
        
        Opportunity opp = new Opportunity(Name='Test opp', CloseDate=system.today(), StageName='Negotiation', AccountId=acc.Id, Close_on_Resale_Final_Estimate__c=System.today());
        insert opp;
        
        Account accPM = new Account(Name='Richard Urupeque');
        insert accPM;
        
        Contact conPM = new Contact(FirstName='Richard', LastName='Urupeque', AccountId=accPM.Id);
        insert conPM;
        
        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId=opp.Id, ContactId=conPM.Id, Role='Project Manager');
        insert ocr;
        
        opp.StageName = 'Closed Won';
        ApexUtil.OpportunityTrigger1=true;
        update opp;
        ApexCreation.createProjectAndMilestonesLightning(opp.Id);
        
        /*Test.startTest();
        Opportunity oppTest = [SELECT Id, StageName FROM Opportunity WHERE Id =: opp.Id];
        oppTest.StageName = 'Closed Won';
        update oppTest;
        Test.stopTest();*/
    }

}