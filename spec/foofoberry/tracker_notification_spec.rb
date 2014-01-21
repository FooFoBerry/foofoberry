require './spec/spec_helper'
require './lib/foofoberry/tracker_notification'

describe FooFoBerry::TrackerNotification do

  describe "Data Attributes" do 

    before :each do 
      payload = File.read('./spec/fixtures/tracker_action_payload.json')
      @notification = FooFoBerry::TrackerNotification.new(payload)
    end 


    it "digests JSON payload" do 
      expect(@notification.story_url).to eq "http://www.pivotaltracker.com/story/show/64265964"
      expect(@notification.message).to eq "Tyler Long added this feature"
      expect(@notification.kind).to eq "story_create_activity"
      expect(@notification.user_name).to eq "Tyler Long"
      expect(@notification.story_id).to eq 64265964

    end

    it "has the correct data attribute" do 
      expected_data = {
                       :story_url => "http://www.pivotaltracker.com/story/show/64265964",
                       :message   => "Tyler Long added this feature",
                       :kind      => "story_create_activity",
                       :user_name => "Tyler Long",
                       :story_id  => 64265964
                      }
      expect(@notification.data).to eq(expected_data)
    end
  end

  describe "API Interaction" do

    it "post to the api with the correct attributes" do
      payload = File.read('./spec/fixtures/tracker_action_payload.json')

      client = double
      FooFoBerry::TrackerNotification.any_instance.stub(:client).and_return(client)
      FooFoBerry::TrackerNotification.any_instance.stub(:save!).and_return [200, "foo"]   

      status, response = FooFoBerry::TrackerNotification.new(payload).save!
      expect(status).to eq 200
    end 
   end
end
