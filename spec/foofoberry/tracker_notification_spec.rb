require './spec/spec_helper'
require './lib/foofoberry/tracker_notification'

describe FooFoBerry::TrackerNotification do

  it "digests JSON payload" do 
    payload = File.read('./spec/fixtures/tracker_action_payload.json')
    notification = FooFoBerry::TrackerNotification.new(payload)

    expect(notification.story_url).to eq "http://www.pivotaltracker.com/story/show/64265964"
    expect(notification.message).to eq "Tyler Long added this feature"
    expect(notification.kind).to eq "story_create_activity"
    expect(notification.user_name).to eq "Tyler Long"
    expect(notification.story_id).to eq 64265964

  end


end
