({
    save: function (component, event, helper) {
        helper.save(component);
    },
    waiting: function (component, event, helper) {
        component.set("v.uploading", true);
    },
    doneWaiting: function (component, event, helper) {
        component.set("v.uploading", false);
    }
})