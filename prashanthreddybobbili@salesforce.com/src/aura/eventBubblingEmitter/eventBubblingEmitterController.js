({
	fireEvent : function(component, event, helper) {
		var cmpEvent = component.getEvent("bubblingEvent");
        cmpEvent.fire();
	},

	handleBubbling : function(component, event, helper) {
        console.log("p4 " + event.getName());
	}
})