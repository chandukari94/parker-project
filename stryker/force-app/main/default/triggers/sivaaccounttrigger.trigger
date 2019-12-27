trigger sivaaccounttrigger on Account (After insert) {
   siva_practice.identicalopportunity(Trigger.new);
}