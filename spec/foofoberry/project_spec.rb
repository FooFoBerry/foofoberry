require './spec/spec_helper'
require './lib/foofoberry/project'

describe FooFoBerry::Project do
  it "exists" do
    expect(FooFoBerry::Project).not_to be_nil
  end

  it "can create a new Project" do
    p = FooFoBerry::Project.new(MockClient.new)
    params = {
      :project => {
        :user_id => 1,
        :name => "KC"
      }
    }
    expected_json = File.read("./spec/fixtures/project.json")
    expected_result = [201, JSON.parse(expected_json)] 
    expect( p.create_with(params) ).to eq expected_result
  end

  class MockClient
    def post(path, body)
     body = File.read("./spec/fixtures/project.json")
     status = 201
     MockResponse.new(status, body) # support.rb
    end
  end
end

