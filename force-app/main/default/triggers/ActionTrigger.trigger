trigger ActionTrigger on amc__Action__c (before insert, before update, after insert, after update,after delete) {
    if(trigger.isBefore){
    }else{
        if(trigger.isInsert || trigger.isUpdate){
            List<Id>  newActionIds = new List<Id>();
            Map<Id, NMT_Action__c> mapNMTAtions = new Map<Id, NMT_Action__c>();
            Map<Id, Id> oldAtionsIds = new Map<Id, Id>();
            Map<Id, Id> oldRoleIds = new Map<Id, Id>();
            Map<Id, Id> oldMilestoneIds = new Map<Id, Id>();
            List<amc__Action__c> allAmcActions;
            Map<Id, Id>  lookupRelator = new Map<Id, Id>();
            NMT_Action__c newNMTAction;

            for(amc__Action__c newAction : trigger.new){ newActionIds.add(newAction.Id); }
            allAmcActions = NmtActionFiller.getActionsByIds(newActionIds);
            for(amc__Action__c oneAMCAction : allAmcActions){
                newNMTAction = NmtActionFiller.fillNmtAction(oneAMCAction);                
                newNMTAction.Action__c=oneAMCAction.Id;
                newNMTAction.Action_Upsert_Id__c = oneAMCAction.Id;
                mapNMTAtions.put(oneAMCAction.Id,newNMTAction);
                if(oneAMCAction.amc__Action_Owner__c!=null)  {
                    if(oldRoleIds.get(oneAMCAction.amc__Action_Owner__c) == null){
                        oldRoleIds.put(oneAMCAction.amc__Action_Owner__c,oneAMCAction.amc__Action_Owner__c);
                    }
                }
                if(oneAMCAction.amc__Dependant_Action__c!=null)  {
                    if(oldAtionsIds.get(oneAMCAction.amc__Dependant_Action__c) == null){
                        oldAtionsIds.put(oneAMCAction.amc__Dependant_Action__c,oneAMCAction.amc__Dependant_Action__c);
                    }
                }
                if(oneAMCAction.amc__Milestone__c!=null)  {
                    if(oldMilestoneIds.get(oneAMCAction.amc__Milestone__c) == null){
                        oldMilestoneIds.put(oneAMCAction.amc__Milestone__c,oneAMCAction.amc__Milestone__c);
                    }
                }

            }
            
            lookupRelator = NmtProjectRoleFiller.getLookupRelator(oldRoleIds.values(),lookupRelator);
            lookupRelator = NmtActionFiller.getLookupRelator(oldAtionsIds.values(),lookupRelator);
            lookupRelator = NmtMilestoneFiller.getLookupRelator(oldMilestoneIds.values(),lookupRelator);
          
            for(amc__Action__c oneAMCAction : allAmcActions){
                 newNMTAction =  mapNMTAtions.get(oneAMCAction.Id);
                 if(oneAMCAction.amc__Action_Owner__c!=null)  {
                    if(lookupRelator.get(oneAMCAction.amc__Action_Owner__c)!=null){
                        newNMTAction.Action_Owner__c = lookupRelator.get(oneAMCAction.amc__Action_Owner__c);
                    }
                 }
                 if(oneAMCAction.amc__Dependant_Action__c!=null)  {
                    if(lookupRelator.get(oneAMCAction.amc__Dependant_Action__c)!=null){
                        newNMTAction.Dependant_Action__c = lookupRelator.get(oneAMCAction.amc__Dependant_Action__c);
                    }
                 }

                 if(oneAMCAction.amc__Milestone__c!=null)  {
                    if(lookupRelator.get(oneAMCAction.amc__Milestone__c)!=null){
                        newNMTAction.NMT_Milestone__c = lookupRelator.get(oneAMCAction.amc__Milestone__c);
                    }
                 }

                 mapNMTAtions.put(oneAMCAction.Id,newNMTAction);
            }

            if(trigger.isInsert){
                insert mapNMTAtions.values();
            }else{
                if(trigger.isUpdate){
                    try { upsert mapNMTAtions.values() Action_Upsert_Id__c;  }
                    catch (DmlException e) {    System.debug(e.getMessage()); }
                }
            }

        }else{
            if(trigger.isDelete){            }
        }
    }
}