trigger before_insert_data on Account (before insert) {
    before_insert.data(trigger.new);
}