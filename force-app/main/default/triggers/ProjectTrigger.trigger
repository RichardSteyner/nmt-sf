trigger ProjectTrigger on amc__Project__c (before insert, before update, after insert, after update,after delete) {
    if(trigger.isBefore){

    }else {
        if(trigger.isInsert || trigger.isUpdate){
            List<Id>  newProjectIds = new List<Id>();
            Map<Id, Id> oldRoleIds = new Map<Id, Id>();
            Map<Id, NMT_Project__c> mapNMTProject = new Map<Id, NMT_Project__c>();
            List<amc__Project__c> allAmcProjects;
            Map<Id, Id>  lookupRelator = new Map<Id, Id>();
            NMT_Project__c newNMTProject;

            for(amc__Project__c newProject : trigger.new){ newProjectIds.add(newProject.Id); }
            allAmcProjects = NmtProjectFiller.getProjectsByIds(newProjectIds);
            for(amc__Project__c oneAMCProject : allAmcProjects){
                newNMTProject = NmtProjectFiller.fillNmtProject(oneAMCProject);                
                newNMTProject.Project__c=oneAMCProject.Id;
                newNMTProject.Project_Upsert_Id__c = oneAMCProject.Id;
                mapNMTProject.put(oneAMCProject.Id,newNMTProject);
                if(oneAMCProject.amc__Project_Owner__c != null){
                    if(oldRoleIds.get(oneAMCProject.amc__Project_Owner__c) == null){
                        oldRoleIds.put(oneAMCProject.amc__Project_Owner__c,oneAMCProject.amc__Project_Owner__c);
                    }
                }
            }

            lookupRelator = NmtProjectRoleFiller.getLookupRelator(oldRoleIds.values(),lookupRelator); 
            
            for(amc__Project__c oneAMCProject : allAmcProjects){
                newNMTProject =  mapNMTProject.get(oneAMCProject.Id);
                if(oneAMCProject.amc__Project_Owner__c!=null)  {
                    if(lookupRelator.get(oneAMCProject.amc__Project_Owner__c)!=null){
                        newNMTProject.Project_Owner__c = lookupRelator.get(oneAMCProject.amc__Project_Owner__c);
                    }
                }
                mapNMTProject.put(oneAMCProject.Id,newNMTProject);
            }            
            
            if(trigger.isInsert){
                insert mapNMTProject.values();
            }else{
                if(trigger.isUpdate){         
                    try { upsert mapNMTProject.values() Project_Upsert_Id__c;  }
                    catch (DmlException e) {    System.debug(e.getMessage());  }
                }
            }
            
        }else{
            if(trigger.isDelete){

            }
        }
    }
}