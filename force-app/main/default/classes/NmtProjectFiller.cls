public class NmtProjectFiller {

    public static NMT_Project__c fillNmtProject(amc__Project__c AMCProject){
        NMT_Project__c NMTProject= new NMT_Project__c();
        NMTProject.Account__c=AMCProject.amc__Account__c;
        NMTProject.Actual_Project_Expenses__c=AMCProject.amc__Actual_Project_Expenses__c;
        NMTProject.Actual_Project_Expenses_Billable__c=AMCProject.amc__Actual_Project_Expenses_Billable__c;
        NMTProject.Actual_Project_Expenses_Non_Billable__c=AMCProject.amc__Actual_Project_Expenses_Non_Billable__c;
        NMTProject.Amount_Invoiced__c=AMCProject.amc__Amount_Invoiced__c;
        NMTProject.Amount_Outstanding__c=AMCProject.amc__Amount_Outstanding__c;
        NMTProject.Amount_Paid__c=AMCProject.amc__Amount_Paid__c;
        NMTProject.Anticipated_Project_Expenses__c=AMCProject.amc__Anticipated_Project_Expenses__c;
        NMTProject.Apex_Id__c=AMCProject.Apex_Id__c;
        NMTProject.Archived__c=AMCProject.amc__Archived__c;
        NMTProject.Day_Rate__c=AMCProject.amc__Day_Rate__c;
        NMTProject.Billable_Hourly_Rate__c=AMCProject.amc__Billable_Hourly_Rate__c;
        NMTProject.Billing_Cycle__c=AMCProject.amc__Billing_Cycle__c;
        NMTProject.Project_Day_Rate__c=AMCProject.amc__Project_Day_Rate__c;
        NMTProject.Billing_Type__c=AMCProject.amc__Billing_Type__c;
        NMTProject.Category__c=AMCProject.amc__Category__c;
        NMTProject.Colour__c=AMCProject.amc__Colour__c;
        NMTProject.Contact__c=AMCProject.amc__Contact__c;
        NMTProject.Cost_Day_Rate__c=AMCProject.amc__Cost_Day_Rate__c;
        NMTProject.Cost_Hourly_Rate__c=AMCProject.amc__Cost_Hourly_Rate__c;
        NMTProject.Cost_Rate__c=AMCProject.amc__Cost_Rate__c;
        NMTProject.Current_CPI__c=AMCProject.amc__Current_CPI__c;
        NMTProject.Current_SPI__c=AMCProject.amc__Current_SPI__c;
        NMTProject.Description__c=AMCProject.amc__Description__c;
        NMTProject.Display_on_PMO_Dashboard__c=AMCProject.amc__Display_on_PMO_Dashboard__c;
        NMTProject.Enforce_Dependency_Validation__c=AMCProject.amc__Enforce_Dependency_Validation__c;
        NMTProject.Exclude_from_Billable_Capacity__c=AMCProject.amc__Exclude_from_Billable_Capacity__c;
        NMTProject.Exclude_from_Daily_Digest__c=AMCProject.amc__Exclude_from_Daily_Digest__c;
        NMTProject.Exclude_from_Program_Planner__c=AMCProject.amc__Exclude_from_Program_Planner__c;
        NMTProject.Exclude_from_Scheduler__c=AMCProject.amc__Exclude_from_Scheduler__c;
        NMTProject.Exclude_from_Timesheet__c=AMCProject.amc__Exclude_from_Timesheet__c;
        NMTProject.Force_Financials_Recalculation__c=AMCProject.amc__Force_Financials_Recalculation__c;
        NMTProject.Gantt_Chart_Unit__c=AMCProject.amc__Gantt_Chart_Unit__c;
        NMTProject.Gantt_Collapsed__c=AMCProject.amc__Gantt_Collapsed__c;
        NMTProject.General_Contractor__c=AMCProject.General_Contractor__c;
        NMTProject.Generate_Weekly_Project_Status_Report__c=AMCProject.amc__Generate_Weekly_Project_Status_Report__c;
        NMTProject.Hours_Allocated__c=AMCProject.amc__Hours_Allocated__c;
        NMTProject.Hours_Completed_Non_Billable__c=AMCProject.amc__Hours_Completed_Non_Billable__c;
        NMTProject.Hours_Completed_Value_Cost__c=AMCProject.amc__Hours_Completed_Value_Cost__c;
        NMTProject.Hours_Per_Day__c=AMCProject.amc__Hours_Per_Day__c;
        NMTProject.Hours_Remaining_Non_Billable__c=AMCProject.amc__Hours_Remaining_Non_Billable__c;
        NMTProject.Hours_Remaining_Value_Cost__c=AMCProject.amc__Hours_Remaining_Value_Cost__c;
        NMTProject.Hours_Scheduled_Non_Billable__c=AMCProject.amc__Hours_Scheduled_Non_Billable__c;
        NMTProject.Hours_Scheduled_Value_Cost__c=AMCProject.amc__Hours_Scheduled_Value_Cost__c;
        NMTProject.Include_Expense_Appendix__c=AMCProject.amc__Include_Expense_Appendix__c;
        NMTProject.Include_Non_Billable_Time_in_Appendix__c=AMCProject.amc__Include_Non_Billable_Time_in_Appendix__c;
        NMTProject.Include_Time_Log_Appendix__c=AMCProject.amc__Include_Time_Log_Appendix__c;
        NMTProject.Left_Neighbor_Name__c=AMCProject.Left_Neighbor_Name__c;
        NMTProject.Left_Neighbor_Notes__c=AMCProject.Left_Neighbor_Notes__c;
        NMTProject.Left_Neighbor_Phone__c=AMCProject.Left_Neighbor_Phone__c;
        NMTProject.Logo_URL__c=AMCProject.amc__Logo_URL__c;
        NMTProject.Non_Billable__c=AMCProject.amc__Non_Billable__c;
        NMTProject.Old_SFDC_ID__c=AMCProject.amc__Old_SFDC_ID__c;
        NMTProject.Opportunity__c=AMCProject.amc__Opportunity__c;
        NMTProject.Overtime_Allowed_Billable__c=AMCProject.amc__Overtime_Allowed_Billable__c;
        NMTProject.Overtime_Allowed_Cost__c=AMCProject.amc__Overtime_Allowed_Cost__c;
        NMTProject.Overtime_Ratio_Billable__c=AMCProject.amc__Overtime_Ratio_Billable__c;
        NMTProject.Overtime_Ratio_Cost__c=AMCProject.amc__Overtime_Ratio_Cost__c;
        NMTProject.OwnerId=AMCProject.OwnerId;
        NMTProject.Payment_Terms__c=AMCProject.amc__Payment_Terms__c;
        NMTProject.Pending_Project_Expenses_Billable__c=AMCProject.amc__Pending_Project_Expenses_Billable__c;
        NMTProject.Pending_Project_Expenses_Non_Billable__c=AMCProject.amc__Pending_Project_Expenses_Non_Billable__c;
        NMTProject.Periodic_Billing_Frequency__c=AMCProject.amc__Periodic_Billing_Frequency__c;
        NMTProject.Periodic_Billing_Last_Date__c=AMCProject.amc__Periodic_Billing_Last_Date__c;
        NMTProject.Periodic_Billing_Next_Date__c=AMCProject.amc__Periodic_Billing_Next_Date__c;
        NMTProject.Program__c=AMCProject.amc__Program__c;
        NMTProject.Program_Sort_Order__c=AMCProject.amc__Program_Sort_Order__c;
        NMTProject.Cost_Budget__c=AMCProject.amc__Cost_Budget__c;
        NMTProject.Name=AMCProject.Name;
        NMTProject.Project_Notes__c=AMCProject.amc__Project_Notes_RT__c;
        NMTProject.Project_Owner_Expense_Approval_Reqd__c=AMCProject.amc__Project_Owner_Expense_Approval_Reqd__c;
        NMTProject.Project_Owner_Timesheet_Approval_Reqd__c=AMCProject.amc__Project_Owner_Timesheet_Approval_Reqd__c;
        NMTProject.Project_Reference__c=AMCProject.amc__Project_Reference__c;
        NMTProject.Purchase_Order__c=AMCProject.amc__Purchase_Order__c;
        NMTProject.Purchase_Order_Total_Amount__c=AMCProject.amc__Purchase_Order_Total_Amount__c;
        NMTProject.Purchase_Order_Total_Amount_Paid__c=AMCProject.amc__Purchase_Order_Total_Amount_Paid__c;
        NMTProject.Retainer_Amount__c=AMCProject.amc__Retainer_Amount__c;
        NMTProject.Right_Neighbor_Name__c=AMCProject.Right_Neighbor_Name__c;
        NMTProject.L__c=AMCProject.L__c;
        NMTProject.Right_Neighbor_Phone__c=AMCProject.Right_Neighbor_Phone__c;
        NMTProject.Role_Apex_Id__c=AMCProject.Role_Apex_Id__c;
        NMTProject.Role_Manager_Expense_Approval_Reqd__c=AMCProject.amc__Role_Manager_Expense_Approval_Reqd__c;
        NMTProject.Role_Manager_Timesheet_Approval_Reqd__c=AMCProject.amc__Role_Manager_Timesheet_Approval_Reqd__c;
        NMTProject.Set_Baseline_Dates__c=AMCProject.amc__Set_Baseline_Dates__c;
        NMTProject.Status__c=AMCProject.amc__Status__c;
        NMTProject.Sub_Category__c=AMCProject.amc__Sub_Category__c;
        NMTProject.Tax_Amount_Invoiced__c=AMCProject.amc__Tax_Amount_Invoiced__c;
        NMTProject.Tax_Amount_Outstanding__c=AMCProject.amc__Tax_Amount_Outstanding__c;
        NMTProject.Tax_Amount_Paid__c=AMCProject.amc__Tax_Amount_Paid__c;
        NMTProject.Tax_Label__c=AMCProject.amc__Tax_Label__c;
        NMTProject.Template__c=AMCProject.amc__Template__c;
        NMTProject.Total_Credited__c=AMCProject.amc__Total_Credited__c;
        NMTProject.Total_Outstanding__c=AMCProject.amc__Total_Outstanding__c;
        NMTProject.Total_Paid__c=AMCProject.amc__Total_Paid__c;
        NMTProject.Weekly_Status_Report_Include_Issues__c=AMCProject.amc__Weekly_Status_Report_Include_Issues__c;
        NMTProject.Weekly_Status_Report_Include_Risks__c=AMCProject.amc__Weekly_Status_Report_Include_Risks__c;
        NMTProject.Weekly_Status_Report_Include_Time_Logs__c=AMCProject.amc__Weekly_Status_Report_Include_Time_Logs__c;
        NMTProject.Project_Owner__c = null;

        return NMTProject;
    }
    
    public static List<amc__Project__c> getProjectsByIds(List<Id>  ProjectIds){
        List<amc__Project__c> amcProject = [SELECT amc__Actual_Project_Expenses__c,amc__Actual_Project_Expenses_Billable__c,amc__Actual_Project_Expenses_Non_Billable__c,amc__Amount_Invoiced__c,amc__Amount_Outstanding__c,amc__Amount_Paid__c,amc__Anticipated_Project_Expenses__c,amc__Day_Rate__c,amc__Cost_Day_Rate__c,amc__Hours_Completed_Value_Cost__c,amc__Hours_Remaining_Value_Cost__c,amc__Hours_Scheduled_Value_Cost__c,amc__Pending_Project_Expenses_Billable__c,amc__Pending_Project_Expenses_Non_Billable__c,amc__Cost_Budget__c,amc__Purchase_Order_Total_Amount__c,amc__Purchase_Order_Total_Amount_Paid__c,amc__Retainer_Amount__c,amc__Tax_Amount_Invoiced__c,amc__Tax_Amount_Outstanding__c,amc__Tax_Amount_Paid__c,amc__Total_Credited__c,amc__Total_Outstanding__c,amc__Total_Paid__c,
                                                   amc__Archived__c,amc__Display_on_PMO_Dashboard__c,amc__Enforce_Dependency_Validation__c,amc__Exclude_from_Billable_Capacity__c,amc__Exclude_from_Daily_Digest__c,amc__Exclude_from_Program_Planner__c,amc__Exclude_from_Scheduler__c,amc__Exclude_from_Timesheet__c,amc__Force_Financials_Recalculation__c,amc__Gantt_Collapsed__c,amc__Generate_Weekly_Project_Status_Report__c,amc__Include_Expense_Appendix__c,amc__Include_Non_Billable_Time_in_Appendix__c,amc__Include_Time_Log_Appendix__c,amc__Non_Billable__c,amc__Overtime_Allowed_Billable__c,amc__Overtime_Allowed_Cost__c,amc__Project_Owner_Expense_Approval_Reqd__c,amc__Project_Owner_Timesheet_Approval_Reqd__c,amc__Role_Manager_Expense_Approval_Reqd__c,amc__Role_Manager_Timesheet_Approval_Reqd__c,amc__Set_Baseline_Dates__c,amc__Template__c,amc__Weekly_Status_Report_Include_Issues__c,amc__Weekly_Status_Report_Include_Risks__c,amc__Weekly_Status_Report_Include_Time_Logs__c,
                                                   amc__Billing_Cycle__c,amc__Project_Day_Rate__c,amc__Billing_Type__c,amc__Category__c,amc__Colour__c,amc__Cost_Rate__c,amc__Gantt_Chart_Unit__c,amc__Payment_Terms__c,amc__Periodic_Billing_Frequency__c,amc__Status__c,amc__Sub_Category__c,
                                                   Apex_Id__c,amc__Description__c,Left_Neighbor_Name__c,Left_Neighbor_Notes__c,amc__Old_SFDC_ID__c,Name,amc__Project_Notes_RT__c,amc__Project_Reference__c,amc__Purchase_Order__c,Right_Neighbor_Name__c,L__c,Role_Apex_Id__c,
                                                   amc__Current_CPI__c,amc__Current_SPI__c,amc__Hours_Allocated__c,amc__Hours_Completed_Non_Billable__c,amc__Hours_Per_Day__c,amc__Hours_Remaining_Non_Billable__c,amc__Hours_Scheduled_Non_Billable__c,amc__Overtime_Ratio_Billable__c,amc__Overtime_Ratio_Cost__c,amc__Program_Sort_Order__c,
                                                   Left_Neighbor_Phone__c,amc__Logo_URL__c,amc__Periodic_Billing_Last_Date__c,amc__Periodic_Billing_Next_Date__c,Right_Neighbor_Phone__c,
                                                   amc__Account__c,amc__Billable_Hourly_Rate__c,amc__Contact__c,amc__Cost_Hourly_Rate__c,General_Contractor__c,amc__Opportunity__c,OwnerId,amc__Program__c,amc__Project_Owner__c,amc__Tax_Label__c 
                                            FROM   amc__Project__c
                                            WHERE Id=:ProjectIds];
        return amcProject;
    }


    public static Map<Id, Id> getLookupRelator(List<Id> projectIds,Map<Id, Id> lookupRelator){
        List<NMT_Project__c> NMTProjects = [SELECT Id,Project__c 
                                            FROM NMT_Project__c 
                                            WHERE Project_Upsert_Id__c=:projectIds];
        for (NMT_Project__c oneNMTProject : NMTProjects) {
            if(lookupRelator.get(oneNMTProject.Project__c)==null){
                lookupRelator.put(oneNMTProject.Project__c,oneNMTProject.Id); 
            }
        }
        return lookupRelator;
    }

}