({    
    sendMessage : function(component, event, helper) {
console.log('hi1');
        var msg = {
            name: "General",
            value: component.get("v.messageToSend")
        };
        component.find("ReactApp").message(msg);
console.log('hi2');
    },
    
    handleMessage: function(component, message, helper) {
console.log('hi3');
        var payload = message.getParams().payload;
        var name = payload.name;
        if (name === "General") {
console.log('hi4');
            var value = payload.value;
            component.set("v.messageReceived", value);
        }
        else if (name === "Foo") {
console.log('hi5');
            // A different response
        }
    },
    
    handleError: function(component, error, helper) {
console.log('hi6');
console.log(error);
        var e = error;
    }
})