({
	init : function(component, event, helper) {
		console.log(component.get("v.sObjectName"));
        var action = component.get("c.createProjectAndMilestonesLightning");
        action.setParams({"id": component.get("v.recordId")});
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(!response.getReturnValue().includes("Error"));
            
            if(component.isValid() && state == "SUCCESS" && !response.getReturnValue().includes("Error") && !response.getReturnValue().includes("Warning")){
                component.set("v.message", 'Done.!')
                component.set("v.messageErrorBoolean", false);
                /*var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": response.getReturnValue()//component.get("v.recordId")
                });
                navEvt.fire();*/
                //window.location.reload();
                $A.get('e.force:refreshView').fire();

            }else{
                component.set("v.message", response.getReturnValue());
                if(response.getReturnValue().includes("Warning"))
                	component.set("v.messageWarningBoolean", true);
                else
                    component.set("v.messageErrorBoolean", true);
                $A.get('e.force:refreshView').fire();
                /*var urlRedirect= $A.get("e.force:navigateToURL");
                urlRedirect.setParams({
                    "url": "https://riverside--dev.lightning.force.com/lightning/r/Lead/0011k00000cUacNAAS/view" //+ component.get("v.record").id
                });
        		urlRedirect.fire();*/
            }
        });
        $A.enqueueAction(action);
	}
})