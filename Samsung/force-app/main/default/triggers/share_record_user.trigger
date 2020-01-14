trigger share_record_user on Account (after  insert) {
    Trigger_share.sharerecord(Trigger.new);
}