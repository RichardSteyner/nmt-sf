trigger LeadTrigger on Lead (before insert, before update, after insert, after update) {
     if(trigger.isBefore){

     }else {
        if(trigger.isInsert || trigger.isUpdate){
            if(ApexUtil.LeadTrigger1 == true){
                List<Lead> LeadsUpdate = new List<Lead>();
                List<Lead> JustLeads;
                List<Id>  LeadsIds = new List<Id>();   

                for(Lead oneLead : trigger.new){ LeadsIds.add(oneLead.Id); }
                 JustLeads = [SELECT Id,Monthly_ROI_initial_Estimate__c,Monthly_ROI_Final_Estimate__c,Annualized_ROI_Initial_Estimate__c,Annualized_ROI_Final_Estimate__c,Estimated_Profit_Initial_Estimate__c,Money_Needed_Initial_Estimate__c,
                                     Initial_Total_in_Days__c,Money_Needed_Final_Estimate__c,Final_Total_in_Days__c,Estimated_Profit_Final_Estimate__c,
                                     Construction_End_Initial_Estimate__c, Construction_Start_Initial_Estimate__c, Weeks_for_Construction_Initial__c,
                              		 Construction_End_Final_Estimate__c, Construction_Start_Final_Estimate__c, Weeks_for_Construction_Final__c,
                              		 Cleaning_Initial_Estimate__c, Cleaning_Final_Estimate__c,
                              		 Staging_Initial_Estimate__c, Staging_Final_Estimate__c,
                              		 Photography_Initial_Estimate__c, Photography_Final_Estimate__c,
                              		 Inspections_Initial_Estimate__c, Inspections_Final_Estimate__c,
                              		 On_the_Market_Initial_Estimate__c, On_the_Market_Final_Estimate__c,
                              		 Accept_Offer_Initial_Estimate__c, Accept_Offer_Final_Estimate__c,
                                     Close_on_Resale_Initial_Estimate__c, Close_on_Resale_Final_Estimate__c
                             FROM Lead 
                             WHERE Id=:LeadsIds];
                
                Date auxDate;
                Integer auxDays;
                String auxDayOfWeek;
                
                for(Lead oneLead_2 : JustLeads){
                    Lead updateOneLead = new Lead(); 
                    updateOneLead.Id = oneLead_2.Id;
                    updateOneLead.Monthly_ROI_initial_Estimate__c = null;
                    updateOneLead.Monthly_ROI_Final_Estimate__c = null;
                    updateOneLead.Annualized_ROI_Initial_Estimate__c = null;
                    updateOneLead.Annualized_ROI_Final_Estimate__c = null;
                    
                    updateOneLead.Construction_End_Initial_Estimate__c = null;
                    updateOneLead.Construction_End_Final_Estimate__c = null;
                    updateOneLead.Cleaning_Initial_Estimate__c = null;
                    updateOneLead.Cleaning_Final_Estimate__c = null;
                    updateOneLead.Staging_Initial_Estimate__c = null;
                    updateOneLead.Staging_Final_Estimate__c = null;
                    updateOneLead.Photography_Initial_Estimate__c = null;
                    updateOneLead.Photography_Final_Estimate__c = null;
                    updateOneLead.Inspections_Initial_Estimate__c = null;
                    updateOneLead.Inspections_Final_Estimate__c = null;
                    updateOneLead.On_the_Market_Initial_Estimate__c = null;
                    updateOneLead.On_the_Market_Final_Estimate__c = null;
                    updateOneLead.Accept_Offer_Initial_Estimate__c = null;
                    updateOneLead.Accept_Offer_Final_Estimate__c = null;
                    updateOneLead.Close_on_Resale_Initial_Estimate__c = null;
                    updateOneLead.Close_on_Resale_Final_Estimate__c = null;
                    
                    if(oneLead_2.Estimated_Profit_Initial_Estimate__c !=null && oneLead_2.Initial_Total_in_Days__c !=null && oneLead_2.Money_Needed_Initial_Estimate__c !=null ){           
		                updateOneLead.Monthly_ROI_initial_Estimate__c =  ((((oneLead_2.Estimated_Profit_Initial_Estimate__c / oneLead_2.Initial_Total_in_Days__c)*365)/ oneLead_2.Money_Needed_Initial_Estimate__c)/12);
                    }
                    if(oneLead_2.Estimated_Profit_Final_Estimate__c != null && oneLead_2.Final_Total_in_Days__c != null && oneLead_2.Money_Needed_Final_Estimate__c != null){
                        updateOneLead.Monthly_ROI_Final_Estimate__c = ((((oneLead_2.Estimated_Profit_Final_Estimate__c / oneLead_2.Final_Total_in_Days__c	)*365)/ oneLead_2.Money_Needed_Final_Estimate__c)/12);
                    }
                    if(oneLead_2.Estimated_Profit_Initial_Estimate__c != null && oneLead_2.Initial_Total_in_Days__c != null && oneLead_2.Money_Needed_Initial_Estimate__c != null){
                        updateOneLead.Annualized_ROI_Initial_Estimate__c = 	((((oneLead_2.Estimated_Profit_Initial_Estimate__c / oneLead_2.Initial_Total_in_Days__c)*365)/ oneLead_2.Money_Needed_Initial_Estimate__c));
                    }
                    if (oneLead_2.Estimated_Profit_Final_Estimate__c != null &&  oneLead_2.Final_Total_in_Days__c != null && oneLead_2.Money_Needed_Final_Estimate__c != null) {
                        updateOneLead.Annualized_ROI_Final_Estimate__c = ((((oneLead_2.Estimated_Profit_Final_Estimate__c / oneLead_2.Final_Total_in_Days__c)*365)/ oneLead_2.Money_Needed_Final_Estimate__c));
                    }
                    
                    if(oneLead_2.Construction_Start_Initial_Estimate__c != null) {
                        auxDays = (oneLead_2.Weeks_for_Construction_Initial__c!=null ? Integer.valueOf(oneLead_2.Weeks_for_Construction_Initial__c) : 0)*7;
                        auxDate = oneLead_2.Construction_Start_Initial_Estimate__c.addDays(auxDays);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Construction_End_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Construction_End_Initial_Estimate__c = auxDate;
                    }
                    if(oneLead_2.Construction_Start_Final_Estimate__c != null) {
                        auxDays = (oneLead_2.Weeks_for_Construction_Final__c!=null ? Integer.valueOf(oneLead_2.Weeks_for_Construction_Final__c) : 0)*7;
                        auxDate = oneLead_2.Construction_Start_Final_Estimate__c.addDays(auxDays);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Construction_End_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Construction_End_Final_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Initial_Estimate__c;
                        auxDate = auxDate.addDays(1);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday')){
                        	updateOneLead.Cleaning_Initial_Estimate__c = auxDate.addDays(1);
                        	updateOneLead.Cleaning_Final_Estimate__c = auxDate.addDays(1);
                        }
                        else{
                            updateOneLead.Cleaning_Initial_Estimate__c = auxDate;
                            updateOneLead.Cleaning_Final_Estimate__c = auxDate;
                        }
                    }
                    if(updateOneLead.Construction_End_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Initial_Estimate__c;
                        auxDate = auxDate.addDays(2);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Staging_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Staging_Initial_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(2);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Staging_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Staging_Final_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Initial_Estimate__c;
                        auxDate = auxDate.addDays(3);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Photography_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Photography_Initial_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(3);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Photography_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Photography_Final_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Initial_Estimate__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Inspections_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Inspections_Initial_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Inspections_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Inspections_Final_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Initial_Estimate__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.On_the_Market_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.On_the_Market_Initial_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneLead.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.On_the_Market_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.On_the_Market_Final_Estimate__c = auxDate;
                    }
                    if(updateOneLead.On_the_Market_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.On_the_Market_Initial_Estimate__c;
                        auxDate = auxDate.addDays(14);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Accept_Offer_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Accept_Offer_Initial_Estimate__c = auxDate;
                    }
                    if(updateOneLead.On_the_Market_Final_Estimate__c != null) {
                        auxDate = updateOneLead.On_the_Market_Final_Estimate__c;
                        auxDate = auxDate.addDays(14);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Accept_Offer_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Accept_Offer_Final_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Accept_Offer_Initial_Estimate__c != null) {
                        auxDate = updateOneLead.Accept_Offer_Initial_Estimate__c;
                        auxDate = auxDate.addDays(30);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Close_on_Resale_Initial_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Close_on_Resale_Initial_Estimate__c = auxDate;
                    }
                    if(updateOneLead.Accept_Offer_Final_Estimate__c != null) {
                        auxDate = updateOneLead.Accept_Offer_Final_Estimate__c;
                        auxDate = auxDate.addDays(30);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneLead.Close_on_Resale_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneLead.Close_on_Resale_Final_Estimate__c = auxDate;
                    }
                    LeadsUpdate.add(updateOneLead);
                }

                if(LeadsUpdate.size()>0){
                    ApexUtil.LeadTrigger1=false;
                    update LeadsUpdate;
                }
            }
        }
     }
}