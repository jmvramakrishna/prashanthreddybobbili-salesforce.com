({
	updateMother : function(component, event, helper) {
       var cName = "Kiran Bedi";
        alert('Hi1');
       var action = $A.get("e.force:editRecord");
        alert('Hi2');
        action.setParams({
            'entityApiName' : 'mother__c',
            'defaultFieldValues' : {
                'Id' : component.get("v.recordID"),
                'Name' : cName
            }
        });
       alert('Hi3');
       action.fire();
	}
})