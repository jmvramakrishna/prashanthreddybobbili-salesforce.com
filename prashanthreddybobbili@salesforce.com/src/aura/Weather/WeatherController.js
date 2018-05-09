({
	getCurrentWeather : function(component, event, helper) {
		var city = component.find('city').get('v.value');
		helper.getCurrentWeather(component, helper,city);
	},
    
    doInit : function(cmp) {
console.log('Hi1');
        $A.createComponent(
            "lightning:button",
            {
                "aura:id": "findableAuraId",
                "label": "Press Me",
                "onclick": cmp.getReference("c.handlePress")
            },
            function(newButton, status, errorMessage){
console.log('Hi2');
                //Add the new button to the body array
                if (status === "SUCCESS") {
console.log('Hi3.1');
                    var body = cmp.get("v.body");
console.log('Hi3.2');
                    body.push(newButton);
console.log('Hi3.3');
                    cmp.set("v.body", body);
console.log('Hi3.4');
                }
                else if (status === "INCOMPLETE") {
console.log('Hi4');
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
console.log('Hi5');
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    },

    handlePress : function(cmp) {
        // Find the button by the aura:id value
        console.log("button: " + cmp.find("findableAuraId"));
        console.log("button pressed");
    }
})