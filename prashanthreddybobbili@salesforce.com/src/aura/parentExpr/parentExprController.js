/* parentExprController.js */
({

    updateParentAttr: function(cmp) {
        cmp.set("v.parentAttr", "updated parent attribute");
        
        var profUrl = $A.get('$Resource.SLDSv2') + '/assets/images/avatar1.jpg';
        alert("Profile URL: " + profUrl);
    }
})