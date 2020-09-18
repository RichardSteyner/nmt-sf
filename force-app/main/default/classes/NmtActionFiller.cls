public class NmtActionFiller {

    public static NMT_Action__c fillNmtAction(amc__Action__c AMCAction){
        NMT_Action__c NMTAction = new NMT_Action__c();
        NMTAction.Name=AMCAction.Name;
        NMTAction.Action_Name__c=AMCAction.amc__Action_Name__c;
        NMTAction.Action_Notes__c=AMCAction.amc__Action_Notes_RT__c;
        NMTAction.Action_Owner_Email__c=AMCAction.amc__Action_Owner_Email__c;
        NMTAction.Action_Type__c=AMCAction.amc__Action_Type__c;
        NMTAction.Baseline_End_Date__c=AMCAction.amc__Baseline_End_Date__c;
        NMTAction.Baseline_Start_Date__c=AMCAction.amc__Baseline_Start_Date__c;
        NMTAction.Benefit__c=AMCAction.amc__Benefit__c;
        NMTAction.Complete_Checklist_Items__c=AMCAction.amc__Complete_Checklist_Items__c;
        NMTAction.Completion_Percent__c=AMCAction.amc__Completion_Percent__c;
        NMTAction.Completion_Overridden__c=AMCAction.amc__Completion_Overridden__c;
        NMTAction.Dependant_Emails_Sent__c=AMCAction.amc__Dependant_Emails_Sent__c;
        NMTAction.End_Date__c=AMCAction.amc__End_Date__c;
        NMTAction.Actual_End_Time__c=AMCAction.amc__Actual_End_Time__c;
        NMTAction.Est_Pick_Up_Or_Delivery_Date__c=AMCAction.Est_Pick_Up_Or_Delivery_Date__c;
        NMTAction.Event__c=AMCAction.amc__Event__c;
        NMTAction.Exclude_from_Billable_Capacity__c=AMCAction.amc__Exclude_from_Billable_Capacity__c;
        NMTAction.Exclude_from_Daily_Digest__c=AMCAction.amc__Exclude_from_Daily_Digest__c;
        NMTAction.Exclude_from_Gantt__c=AMCAction.amc__Exclude_from_Gantt__c;
        NMTAction.Exclude_from_Scheduler__c=AMCAction.amc__Exclude_from_Scheduler__c;
        NMTAction.Exclude_from_Timesheet__c=AMCAction.amc__Exclude_from_Timesheet__c;
        NMTAction.Gantt_Sort_Order__c=AMCAction.amc__Gantt_Sort_Order__c;
        NMTAction.Gap_From_Parent__c=AMCAction.amc__Gap_From_Parent__c;
        NMTAction.General_Notes__c=AMCAction.General_Notes__c;
        NMTAction.Has_Dependant_Actions__c=AMCAction.amc__Has_Dependant_Actions__c;
        NMTAction.Hours_Completed__c=AMCAction.amc__Hours_Completed__c;
        NMTAction.Hours_Completed_Non_Billable__c=AMCAction.amc__Hours_Completed_Non_Billable__c;
        NMTAction.Hours_Completed_Cost__c=AMCAction.amc__Hours_Completed_Cost__c;
        NMTAction.Hours_Completed_Value_Cost__c=AMCAction.amc__Hours_Completed_Value_Cost__c;
        NMTAction.Hours_Remaining_Cost__c=AMCAction.amc__Hours_Remaining_Cost__c;
        NMTAction.Hours_Remaining_Value_Cost__c=AMCAction.amc__Hours_Remaining_Value_Cost__c;
        NMTAction.Hours_Scheduled__c=AMCAction.amc__Hours_Scheduled__c;
        NMTAction.Hours_Scheduled_Non_Billable__c=AMCAction.amc__Hours_Scheduled_Non_Billable__c;
        NMTAction.Hours_Scheduled_Cost__c=AMCAction.amc__Hours_Scheduled_Cost__c;
        NMTAction.Hours_Scheduled_Value_Cost__c=AMCAction.amc__Hours_Scheduled_Value_Cost__c;
        NMTAction.Ignore_Non_Working_Days__c=AMCAction.amc__Ignore_Non_Working_Days__c;
        NMTAction.Is_Recurring__c=AMCAction.amc__Is_Recurring__c;
        NMTAction.Last_Owner_Change__c=AMCAction.amc__Last_Owner_Change__c;
        NMTAction.Location__c=AMCAction.Location__c;
        NMTAction.Expense_Summary__c=AMCAction.amc__Expense_Summary__c;
        NMTAction.Material_Costs_Scheduled__c=AMCAction.amc__Material_Costs_Scheduled__c;
        NMTAction.Method_of_Receipt__c=AMCAction.Method_of_Receipt__c;
        NMTAction.Non_Billable__c=AMCAction.amc__Non_Billable__c;
        NMTAction.Notes__c=AMCAction.amc__Notes__c;
        NMTAction.Notify__c=AMCAction.amc__Notify__c;
        NMTAction.Number_of_Recurrences__c=AMCAction.amc__Number_of_Recurrences__c;
        NMTAction.Old_SFDC_Action_ID__c=AMCAction.amc__Old_SFDC_Action_ID__c;
        NMTAction.Old_SFDC_ID__c=AMCAction.amc__Old_SFDC_ID__c;
        NMTAction.Pain_Points__c=AMCAction.amc__Pain_Points__c;
        NMTAction.Priority__c=AMCAction.amc__Priority__c;
        NMTAction.Product_Installation_notes__c=AMCAction.Product_Installation_notes__c;
        NMTAction.Push_Notification__c=AMCAction.Push_Notification__c;
        NMTAction.Quantity__c=AMCAction.Quantity__c;
        NMTAction.Receive_New_Action_Notification__c=AMCAction.amc__Receive_New_Action_Notification__c;
        NMTAction.Recommendations__c=AMCAction.amc__Recommendations__c;
        NMTAction.Recurring_Frequency__c=AMCAction.amc__Recurring_Frequency__c;
        NMTAction.Scheduled_Hours_Breakdown__c=AMCAction.amc__Scheduled_Hours_Breakdown__c;
        NMTAction.Size__c=AMCAction.Size__c;
        NMTAction.Start_Date__c=AMCAction.amc__Start_Date__c;
        NMTAction.Start_Hour__c=AMCAction.amc__Start_Hour__c;
        NMTAction.Start_Minute__c=AMCAction.amc__Start_Minute__c;
        NMTAction.noamc_Status__c=AMCAction.Status__c;
        NMTAction.Status__c=AMCAction.amc__Status__c;
        NMTAction.Custom_Status__c=AMCAction.amc__Custom_Status__c;
        NMTAction.System_End__c=AMCAction.amc__System_End__c;
        NMTAction.System_Start__c=AMCAction.amc__System_Start__c;
        NMTAction.Task__c=AMCAction.amc__Task__c;
        NMTAction.Total_Spent__c=AMCAction.Total_Spent__c;
        NMTAction.Total_Checklist_Items__c=AMCAction.amc__Total_Checklist_Items__c;
        NMTAction.Total_User_Story_Efforts__c=AMCAction.amc__Total_User_Story_Efforts__c;
        NMTAction.Tracking__c=AMCAction.Tracking__c;
        NMTAction.Working_Days__c=AMCAction.amc__Working_Days__c;
        NMTAction.Whiteboard_Priority_Order__c=AMCAction.Whiteboard_Priority_Order_Formula__c;
        NMTAction.Card_Size__c=AMCAction.Card_Size_Formula__c;
        NMTAction.Product__c =  AMCAction.Product__c;
        NMTAction.Requirement__c = AMCAction.amc__Requirement__c;
        NMTAction.Skill__c =  AMCAction.amc__Skill__c;
        NMTAction.Action_Owner__c = null;
        NMTAction.Dependant_Action__c = null;
        NMTAction.NMT_Milestone__c=null;
        NMTAction.Est_Delivery_Pickup_Start_Date_Time__c =  AMCAction.Est_Delivery_Pickup_Start_Date_Time__c;
        NMTAction.Est_Delivery_Pickup_End_Date_Time__c =  AMCAction.Est_Delivery_Pickup_End_Date_Time__c;
        NMTAction.Delivery_or_Pickup__c =  AMCAction.Delivery_or_Pickup__c;
        NMTAction.Purchaser__c = AMCAction.Purchaser__c;
        NMTAction.UOM__c = AMCAction.UOM__c;

        return NMTAction;
    }

    public static List<amc__Action__c> getActionsByIds(List<Id>  ActionIds){
        List<amc__Action__c> amcAction = [SELECT amc__Completion_Overridden__c,amc__Dependant_Emails_Sent__c,amc__Event__c,amc__Exclude_from_Billable_Capacity__c,amc__Exclude_from_Daily_Digest__c,amc__Exclude_from_Gantt__c,amc__Exclude_from_Scheduler__c,amc__Exclude_from_Timesheet__c,amc__Has_Dependant_Actions__c,amc__Ignore_Non_Working_Days__c,amc__Is_Recurring__c,amc__Non_Billable__c,amc__Notify__c,amc__Receive_New_Action_Notification__c,amc__Task__c,
                                                 amc__Hours_Completed_Cost__c,amc__Hours_Completed_Value_Cost__c,amc__Hours_Remaining_Cost__c,amc__Hours_Remaining_Value_Cost__c,amc__Hours_Scheduled_Cost__c,amc__Hours_Scheduled_Value_Cost__c,amc__Material_Costs_Scheduled__c,Total_Spent__c,
                                                 Name,amc__Complete_Checklist_Items__c,amc__Gantt_Sort_Order__c,amc__Gap_From_Parent__c,amc__Hours_Scheduled__c,amc__Hours_Scheduled_Non_Billable__c,amc__Number_of_Recurrences__c,Quantity__c,amc__Total_Checklist_Items__c,amc__Total_User_Story_Efforts__c,amc__Working_Days__c,Whiteboard_Priority_Order_Formula__c,
                                                 amc__Action_Name__c,General_Notes__c,Location__c,amc__Notes__c,amc__Old_SFDC_Action_ID__c,amc__Old_SFDC_ID__c,amc__Pain_Points__c,Product_Installation_notes__c,amc__Recommendations__c,amc__Scheduled_Hours_Breakdown__c,Size__c,Tracking__c,
                                                 amc__Action_Notes_RT__c,amc__Benefit__c,Card_Size_Formula__c,
                                                 amc__Action_Owner__c,amc__Dependant_Action__c,Product__c,amc__Requirement__c,amc__Skill__c,
                                                 amc__Action_Type__c,Method_of_Receipt__c,amc__Priority__c,Push_Notification__c,amc__Recurring_Frequency__c,amc__Start_Hour__c,amc__Start_Minute__c,Status__c,amc__Status__c,amc__Custom_Status__c,
                                                 amc__Hours_Completed__c,amc__Hours_Completed_Non_Billable__c,amc__Expense_Summary__c,
                                                 amc__Baseline_End_Date__c,amc__Baseline_Start_Date__c,amc__End_Date__c,Est_Pick_Up_Or_Delivery_Date__c,amc__Last_Owner_Change__c,amc__Start_Date__c,amc__System_End__c,amc__System_Start__c,
                                                 amc__Action_Owner_Email__c,amc__Completion_Percent__c,amc__Actual_End_Time__c,amc__End_Time__c,amc__Milestone__c,
                                          		 Est_Delivery_Pickup_Start_Date_Time__c, Est_Delivery_Pickup_End_Date_Time__c, Delivery_or_Pickup__c, Purchaser__c, UOM__c 
                                        FROM    amc__Action__c
                                        WHERE Id=:ActionIds];
        return amcAction;
    }

    public static Map<Id, Id> getLookupRelator(List<Id> actionsIds,Map<Id, Id> lookupRelator){
        List<NMT_Action__c> NMTAtions = [SELECT Id, Action__c 
                                         FROM NMT_Action__c 
                                         WHERE Action_Upsert_Id__c=:actionsIds];

        for (NMT_Action__c oneNMTActionRole : NMTAtions) {
            if(lookupRelator.get(oneNMTActionRole.Action__c)==null){
                lookupRelator.put(oneNMTActionRole.Action__c,oneNMTActionRole.Id); 
            }
        }

        return lookupRelator;
    }

}