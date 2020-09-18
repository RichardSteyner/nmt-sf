public class NmtProjectRoleFiller {

    public static NMT_Project_Role__c fillNmtProjectRole(amc__Role__c AMCRole){
        NMT_Project_Role__c NMTRole = new NMT_Project_Role__c();
        NMTRole.Action_Notification_Due__c=AMCRole.amc__Action_Notification_Due__c;
        NMTRole.Active__c=AMCRole.amc__Active__c;
        NMTRole.Billable_Hourly_Rate__c=AMCRole.amc__Hourly_Rate__c;
        NMTRole.Billable_Target__c=AMCRole.amc__Billable_Target__c;
        NMTRole.Console_Default_Tab__c=AMCRole.amc__Console_Default_Tab__c;
        NMTRole.Contact__c=AMCRole.amc__Contact__c;
        NMTRole.Cost_Hourly_Rate__c=AMCRole.amc__Cost_Hourly_Rate__c;
        NMTRole.Email__c=AMCRole.amc__Email__c;
        NMTRole.Exclude_from_Scheduler__c=AMCRole.Exclude_from_Scheduler_Formula__c;
        /*NMTRole.Expense_Approver__c=AMCRole.amc__Expense_Approver__c;*/
        NMTRole.Expense_Approver__c=null;
        NMTRole.Hours_Per_Week__c=AMCRole.amc__Hours_Per_Week__c;
        NMTRole.Job_Title__c=AMCRole.amc__Job_Title__c;
        NMTRole.Manage_Subordinate_Timesheets__c=AMCRole.amc__Manage_Subordinate_Timesheets__c;
        NMTRole.Manage_Timesheets__c=AMCRole.amc__Manage_Timesheets__c;
        NMTRole.Master_Team__c=AMCRole.amc__Master_Team__c;
        NMTRole.Mileage_Rate__c=AMCRole.amc__Mileage_Rate__c;
        NMTRole.Milestone_Notification_Due__c=AMCRole.amc__Milestone_Notification_Due__c;
        NMTRole.OwnerId=AMCRole.OwnerId;
        NMTRole.Project_Overview_Default_Tab__c=AMCRole.amc__Project_Overview_Default_Tab__c;
        NMTRole.Receive_Action_Notifications__c=AMCRole.amc__Receive_Action_Notifications__c;
        NMTRole.Receive_Digest__c=AMCRole.amc__Receive_Digest__c;
        NMTRole.Receive_New_Action_Notification__c=AMCRole.amc__Receive_New_Action_Notification__c;
        NMTRole.Name=AMCRole.Name;
        NMTRole.Role_Notes_RT__c=AMCRole.amc__Role_Notes_RT__c;
        /*NMTRole.Timesheet_Approver__c=AMCRole.amc__Timesheet_Approver__c;*/
        NMTRole.Timesheet_Approver__c=null;
        NMTRole.Track_Pad_Default_Tab__c=AMCRole.amc__Track_Pad_Default_Tab__c;
        NMTRole.User__c=AMCRole.amc__User__c;
        NMTRole.View_Action_Pad_Tab__c=AMCRole.amc__View_Action_Pad_Tab__c;
        NMTRole.View_Billing_Tab__c=AMCRole.amc__View_Billing_Tab__c;
        NMTRole.View_Billing_Tab_Charts__c=AMCRole.amc__View_Billing_Tab_Charts__c;
        NMTRole.View_Control_Pad__c=AMCRole.amc__View_Control_Pad__c;
        NMTRole.View_Expenses_Tab__c=AMCRole.amc__View_Expenses_Tab__c;
        NMTRole.View_Expenses_Tab_Charts__c=AMCRole.amc__View_Expenses_Tab_Charts__c;
        NMTRole.View_Gantt_Chart_Tab__c=AMCRole.amc__View_Gantt_Chart_Tab__c;
        NMTRole.View_Insights_Tab__c=AMCRole.amc__View_Insights_Tab__c;
        NMTRole.View_Issue_Log_Tab__c=AMCRole.amc__View_Issue_Log_Tab__c;
        NMTRole.View_Launch_Pad__c=AMCRole.amc__View_Launch_Pad__c;
        NMTRole.View_Management_Pad__c=AMCRole.amc__View_Management_Pad__c;
        NMTRole.View_Overview_Tab__c=AMCRole.amc__View_Overview_Tab__c;
        NMTRole.View_Overview_Tab_Charts__c=AMCRole.amc__View_Overview_Tab_Charts__c;
        NMTRole.View_Progress_Pad__c=AMCRole.amc__View_Progress_Pad__c;
        NMTRole.View_Rev_Rec_Tab__c=AMCRole.amc__View_Rev_Rec_Tab__c;
        NMTRole.View_Risks_Tab__c=AMCRole.amc__View_Risks_Tab__c;
        NMTRole.View_Risks_Tab_Charts__c=AMCRole.amc__View_Risks_Tab_Charts__c;
        NMTRole.View_Scheduler_Tab__c=AMCRole.amc__View_Scheduler_Tab__c;
        NMTRole.View_Time_Logs_Tab__c=AMCRole.amc__View_Time_Logs_Tab__c;
        NMTRole.View_Time_Logs_Tab_Charts__c=AMCRole.amc__View_Time_Logs_Tab_Charts__c;
        NMTRole.View_Track_Pad__c=AMCRole.amc__View_Track_Pad__c;
        NMTRole.View_Track_Pad_Add_Action__c=AMCRole.amc__View_Track_Pad_Add_Action__c;
        NMTRole.View_Track_Pad_Add_Issue__c=AMCRole.amc__View_Track_Pad_Add_Issue__c;
        NMTRole.View_Track_Pad_Add_Risk__c=AMCRole.amc__View_Track_Pad_Add_Risk__c;
        NMTRole.View_Track_Pad_Expense_Logger__c=AMCRole.amc__View_Track_Pad_Expense_Logger__c;
        NMTRole.View_Track_Pad_Feed__c=AMCRole.amc__View_Track_Pad_Feed__c;
        NMTRole.View_Track_Pad_Time_Logger__c=AMCRole.amc__View_Track_Pad_Time_Logger__c;
        NMTRole.View_Track_Pad_Timeline__c=AMCRole.amc__View_Track_Pad_Timeline__c;
        NMTRole.View_Whiteboard_Tab__c=AMCRole.amc__View_Whiteboard_Tab__c;
        return NMTRole;
    }

    public static List<amc__Role__c> getRolesByIds(List<Id>  roleIds){
        List<amc__Role__c> amcRoles = [SELECT Id,amc__Action_Notification_Due__c,amc__Active__c,Exclude_from_Scheduler_Formula__c,amc__Manage_Subordinate_Timesheets__c,amc__Manage_Timesheets__c,amc__Milestone_Notification_Due__c,amc__Receive_Action_Notifications__c,amc__Receive_Digest__c,amc__Receive_New_Action_Notification__c,amc__View_Action_Pad_Tab__c,amc__View_Billing_Tab__c,amc__View_Billing_Tab_Charts__c,amc__View_Control_Pad__c,amc__View_Expenses_Tab__c,amc__View_Expenses_Tab_Charts__c,amc__View_Gantt_Chart_Tab__c,amc__View_Insights_Tab__c,amc__View_Issue_Log_Tab__c,amc__View_Launch_Pad__c,amc__View_Management_Pad__c,amc__View_Overview_Tab__c,amc__View_Overview_Tab_Charts__c,amc__View_Progress_Pad__c,amc__View_Rev_Rec_Tab__c,amc__View_Risks_Tab__c,amc__View_Risks_Tab_Charts__c,amc__View_Scheduler_Tab__c,amc__View_Time_Logs_Tab__c,amc__View_Time_Logs_Tab_Charts__c,amc__View_Track_Pad__c,amc__View_Track_Pad_Add_Action__c,amc__View_Track_Pad_Add_Issue__c,amc__View_Track_Pad_Add_Risk__c,amc__View_Track_Pad_Expense_Logger__c,amc__View_Track_Pad_Feed__c,amc__View_Track_Pad_Time_Logger__c,amc__View_Track_Pad_Timeline__c,amc__View_Whiteboard_Tab__c,
                                              amc__Hourly_Rate__c,amc__Cost_Hourly_Rate__c,amc__Mileage_Rate__c,
                                              Name,amc__Console_Default_Tab__c,amc__Job_Title__c,amc__Project_Overview_Default_Tab__c,amc__Role_Notes_RT__c,amc__Track_Pad_Default_Tab__c,
                                              amc__Contact__c,amc__Expense_Approver__c,amc__Master_Team__c,OwnerId,amc__Timesheet_Approver__c,amc__User__c,
                                              amc__Billable_Target__c,amc__Email__c,amc__Hours_Per_Week__c
                                       FROM amc__Role__c 
                                       WHERE Id=:roleIds];
        return amcRoles;
    }

    public static Map<Id, Id> getLookupRelator(List<Id> roleIds,Map<Id, Id> lookupRelator){
        List<NMT_Project_Role__c> NMTProjectsRoles = [SELECT Id,Role__c 
                                                      FROM NMT_Project_Role__c 
                                                      WHERE Role_Upsert_Id__c=:roleIds];

        for (NMT_Project_Role__c oneNMTProjectRole : NMTProjectsRoles) {
            if(lookupRelator.get(oneNMTProjectRole.Role__c)==null){ 
                lookupRelator.put(oneNMTProjectRole.Role__c,oneNMTProjectRole.Id); 
            }
        }

        return lookupRelator;
    }

}