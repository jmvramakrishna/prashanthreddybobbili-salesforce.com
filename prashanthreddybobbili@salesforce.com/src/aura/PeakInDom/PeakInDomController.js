({ /* domLockerController.js */
    peekInDom : function(cmp, event, helper) {
        console.log("test0");
        console.log("cmp.getElements(): ", cmp.getElements());
        // access the DOM in c:domLocker
        console.log("test1");
        console.log("div1: ", cmp.find("div1").getElement());
        console.log("test2");
        console.log("button1: ", cmp.find("button1"));
        console.log("test3");
        console.log("button name: ", event.getSource().get("v.name"));

        // returns an error
        //console.log("button1 element: ", cmp.find("button1").getElement());
    }
})