trigger interview1 on Account (After insert) {
    interview1.accinsert(trigger.new);
}