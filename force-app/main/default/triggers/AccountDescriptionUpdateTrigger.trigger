/**
* @name: AccountDescriptionUpdateTrigger 
* {AUTHOR_PLACEHOLDER}
*/
trigger AccountDescriptionUpdateTrigger on Account (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        AccountDescriptionUpdate.updateDescription(Trigger.new);
    }
}