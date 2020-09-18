trigger RoleTrigger on amc__Role__c (before insert, before update, after insert, after update,after delete) {
    if(trigger.isBefore){

    }else {
        if(trigger.isInsert || trigger.isUpdate){
            List<Id>  newRoleIds = new List<Id>();
            Map<Id, NMT_Project_Role__c> mapNMTRoles = new Map<Id, NMT_Project_Role__c>();
            Map<Id, Id> oldRoleIds = new Map<Id, Id>();
            List<amc__Role__c> allAmcRoles;
            Map<Id, Id>  lookupRelator = new Map<Id, Id>();
            NMT_Project_Role__c newNMTRole; 

            for(amc__Role__c newRole : trigger.new){ newRoleIds.add(newRole.Id); }
            allAmcRoles = NmtProjectRoleFiller.getRolesByIds(newRoleIds);
            for(amc__Role__c oneAMCRole : allAmcRoles){
                newNMTRole = NmtProjectRoleFiller.fillNmtProjectRole(oneAMCRole);                
                newNMTRole.Role__c=oneAMCRole.Id;
                newNMTRole.Role_Upsert_Id__c = oneAMCRole.Id;
                mapNMTRoles.put(oneAMCRole.Id,newNMTRole);
                if(oneAMCRole.amc__Expense_Approver__c!=null)  { 
                    if(oldRoleIds.get(oneAMCRole.amc__Expense_Approver__c) == null){
                        oldRoleIds.put(oneAMCRole.amc__Expense_Approver__c,oneAMCRole.amc__Expense_Approver__c);
                    }
                }
                if(oneAMCRole.amc__Timesheet_Approver__c!=null){
                    if(oldRoleIds.get(oneAMCRole.amc__Timesheet_Approver__c) == null){
                        oldRoleIds.put(oneAMCRole.amc__Timesheet_Approver__c,oneAMCRole.amc__Timesheet_Approver__c);
                    } 
                }
            }
            
            lookupRelator = NmtProjectRoleFiller.getLookupRelator(oldRoleIds.values(),lookupRelator);
            
            for(amc__Role__c oneAMCRole : allAmcRoles){
                newNMTRole =  mapNMTRoles.get(oneAMCRole.Id);
                if(oneAMCRole.amc__Expense_Approver__c!=null)  { 
                    if(lookupRelator.get(oneAMCRole.amc__Expense_Approver__c)!=null){
                        newNMTRole.Expense_Approver__c = lookupRelator.get(oneAMCRole.amc__Expense_Approver__c);
                    }
                }
                if(oneAMCRole.amc__Timesheet_Approver__c!=null){
                   if(lookupRelator.get(oneAMCRole.amc__Timesheet_Approver__c)!=null){
                        newNMTRole.Timesheet_Approver__c = lookupRelator.get(oneAMCRole.amc__Timesheet_Approver__c);
                   }  
                }
                mapNMTRoles.put(oneAMCRole.Id,newNMTRole);
            }

            if(trigger.isInsert){
                insert mapNMTRoles.values();
            }else{
                if(trigger.isUpdate){         
                    try { upsert mapNMTRoles.values() Role_Upsert_Id__c;  }
                    catch (DmlException e) {    System.debug(e.getMessage()); }
                }
            }
        }else{
            if(trigger.isDelete){

            }
        }
    }
}