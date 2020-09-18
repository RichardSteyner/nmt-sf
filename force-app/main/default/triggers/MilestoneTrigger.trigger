trigger MilestoneTrigger on amc__Milestone__c (before insert, before update, after insert, after update,after delete) {
    if(trigger.isBefore){

    }else {
        if(trigger.isInsert || trigger.isUpdate){
            List<Id>  newMilestoneIds = new List<Id>();
            Map<Id, Id> oldRoleIds = new Map<Id, Id>();
            Map<Id, Id> oldProjectIds = new Map<Id, Id>();
            Map<Id, NMT_Milestone__c> mapNMTMilestones = new Map<Id, NMT_Milestone__c>();
            List<amc__Milestone__c> allAmcMilestones;
            Map<Id, Id>  lookupRelator = new Map<Id, Id>();
            NMT_Milestone__c newNMTMilestone;

            for(amc__Milestone__c newMilestone : trigger.new){  newMilestoneIds.add(newMilestone.Id); }
            allAmcMilestones = NmtMilestoneFiller.getMilestonesByIds(newMilestoneIds);
            for(amc__Milestone__c oneAMCMilestone : allAmcMilestones){
                newNMTMilestone = NmtMilestoneFiller.fillNmtMilestone(oneAMCMilestone);
                newNMTMilestone.Milestone__c=oneAMCMilestone.Id;
                newNMTMilestone.Milestone_Upsert_Id__c = oneAMCMilestone.Id;
                mapNMTMilestones.put(oneAMCMilestone.Id,newNMTMilestone);

                if(oneAMCMilestone.amc__Milestone_Owner__c != null){
                    if(oldRoleIds.get(oneAMCMilestone.amc__Milestone_Owner__c) == null){
                        oldRoleIds.put(oneAMCMilestone.amc__Milestone_Owner__c,oneAMCMilestone.amc__Milestone_Owner__c);
                    }
                }

                if(oneAMCMilestone.amc__Project__c != null){         
                    if(oldProjectIds.get(oneAMCMilestone.amc__Project__c) == null){
                        oldProjectIds.put(oneAMCMilestone.amc__Project__c,oneAMCMilestone.amc__Project__c);
                    }
                }
            }

            lookupRelator = NmtProjectRoleFiller.getLookupRelator(oldRoleIds.values(),lookupRelator); 
            lookupRelator = NmtProjectFiller.getLookupRelator(oldProjectIds.values(),lookupRelator);

            for(amc__Milestone__c oneAMCMilestone : allAmcMilestones){
                newNMTMilestone = mapNMTMilestones.get(oneAMCMilestone.Id);
                if(oneAMCMilestone.amc__Milestone_Owner__c!=null)  {     
                    if(lookupRelator.get(oneAMCMilestone.amc__Milestone_Owner__c)!=null){
                        newNMTMilestone.Milestone_Owner__c = lookupRelator.get(oneAMCMilestone.amc__Milestone_Owner__c);
                    }

                }
                if(oneAMCMilestone.amc__Project__c!=null)  {   
                    if(lookupRelator.get(oneAMCMilestone.amc__Project__c)!=null){
                        newNMTMilestone.NMT_Project__c =  lookupRelator.get(oneAMCMilestone.amc__Project__c);
                    }
                }

                mapNMTMilestones.put(oneAMCMilestone.Id,newNMTMilestone);
            }

            if(trigger.isInsert){
                insert mapNMTMilestones.values();
            }else{
                if(trigger.isUpdate){         
                    try { upsert mapNMTMilestones.values() Milestone_Upsert_Id__c;  }
                    catch (DmlException e) {    System.debug(e.getMessage());  }
                }
            }
            
        }else{
            if(trigger.isDelete){            

            }
        }
    }

}