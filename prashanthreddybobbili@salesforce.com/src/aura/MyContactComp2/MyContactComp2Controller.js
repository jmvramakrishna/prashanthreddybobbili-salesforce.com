({
    //Fetch from Apex class
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

    getContactStd : function(component, event, helper) {
       var cntId = event.getSource();
        // Fire the event to navigate to the contact record
        var sObjectEvent = $A.get("e.force:navigateToSObject");
        sObjectEvent.setParams({
            "recordId": cntId.get('v.value')
        })
        sObjectEvent.fire();
    },

    //Create here only (no apex)
	newContact : function(component, event, helper) {
       var cPhone = "9874";
       var action = $A.get("e.force:createRecord"); //Standard functionality
        action.setParams({
            'entityApiName' : 'Contact',
            'defaultFieldValues' : {
                'AccountId' : component.get("v.recordID"), 'Phone' : cPhone
            }
        });
       action.fire();
	},
    
    //Update from apex class
    editcontact:function(component, event, helper){
alert(component.getGlobalId());
console.log('Before');
console.log(component.getGlobalId());
console.log('After');
        var btn= event.getSource();  // Gets the properties of the button through event
        var rvf = component.find('recordViewForm');
        var ref = component.find('recordEditForm');
        if(btn.get('v.name') == 'edit'){
           $A.util.addClass(rvf,'formHide');
           $A.util.removeClass(ref,'formHide');
           btn.set('v.name','save');
           btn.set('v.label','Save Contacts');
        }
        else if(btn.get('v.name') == 'save'){
	        var toastEvent = $A.get('e.force:showToast');
            var saveContact = component.get("c.saveContacts");
            saveContact.setParams({contacts:component.get("v.contactList")});
            saveContact.setCallback(this,function(response){
           		var state = response.getState();
                var mp = response.getReturnValue();
            	if (state === "SUCCESS") {
                    $A.util.addClass(ref,'formHide');
                    $A.util.removeClass(rvf,'formHide');
                    btn.set('v.name','edit');
                    btn.set('v.label','Edit Contacts');
                    toastEvent.setParams({
                        'title' : mp.Status,
                        'type' : 'success',
                        'mode' : 'dismissable',
                        'message' : mp.Message
                    })
                    toastEvent.fire();
            	}else{
                    toastEvent.setParams({
                        'title' : mp.Status,
                        'type' : 'failure',
                        'mode' : 'dismissable',
                        'message' : mp.Message
                    })
                    toastEvent.fire();
                }
	        });
	        $A.enqueueAction(saveContact);
        }
    }, 
    
    //Update from here (No Apex) 
    editContactStd:function(component, event, helper){ 
       var cntId = event.getSource();
       var editRecordEvent = $A.get("e.force:editRecord"); // Standard Edit form
           editRecordEvent.setParams({
           "recordId": cntId.get('v.value')
       });
       editRecordEvent.fire();
    }
    
})