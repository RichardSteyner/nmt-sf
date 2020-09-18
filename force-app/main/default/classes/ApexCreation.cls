public class ApexCreation {
    
    private static Map<String, String> milestonesDefined = new Map<String, String>{'1'=>'Permit Pulled', '2'=>'Demo', '3'=>'Rough Framing', '4'=>'Rough Plumbing', '5'=>'Rough Electrical', 
        '6'=>'Rough Inspections', '7'=>'Drywall', '8'=>'Wall Texture', '9'=>'Kitchen Cabinets', '10'=>'Kitchen Countertops', '11'=>'Kitchen Tiling', '12'=>'Bathroom Tiling', 
		'13'=>'Bathroom Vanities', '14'=>'Laminate/Wood Flooring', '15'=>'Carpeting', '16'=>'Windows', '17'=>'Interior Doors', '18'=>'Exterior Doors',
		'19'=>'Baseboards & Trims', '20'=>'Landscaping', '21'=>'Fence Installation', '22'=>'Fence Staining', '23'=>'Roof', '24'=>'Gutters',
		'25'=>'HVAC', '26'=>'Sewer Lateral Replacement', '27'=>'Sidewalk Repair', '28'=>'Garage Door', '29'=>'Built-ins', '30'=>'Stucco',
		'31'=>'Siding', '32'=>'Interior Paint', '33'=>'Exterior Paint', '34'=>'Light Fixtures', '35'=>'Plumbing Fixtures', '36'=>'Appliances',
		'37'=>'Inspection Report Repairs', '38'=>'PM Final Walkthrough', '39'=>'Final Touch-ups', '40'=>'Cleaning', '41'=>'Staging', 
        '42'=>'Resell', '43'=>'Resell Inspection', '44'=>'Photography', '45'=>'Permit Final'};
    
    //@future(callout=true)
    /*public static void createProjectAndMilestones(Set<Id> ids){
        System.debug('ApexCreation -> createProjectAndMilestones');
        List<Opportunity> opportunities = [select Id, Name, Final_Total_Hard_Costs__c, AccountId, Property_City__c,
                                           (Select ContactId, Role, Contact.AccountId, Contact.Name From OpportunityContactRoles where Role = 'Project Manager' or Role = 'General Contractor')
                        from Opportunity 
                        where Id in: ids];
        if(opportunities==null || opportunities.size()==0) {
            System.debug('Opportunities not exists!');
            return;
        }
        
        Map<String, amc__Project__c> projects = new Map<String, amc__Project__c>();
        Map<String, amc__Milestone__c> milestones = new Map<String, amc__Milestone__c>();
        amc__Project__c objProject;
        Map<String, amc__Role__c> roles = new Map<String, amc__Role__c>();
        
        try{
            Boolean sw = false;
            String pmId, gcId;
            Integer auxKey;
            for(Opportunity opp : opportunities){
            	System.debug(opp.Name + ' - ' + opp.Final_Total_Hard_Costs__c + ' - ' + opp.AccountId  + ' - ' + opp.Property_City__c);
                objProject = new amc__Project__c(Name = opp.Name, amc__Status__c='Planned', amc__Opportunity__c=opp.Id, amc__Cost_Budget__c=opp.Final_Total_Hard_Costs__c,
                                                amc__Billing_Type__c='Fixed Price', amc__Account__c=opp.AccountId, Apex_Id__c=opp.Id);
                for(OpportunityContactRole ocr : opp.OpportunityContactRoles){
                    pmId = null;
                    gcId = null;
                	if(ocr.Role.equalsIgnoreCase('Project Manager')){
                        sw = true;
                        System.debug('Project Manager: ' + ocr.Contact.Name);
                        objProject.Role_Apex_Id__c = ocr.ContactId + '-' + 'Project Manager';
                        //objProject.amc__Project_Owner__c = ocr.ContactId;
                        pmId = ocr.ContactId + '-' + 'Project Manager';
                        roles.put(ocr.ContactId + '-' + 'Project Manager', new amc__Role__c(Name=ocr.Contact.Name, amc__Contact__c=ocr.ContactId, amc__Job_Title__c='Project Manager', amc__Active__c=true));
                    }
                    if(ocr.Role.equalsIgnoreCase('General Contractor')){
                        sw = true;
                        System.debug('General Contractor: ' + ocr.Contact.Name);
                        objProject.amc__Contact__c = ocr.ContactId;
                        objProject.General_Contractor__c = ocr.Contact.AccountId;
                        gcId = ocr.ContactId + '-' + 'Project Manager';
                        //roles.put(ocr.ContactId + '-' + 'Project Manager', new amc__Role__c(Name=ocr.Contact.Name, amc__Contact__c=ocr.ContactId, amc__Job_Title__c='Project Manager', amc__Active__c=true));
                    }
            	}
                projects.put(opp.Id, objProject);
                for(String key : milestonesDefined.keySet()){
                    auxKey = Integer.valueOf(key);
                	System.debug(milestonesDefined.get(key));
                    if(key.equals('26')){
                        if(opp.Property_City__c!=null && (opp.Property_City__c.equalsIgnoreCase('Alameda') || opp.Property_City__c.equalsIgnoreCase('Albany')
                                                          || opp.Property_City__c.equalsIgnoreCase('Emeryville') || opp.Property_City__c.equalsIgnoreCase('Oakland')
                                                          || opp.Property_City__c.equalsIgnoreCase('Piedmont') || opp.Property_City__c.equalsIgnoreCase('Kensington')
                                                          || opp.Property_City__c.equalsIgnoreCase('El Cerrito') || opp.Property_City__c.equalsIgnoreCase('Richmond')))
                            milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=pmId));
                    }else if(key.equals('27')){
                        if(opp.Property_City__c!=null && opp.Property_City__c.equalsIgnoreCase('Oakland'))
                            milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=pmId));
                    }else if(key.equals('29') || key.equals('39') || key.equals('43') || (auxKey>=1 && auxKey<=19) || (auxKey>=31 && auxKey<=37)){
                    	milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=gcId));
                    }else{
                        milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=pmId));
                    }
            	}
            }
            
            Set<Id> contactIds = new Set<Id>();
            Set<String> jobTitles = new Set<String>();
            for(amc__Role__c r : roles.values()){
                contactIds.add(r.amc__Contact__c);
				jobTitles.add(r.amc__Job_Title__c);                
            }
            
            for(amc__Role__c r : [select Id, amc__Contact__c from amc__Role__c where amc__Contact__c in: contactIds and amc__Job_Title__c in: jobTitles and amc__Active__c=true]){
            	if(r.amc__Job_Title__c.equalsIgnoreCase('Project Manager'))
                	roles.put(r.amc__Contact__c + '-' + 'Project Manager', r);
                else
                    roles.put(r.amc__Contact__c + '-' + 'General Contractor', r);
            }
            
            System.debug('roles: ' + roles);
            
            if(roles.values().size()>0) upsert roles.values();
            
            for(amc__Project__c p : projects.values()){
                if(p.Role_Apex_Id__c!=null && String.isNotBlank(p.Role_Apex_Id__c)){
                    if(roles.get(p.Role_Apex_Id__c)!=null && roles.get(p.Role_Apex_Id__c).Id!=null){
                        p.amc__Project_Owner__c = roles.get(p.Role_Apex_Id__c).Id;
                    }
                    else{
                        //projects.remove(p.Apex_Id__c);
                        System.debug('Need Remove Project?: ' + p.Apex_Id__c);
                    }
                }
            }
            
            for(amc__Project__c p : [select Id, Apex_Id__c from amc__Project__c where Apex_Id__c in: projects.keySet()]){
            	projects.get(p.Apex_Id__c).Id = p.Id;
            }
            
            if(projects.values().size()>0) upsert projects.values();
            
            for(amc__Milestone__c m : milestones.values()){
                if(projects.get(m.Project_Apex_Id__c)!=null && projects.get(m.Project_Apex_Id__c).Id!=null){
                    m.amc__Project__c = projects.get(m.Project_Apex_Id__c).Id;
                    if(m.Role_Apex_Id__c!=null && String.isNotBlank(m.Role_Apex_Id__c) && roles.get(m.Role_Apex_Id__c).Id!=null)
                        m.amc__Milestone_Owner__c = roles.get(m.Role_Apex_Id__c).Id;
                }
                else{
               		milestones.remove(m.Apex_Id__c);
                    System.debug('Remove Milestone: ' + m.Apex_Id__c);
                }
            }
            
            for(amc__Milestone__c m : [select Id, Apex_Id__c from amc__Milestone__c where Apex_Id__c in: milestones.keySet()]){
            	milestones.get(m.Apex_Id__c).Id = m.Id;
            }
            
            System.debug('M: ' + milestones.values().size());
            if(milestones.values().size()>0) upsert milestones.values();
        }catch(Exception e){
            System.debug(e.getLineNumber() + '->' + e.getMessage());
            //return 'Error: ' + e.getLineNumber() + '->' + e.getMessage();
        }
    }*/
    
    @AuraEnabled
    public static String createProjectAndMilestonesLightning(String id){
        Set<Id> ids = new Set<Id>();
        ids.add(id);
        System.debug('ApexCreation -> createProjectAndMilestones');
        List<Opportunity> opportunities = [select Id, Name, Final_Total_Hard_Costs__c, AccountId, Property_City__c,
                                           (Select ContactId, Role, Contact.AccountId, Contact.Name From OpportunityContactRoles where Role = 'Project Manager' or Role = 'General Contractor')
                        from Opportunity 
                        where Id in: ids];
        if(opportunities==null || opportunities.size()==0) {
            System.debug('Opportunities not exists!');
            return 'Error: Opportunities not exists!';
        }
        
        Map<String, amc__Project__c> projects = new Map<String, amc__Project__c>();
        Map<String, amc__Milestone__c> milestones = new Map<String, amc__Milestone__c>();
        amc__Project__c objProject;
        Map<String, amc__Role__c> roles = new Map<String, amc__Role__c>();
        Map<String, amc__Action__c> actions = new Map<String, amc__Action__c>();
        
        try{
            Boolean sw = false;
            String pmId, gcId;
            Integer auxKey;
            for(Opportunity opp : opportunities){
               	pmId = null;
                gcId = null;
            	System.debug(opp.Name + ' - ' + opp.Final_Total_Hard_Costs__c + ' - ' + opp.AccountId  + ' - ' + opp.Property_City__c);
                objProject = new amc__Project__c(Name = opp.Name, amc__Status__c='Planned', amc__Opportunity__c=opp.Id, amc__Cost_Budget__c=opp.Final_Total_Hard_Costs__c,
                                                amc__Billing_Type__c='Fixed Price', amc__Account__c=opp.AccountId, Apex_Id__c=opp.Id);
                for(OpportunityContactRole ocr : opp.OpportunityContactRoles){
                	if(ocr.Role.equalsIgnoreCase('Project Manager')){
                        sw = true;
                        System.debug('Project Manager: ' + ocr.Contact.Name);
                        objProject.Role_Apex_Id__c = ocr.ContactId + '-' + 'Project Manager';
                        //objProject.amc__Project_Owner__c = ocr.ContactId;
                        pmId = ocr.ContactId + '-' + 'Project Manager';
                        roles.put(ocr.ContactId + '-' + 'Project Manager', new amc__Role__c(Name=ocr.Contact.Name, amc__Contact__c=ocr.ContactId, amc__Job_Title__c='Project Manager', amc__Active__c=true));
                    }
                    if(ocr.Role.equalsIgnoreCase('General Contractor')){
                        sw = true;
                        System.debug('General Contractor: ' + ocr.Contact.Name);
                        objProject.amc__Contact__c = ocr.ContactId;
                        objProject.General_Contractor__c = ocr.Contact.AccountId;
                        gcId = ocr.ContactId + '-' + 'General Contractor';
                        roles.put(ocr.ContactId + '-' + 'General Contractor', new amc__Role__c(Name=ocr.Contact.Name, amc__Contact__c=ocr.ContactId, amc__Job_Title__c='General Contractor', amc__Active__c=true));
                    }
            	}
                projects.put(opp.Id, objProject);
                for(String key : milestonesDefined.keySet()){
                    auxKey = Integer.valueOf(key);
                	System.debug(milestonesDefined.get(key));
                    if(key.equals('26')){
                        if(opp.Property_City__c!=null && (opp.Property_City__c.equalsIgnoreCase('Alameda') || opp.Property_City__c.equalsIgnoreCase('Albany')
                                                          || opp.Property_City__c.equalsIgnoreCase('Emeryville') || opp.Property_City__c.equalsIgnoreCase('Oakland')
                                                          || opp.Property_City__c.equalsIgnoreCase('Piedmont') || opp.Property_City__c.equalsIgnoreCase('Kensington')
                                                          || opp.Property_City__c.equalsIgnoreCase('El Cerrito') || opp.Property_City__c.equalsIgnoreCase('Richmond')))
                            milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=pmId, Order__c=auxKey));
                    }else if(key.equals('27')){
                        if(opp.Property_City__c!=null && opp.Property_City__c.equalsIgnoreCase('Oakland'))
                            milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=pmId, Order__c=auxKey));
                    }else if(key.equals('29') || key.equals('39') || key.equals('45') || (auxKey>=1 && auxKey<=19) || (auxKey>=31 && auxKey<=37)){
                    	milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=gcId, Order__c=auxKey));
                    }else{
                        milestones.put(opp.Id + '-' + key, new amc__Milestone__c(Name=milestonesDefined.get(key), Project_Apex_Id__c=opp.Id, Apex_Id__c=opp.Id + '-' + key, Role_Apex_Id__c=pmId, Order__c=auxKey));
                        if(key.equals('41')){
                            actions.put(opp.Id + '-' + key + '-SETUP', new amc__Action__c(amc__Action_Name__c='Setup Staging', Milestone_Apex_Id__c=opp.Id + '-' + key, Apex_Id__c=opp.Id + '-' + key + '-SETUP',
                                                                                          amc__Status__c='Planned', Role_Apex_Id__c=pmId));
                            actions.put(opp.Id + '-' + key + '-REMOVE', new amc__Action__c(amc__Action_Name__c='Remove Staging', Milestone_Apex_Id__c=opp.Id + '-' + key, Apex_Id__c=opp.Id + '-' + key + '-REMOVE',
                                                                                           amc__Status__c='Planned', Role_Apex_Id__c=pmId));
                        }
                    }
            	}
            }
            
            Set<Id> contactIds = new Set<Id>();
            Set<String> jobTitles = new Set<String>();
            for(amc__Role__c r : roles.values()){
                contactIds.add(r.amc__Contact__c);
				jobTitles.add(r.amc__Job_Title__c);                
            }
            
            for(amc__Role__c r : [select Id, amc__Contact__c, amc__Job_Title__c from amc__Role__c where amc__Contact__c in: contactIds and amc__Job_Title__c in: jobTitles and amc__Active__c=true]){
            	if(r.amc__Job_Title__c.equalsIgnoreCase('Project Manager'))
                	roles.put(r.amc__Contact__c + '-' + 'Project Manager', r);
                else
                    roles.put(r.amc__Contact__c + '-' + 'General Contractor', r);
            }
            
            System.debug('roles: ' + roles);
            
            if(roles.values().size()>0) upsert roles.values();
            
            System.debug('roles: ' + roles);
            
            for(amc__Project__c p : projects.values()){
                if(p.Role_Apex_Id__c!=null && String.isNotBlank(p.Role_Apex_Id__c)){
                    if(roles.get(p.Role_Apex_Id__c)!=null && roles.get(p.Role_Apex_Id__c).Id!=null){
                        p.amc__Project_Owner__c = roles.get(p.Role_Apex_Id__c).Id;
                    }
                    else{
                        //projects.remove(p.Apex_Id__c);
                        System.debug('Need Remove Project?: ' + p.Apex_Id__c);
                    }
                }else{
                  	p.amc__Project_Owner__c=null;
                }
            }
            
            for(amc__Project__c p : [select Id, Apex_Id__c from amc__Project__c where Apex_Id__c in: projects.keySet()]){
            	projects.get(p.Apex_Id__c).Id = p.Id;
            }
            
            if(projects.values().size()>0) upsert projects.values();
            
            for(amc__Milestone__c m : milestones.values()){
                if(projects.get(m.Project_Apex_Id__c)!=null && projects.get(m.Project_Apex_Id__c).Id!=null){
                    m.amc__Project__c = projects.get(m.Project_Apex_Id__c).Id;
                    if(m.Role_Apex_Id__c!=null && String.isNotBlank(m.Role_Apex_Id__c) && roles.get(m.Role_Apex_Id__c).Id!=null){
                        m.amc__Milestone_Owner__c = roles.get(m.Role_Apex_Id__c).Id;
                    }else{
                        m.amc__Milestone_Owner__c=null;
                        System.debug('No entró: '+ m.Role_Apex_Id__c);
                    }
                }
                else{
               		milestones.remove(m.Apex_Id__c);
                    System.debug('Remove Milestone: ' + m.Apex_Id__c);
                }
            }
            
            for(amc__Milestone__c m : [select Id, Apex_Id__c from amc__Milestone__c where Apex_Id__c in: milestones.keySet()]){
            	milestones.get(m.Apex_Id__c).Id = m.Id;
            }
            
            System.debug('M: ' + milestones.values().size());
            if(milestones.values().size()>0) upsert milestones.values();
            
            
            for(amc__Action__c a : actions.values()){
                if(milestones.get(a.Milestone_Apex_Id__c)!=null && milestones.get(a.Milestone_Apex_Id__c).Id!=null){
                    a.amc__Milestone__c = milestones.get(a.Milestone_Apex_Id__c).Id;
                    if(a.Role_Apex_Id__c!=null && String.isNotBlank(a.Role_Apex_Id__c) && roles.get(a.Role_Apex_Id__c).Id!=null){
                        a.amc__Action_Owner__c = roles.get(a.Role_Apex_Id__c).Id;
                    }else{
                        a.amc__Action_Owner__c=null;
                        System.debug('No entró a setear el owner a action: '+ a.Role_Apex_Id__c);
                    }
                }
                else{
               		actions.remove(a.Apex_Id__c);
                    System.debug('Remove Action: ' + a.Apex_Id__c);
                }
            }
            
            for(amc__Action__c a : [select Id, Apex_Id__c from amc__Action__c where Apex_Id__c in: actions.keySet()]){
            	actions.get(a.Apex_Id__c).Id = a.Id;
            }
            
            System.debug('A: ' + actions.values().size());
            if(actions.values().size()>0) upsert actions.values();
            
            return opportunities[0].Id;
        }catch(Exception e){
            System.debug(e.getLineNumber() + '->' + e.getMessage());
            return 'Error: ' + e.getLineNumber() + '->' + e.getMessage();
        }
    }

}