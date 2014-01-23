require './spec/spec_helper'
require './lib/foofoberry/tracker_store'

describe FooFoBerry::TrackerStore do

  it "retrieves tracker_events by project_id" do
    tracker_store = FooFoBerry::TrackerStore.new(MockTrackerClient.new)
    _, response = tracker_store.recent_from(1)
    expect(response.map { |event| event["story_id"]}).to eq([64358638])
  end

  class MockTrackerClient
    def get(path)
      body = File.read("./spec/fixtures/project_tracker_events.json")
      status = 200
      MockResponse.new(status, body)
    end
  end
end
