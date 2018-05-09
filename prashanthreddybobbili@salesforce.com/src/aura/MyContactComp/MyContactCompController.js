({
	getContactsList : function(component, event, helper) {
        var action = component.get("c.getContacts") ;
        action.setParams({
            accountIds : component.get("v.recordId")
        });
        action.setCallback(this,function(response){
           	var state = response.getState();
            if (state === "SUCCESS") {
        	    component.set("v.contactList",response.getReturnValue());
            }else{alert("Error occurred");}
      });
       $A.enqueueAction(action);
	},
    
	newContact : function(component, event, helper) {
       var cPhone = "9874";
       var action = $A.get("e.force:createRecord");
        action.setParams({
            'entityApiName' : 'Contact',
            'defaultFieldValues' : {
                'AccountId' : component.get("v.recordID"), 'Phone' : cPhone
            }
        });
       action.fire();
	}
})