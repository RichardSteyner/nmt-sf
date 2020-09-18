trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
	if(trigger.isBefore){

    }else {
    	if(trigger.isInsert || trigger.isUpdate){
        	if(ApexUtil.OpportunityTrigger1 == true){
				System.debug('Hi');
            	List<Opportunity> opportunitiesUpdate = new List<Opportunity>();
            	List<Opportunity> JustOpportunities;
                List<Id>  opportunitiesIds = new List<Id>();
                Set<Id>  oppsClosed = new Set<Id>();
                
            	for(Opportunity opp : trigger.new){ 
                    opportunitiesIds.add(opp.Id); 
                    if(trigger.isInsert && opp.StageName == 'Closed Won') oppsClosed.add(opp.id);
                	if(trigger.isUpdate && opp.StageName == 'Closed Won' && opp.StageName!=Trigger.OldMap.get(opp.Id).StageName) oppsClosed.add(opp.id);
                }
                
                JustOpportunities = [SELECT Id,Monthly_ROI_initial_Estimate__c,Monthly_ROI_Final_Estimate__c,Annualized_ROI_Initial_Estimate__c,
                                            Annualized_ROI_Final_Estimate__c,Estimated_Profit_Initial_Estimate__c,Initial_Total_in_Days__c,Money_Needed_Initial_Estimate__c,Estimated_Profit_Final_Estimate__c,Final_Total_in_Days__c,Money_Needed_Final_Estimate__c,
                                     		Equity_Loan_2_Remaining__c, Equity_Loan_Final_Estimate_2__c, Mortgage_Interest_Remaining__c, Loan_Points_Remaining__c, Loan_Processing_Fee_Remaining__c,
                                     		Holdback_Fee_Remaining__c, Equity_Loan_Remaining__c, Escrow_Fees_Remaining__c, Staging_Remaining__c, Property_Inspections_Remaining__c,
                                     		Property_Taxes_Remaining__c, Utilities_Remaining__c, Insurance_Remaining__c, Photography_Marketing_Remaining__c, Buyer_Home_Warranty_Remaining__c,
                                     		City_Transfer_Taxes_Remaining__c, County_Transfer_Taxes_Remaining__c, X10_Contingency_Remaining__c, Finder_s_Fee_Remaining__c, Acquisitions_Credit_Remaining__c,
                                     		Rehab_Cost_Difference__c, Rehab_Cost_Estimate__c,
                                     		Soft_Cost__c, Commission_Estimate__c, Acquisition_Cost_Estimate__c
                                     
                                     		,Construction_End_Actual__c, Construction_Start_Actual__c, Weeks_for_Construction_Initial__c,
                                            Construction_End_Final_Estimate__c, Construction_Start_Final_Estimate__c, Weeks_for_Construction_Final__c,
                                            Cleaning_Actual__c, Cleaning_Final_Estimate__c,
                                            Staging_Actual__c, Staging_Final_Estimate__c,
                                            Photography_Actual__c, Photography_Final_Estimate__c,
                                            Inspections_Actual__c, Inspections_Final_Estimate__c,
                                            On_the_Market_Actual__c, On_the_Market_Final_Estimate__c,
                                            Accept_Offer_Actual__c, Accept_Offer_Final_Estimate__c,
                                            Close_on_Resale_Actual__c, Close_on_Resale_Final_Estimate__c
                                    FROM Opportunity 
                                    WHERE Id=:opportunitiesIds];
                
                Date auxDate;
                Integer auxDays;
                String auxDayOfWeek;
                
              	for(Opportunity oneOpptunity : JustOpportunities){
                	Opportunity updateOneopp = new Opportunity(); 
                  	updateOneopp.Id = oneOpptunity.Id;
                   	updateOneopp.Monthly_ROI_initial_Estimate__c = null;
                   	updateOneopp.Monthly_ROI_Final_Estimate__c = null;
                  	updateOneopp.Annualized_ROI_Initial_Estimate__c = null;
                    updateOneopp.Annualized_ROI_Final_Estimate__c = null;
                    updateOneopp.Equity_Loan_2__c = null;
                    updateOneopp.Total_Soft_Cost_Remaining__c = null;
                    updateOneopp.Rehab_Cost__c = null;
                    updateOneopp.Total_Cost_Estimate__c = null;
                    
                    
                    updateOneopp.Construction_End_Actual__c = null;
                    updateOneopp.Construction_End_Final_Estimate__c = null;
                    updateOneopp.Cleaning_Actual__c = null;
                    updateOneopp.Cleaning_Final_Estimate__c = null;
                    updateOneopp.Staging_Actual__c = null;
                    updateOneopp.Staging_Final_Estimate__c = null;
                    updateOneopp.Photography_Actual__c = null;
                    updateOneopp.Photography_Final_Estimate__c = null;
                    updateOneopp.Inspections_Actual__c = null;
                    updateOneopp.Inspections_Final_Estimate__c = null;
                    updateOneopp.On_the_Market_Actual__c = null;
                    updateOneopp.On_the_Market_Final_Estimate__c = null;
                    updateOneopp.Accept_Offer_Actual__c = null;
                    updateOneopp.Accept_Offer_Final_Estimate__c = null;
                    updateOneopp.Close_on_Resale_Actual__c = null;
                    /*updateOneopp.Close_on_Resale_Final_Estimate__c = null;*/
                     
                    
                   	if(oneOpptunity.Estimated_Profit_Initial_Estimate__c!= null && oneOpptunity.Initial_Total_in_Days__c != null &&  oneOpptunity.Money_Needed_Initial_Estimate__c != null){ 
                    	updateOneopp.Monthly_ROI_initial_Estimate__c = ((((oneOpptunity.Estimated_Profit_Initial_Estimate__c/oneOpptunity.Initial_Total_in_Days__c)*365)/oneOpptunity.Money_Needed_Initial_Estimate__c)/12);
                   	}
                   	if(oneOpptunity.Estimated_Profit_Final_Estimate__c != null && oneOpptunity.Final_Total_in_Days__c != null && oneOpptunity.Money_Needed_Final_Estimate__c != null){
                     	updateOneopp.Monthly_ROI_Final_Estimate__c = ((((oneOpptunity.Estimated_Profit_Final_Estimate__c / oneOpptunity.Final_Total_in_Days__c)*365)/ oneOpptunity.Money_Needed_Final_Estimate__c)/12);
                   	}
                    if(oneOpptunity.Estimated_Profit_Initial_Estimate__c!=null && oneOpptunity.Initial_Total_in_Days__c!=null && oneOpptunity.Money_Needed_Initial_Estimate__c!=null){
                     	updateOneopp.Annualized_ROI_Initial_Estimate__c = (((oneOpptunity.Estimated_Profit_Initial_Estimate__c/oneOpptunity.Initial_Total_in_Days__c)*365)/ oneOpptunity.Money_Needed_Initial_Estimate__c);
                   	}
                    if(oneOpptunity.Estimated_Profit_Final_Estimate__c !=null && oneOpptunity.Final_Total_in_Days__c !=null && oneOpptunity.Money_Needed_Final_Estimate__c !=null){  
                    	updateOneopp.Annualized_ROI_Final_Estimate__c = (((oneOpptunity.Estimated_Profit_Final_Estimate__c / oneOpptunity.Final_Total_in_Days__c)*365)/ oneOpptunity.Money_Needed_Final_Estimate__c);
                   	}
                    
                    if(oneOpptunity.Equity_Loan_2_Remaining__c!=null && oneOpptunity.Equity_Loan_Final_Estimate_2__c!=null && oneOpptunity.Equity_Loan_Final_Estimate_2__c!=0){
                      	updateOneopp.Equity_Loan_2__c = oneOpptunity.Equity_Loan_2_Remaining__c / oneOpptunity.Equity_Loan_Final_Estimate_2__c;
                    }
                    
                    updateOneopp.Total_Soft_Cost_Remaining__c = ApexUtil.getField(oneOpptunity.Mortgage_Interest_Remaining__c) + ApexUtil.getField(oneOpptunity.Loan_Points_Remaining__c) + ApexUtil.getField(oneOpptunity.Loan_Processing_Fee_Remaining__c) + 
                            	ApexUtil.getField(oneOpptunity.Holdback_Fee_Remaining__c) + ApexUtil.getField(oneOpptunity.Equity_Loan_Remaining__c) + ApexUtil.getField(oneOpptunity.Equity_Loan_2_Remaining__c) + ApexUtil.getField(oneOpptunity.Escrow_Fees_Remaining__c) + 
                            	ApexUtil.getField(oneOpptunity.Staging_Remaining__c) + ApexUtil.getField(oneOpptunity.Property_Inspections_Remaining__c) + ApexUtil.getField(oneOpptunity.Property_Taxes_Remaining__c) + ApexUtil.getField(oneOpptunity.Utilities_Remaining__c) + 
                            	ApexUtil.getField(oneOpptunity.Insurance_Remaining__c) + ApexUtil.getField(oneOpptunity.Photography_Marketing_Remaining__c) + ApexUtil.getField(oneOpptunity.Buyer_Home_Warranty_Remaining__c) + ApexUtil.getField(oneOpptunity.City_Transfer_Taxes_Remaining__c) + 
                            	ApexUtil.getField(oneOpptunity.County_Transfer_Taxes_Remaining__c) + ApexUtil.getField(oneOpptunity.X10_Contingency_Remaining__c) + ApexUtil.getField(oneOpptunity.Finder_s_Fee_Remaining__c) + ApexUtil.getField(oneOpptunity.Acquisitions_Credit_Remaining__c);
                    
                    if(oneOpptunity.Rehab_Cost_Difference__c!=null && oneOpptunity.Rehab_Cost_Estimate__c!=null && oneOpptunity.Rehab_Cost_Estimate__c!=0){
                  		updateOneopp.Rehab_Cost__c = oneOpptunity.Rehab_Cost_Difference__c / oneOpptunity.Rehab_Cost_Estimate__c;
                    }
                    
                    updateOneopp.Total_Cost_Estimate__c = ApexUtil.getField(oneOpptunity.Rehab_Cost_Estimate__c) + ApexUtil.getField(oneOpptunity.Soft_Cost__c) + 
                        				ApexUtil.getField(oneOpptunity.Commission_Estimate__c) + ApexUtil.getField(oneOpptunity.Acquisition_Cost_Estimate__c);

                    
                    
					if(oneOpptunity.Construction_Start_Actual__c != null) {
                        auxDays = (oneOpptunity.Weeks_for_Construction_Initial__c!=null ? Integer.valueOf(oneOpptunity.Weeks_for_Construction_Initial__c) : 0)*7;
                        auxDate = oneOpptunity.Construction_Start_Actual__c.addDays(auxDays);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Construction_End_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.Construction_End_Actual__c = auxDate;
                    }
                    if(oneOpptunity.Construction_Start_Final_Estimate__c != null) {
                        auxDays = (oneOpptunity.Weeks_for_Construction_Final__c!=null ? Integer.valueOf(oneOpptunity.Weeks_for_Construction_Final__c) : 0)*7;
                        auxDate = oneOpptunity.Construction_Start_Final_Estimate__c.addDays(auxDays);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Construction_End_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.Construction_End_Final_Estimate__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Actual__c != null) {
                        auxDate = updateOneopp.Construction_End_Actual__c;
                        auxDate = auxDate.addDays(1);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday')){
                        	updateOneopp.Cleaning_Actual__c = auxDate.addDays(1);
                        	updateOneopp.Cleaning_Final_Estimate__c = auxDate.addDays(1);
                        }
                        else{
                            updateOneopp.Cleaning_Actual__c = auxDate;
                            updateOneopp.Cleaning_Final_Estimate__c = auxDate;
                        }
                    }
                    if(updateOneopp.Construction_End_Actual__c != null) {
                        auxDate = updateOneopp.Construction_End_Actual__c;
                        auxDate = auxDate.addDays(2);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Staging_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.Staging_Actual__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneopp.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(2);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Staging_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.Staging_Final_Estimate__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Actual__c != null) {
                        auxDate = updateOneopp.Construction_End_Actual__c;
                        auxDate = auxDate.addDays(3);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Photography_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.Photography_Actual__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneopp.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(3);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Photography_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.Photography_Final_Estimate__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Actual__c != null) {
                        auxDate = updateOneopp.Construction_End_Actual__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Inspections_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.Inspections_Actual__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneopp.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Inspections_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.Inspections_Final_Estimate__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Actual__c != null) {
                        auxDate = updateOneopp.Construction_End_Actual__c;
                        auxDate = auxDate.addDays(4);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.On_the_Market_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.On_the_Market_Actual__c = auxDate;
                    }
                    if(updateOneopp.Construction_End_Final_Estimate__c != null) {
                        auxDate = updateOneopp.Construction_End_Final_Estimate__c;
                        auxDate = auxDate.addDays(5);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.On_the_Market_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.On_the_Market_Final_Estimate__c = auxDate;
                    }
                    if(updateOneopp.On_the_Market_Actual__c != null) {
                        auxDate = updateOneopp.On_the_Market_Actual__c;
                        auxDate = auxDate.addDays(14);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Accept_Offer_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.Accept_Offer_Actual__c = auxDate;
                    }
                    if(updateOneopp.On_the_Market_Final_Estimate__c != null) {
                        auxDate = updateOneopp.On_the_Market_Final_Estimate__c;
                        auxDate = auxDate.addDays(14);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Accept_Offer_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.Accept_Offer_Final_Estimate__c = auxDate;
                    }
                    if(updateOneopp.Accept_Offer_Actual__c != null) {
                        auxDate = updateOneopp.Accept_Offer_Actual__c;
                        auxDate = auxDate.addDays(30);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Close_on_Resale_Actual__c = auxDate.addDays(1);
                        else
                            updateOneopp.Close_on_Resale_Actual__c = auxDate;
                    }
                    if(updateOneopp.Accept_Offer_Final_Estimate__c != null) {
                        auxDate = updateOneopp.Accept_Offer_Final_Estimate__c;
                        auxDate = auxDate.addDays(30);
                        auxDayOfWeek = DateTime.newInstance(auxDate, Time.newInstance(0, 0, 0, 0)).format('EEEE');
                        if(auxDayOfWeek.containsIgnoreCase('Sunday'))
                        	updateOneopp.Close_on_Resale_Final_Estimate__c = auxDate.addDays(1);
                        else
                            updateOneopp.Close_on_Resale_Final_Estimate__c = auxDate;
                    }
					
                   	opportunitiesUpdate.add(updateOneopp);
             	}
                if(opportunitiesUpdate.size()>0){
               		ApexUtil.OpportunityTrigger1=false;
                    update opportunitiesUpdate;
                }
                //if(oppsClosed.size()>0) ApexCreation.createProjectAndMilestones(oppsClosed);
            }    

        }
    }
}