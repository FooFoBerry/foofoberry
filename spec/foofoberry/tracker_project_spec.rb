require './spec/spec_helper'
require './lib/foofoberry/tracker_project'
require 'pry'

describe FooFoBerry::TrackerProject do
  it "exists" do
    expect(FooFoBerry::TrackerProject).not_to be_nil
  end

  it "can create a new tracker project" do
    response = double
    body = (File.read('./spec/fixtures/tracker_project.json'))
    FooFoBerry::TrackerProject.any_instance.stub(:create_with).and_return([201, JSON.parse(body)])

    tracker_project_client = FooFoBerry::TrackerProject.new
    params = {
      project_id: 1,
      tracker_project: {
         pt_tracker_id: 1
      }
    }

    expected_json = File.read("./spec/fixtures/tracker_project.json")
    expected_result = [201, JSON.parse(expected_json)]
    expect( tracker_project_client.create_with(params) ).to eq expected_result
  end

end
