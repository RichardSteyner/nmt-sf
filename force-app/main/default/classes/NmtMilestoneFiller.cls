public class NmtMilestoneFiller {

    public static NMT_Milestone__c fillNmtMilestone(amc__Milestone__c AMCMilestone){
        NMT_Milestone__c NMTMilestone = new NMT_Milestone__c();
        NMTMilestone.Apex_Id__c=AMCMilestone.Apex_Id__c;
        NMTMilestone.Archived__c=AMCMilestone.amc__Archived__c;
        NMTMilestone.Contractor__c=AMCMilestone.Contractor__c;
        NMTMilestone.Exclude_from_Billable_Capacity__c=AMCMilestone.amc__Exclude_from_Billable_Capacity__c;
        NMTMilestone.Exclude_from_Gantt__c=AMCMilestone.amc__Exclude_from_Gantt__c;
        NMTMilestone.Exclude_from_Scheduler__c=AMCMilestone.amc__Exclude_from_Scheduler__c;
        NMTMilestone.Exclude_from_Timesheet__c=AMCMilestone.amc__Exclude_from_Timesheet__c;
        NMTMilestone.Gantt_Collapsed__c=AMCMilestone.amc__Gantt_Collapsed__c;
        NMTMilestone.Has_Dependent_Actions__c=AMCMilestone.amc__Has_Dependent_Actions__c;
        NMTMilestone.Hours_Completed_Non_Billable__c=AMCMilestone.amc__Hours_Completed_Non_Billable__c;
        NMTMilestone.Hours_Completed_Value_Cost__c=AMCMilestone.amc__Hours_Completed_Value_Cost__c;
        NMTMilestone.Hours_Remaining_Non_Billable__c=AMCMilestone.amc__Hours_Remaining_Non_Billable__c;
        NMTMilestone.Hours_Remaining_Value_Cost__c=AMCMilestone.amc__Hours_Remaining_Value_Cost__c;
        NMTMilestone.Hours_Scheduled_Non_Billable__c=AMCMilestone.amc__Hours_Scheduled_Non_Billable__c;
        NMTMilestone.Hours_Scheduled_Value_Cost__c=AMCMilestone.amc__Hours_Scheduled_Value_Cost__c;
        NMTMilestone.Invoice_Amount__c=AMCMilestone.amc__Invoice_Amount__c;
        NMTMilestone.Invoice_on_Completion__c=AMCMilestone.amc__Invoice_on_Completion__c;
        NMTMilestone.Is_Recurring__c=AMCMilestone.amc__Is_Recurring__c;
        NMTMilestone.Milestone_Budget__c=AMCMilestone.amc__Milestone_Budget__c;
        NMTMilestone.Milestone_Deadline__c=AMCMilestone.amc__Milestone_Deadline__c;
        NMTMilestone.Name=AMCMilestone.Name;
        NMTMilestone.Milestone_Notes_RT__c=AMCMilestone.amc__Milestone_Notes_RT__c;
        NMTMilestone.Milestone_Notes__c=AMCMilestone.amc__Milestone_Notes__c;
        NMTMilestone.Milestone_Sort_Order__c=AMCMilestone.amc__Milestone_Sort_Order__c;
        NMTMilestone.Milestone_Type__c=AMCMilestone.amc__Milestone_Type__c;
        NMTMilestone.Non_Billable__c=AMCMilestone.amc__Non_Billable__c;
        NMTMilestone.Number_of_Recurrences__c=AMCMilestone.amc__Number_of_Recurrences__c;
        NMTMilestone.Old_SFDC_ID__c=AMCMilestone.amc__Old_SFDC_ID__c;
        NMTMilestone.Project_Apex_Id__c=AMCMilestone.Project_Apex_Id__c;
        NMTMilestone.Push_Notification__c=AMCMilestone.Push_Notification__c;
        NMTMilestone.Recurrences_Remaining__c=AMCMilestone.amc__Recurrences_Remaining__c;
        NMTMilestone.Recurring_Frequency__c=AMCMilestone.amc__Recurring_Frequency__c;
        NMTMilestone.Role_Apex_Id__c=AMCMilestone.Role_Apex_Id__c;
        NMTMilestone.Status__c=AMCMilestone.amc__Status__c;
        NMTMilestone.Milestone_Owner__c = null;
        /*NMTMilestone.NMT_Project__c = null;*/
        return NMTMilestone;
    }

    public static List<amc__Milestone__c> getMilestonesByIds(List<Id>  MilestoneIds){
        List<amc__Milestone__c> amcMilestone = [SELECT amc__Archived__c,amc__Exclude_from_Billable_Capacity__c,amc__Exclude_from_Gantt__c,amc__Exclude_from_Scheduler__c,amc__Exclude_from_Timesheet__c,amc__Gantt_Collapsed__c,amc__Has_Dependent_Actions__c,amc__Invoice_on_Completion__c,amc__Is_Recurring__c,amc__Non_Billable__c,
                                                       amc__Hours_Completed_Non_Billable__c,amc__Hours_Remaining_Non_Billable__c,amc__Hours_Scheduled_Non_Billable__c,amc__Milestone_Sort_Order__c,amc__Number_of_Recurrences__c,amc__Recurrences_Remaining__c,
                                                       amc__Milestone_Deadline__c,Name,amc__Milestone_Type__c,Project_Apex_Id__c,Push_Notification__c,amc__Recurring_Frequency__c,Role_Apex_Id__c,amc__Status__c,
                                                       Apex_Id__c,amc__Milestone_Notes_RT__c,amc__Milestone_Notes__c,amc__Old_SFDC_ID__c,
                                                       amc__Hours_Completed_Value_Cost__c,amc__Hours_Remaining_Value_Cost__c,amc__Hours_Scheduled_Value_Cost__c,amc__Invoice_Amount__c,amc__Milestone_Budget__c,
                                                       Contractor__c,amc__Milestone_Owner__c,amc__Project__c 
                                                FROM   amc__Milestone__c
                                                WHERE Id=:MilestoneIds];
        return amcMilestone;
    }

    public static Map<Id, Id> getLookupRelator(List<Id> milestoneIds,Map<Id, Id> lookupRelator){
        List<NMT_Milestone__c> NMTMilestones = [SELECT Id,Milestone__c 
                                                FROM NMT_Milestone__c 
                                                WHERE Milestone_Upsert_Id__c=:milestoneIds];  
        for (NMT_Milestone__c oneNMTMilestone : NMTMilestones) {
            if(lookupRelator.get(oneNMTMilestone.Milestone__c)==null){
                lookupRelator.put(oneNMTMilestone.Milestone__c,oneNMTMilestone.Id); 
            }
        }

        return lookupRelator;
    }


}