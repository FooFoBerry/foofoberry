require './spec/spec_helper'
require './lib/foofoberry/repo'

describe FooFoBerry::Repo do
  it "exists" do
    expect(FooFoBerry::Repo).not_to be_nil
  end

  it "can create a new Project" do
    r = FooFoBerry::Repo.new(MockClient.new)
    params = {
      :repo => {
        :github_url => "foofoberry/costner_goes_postal",
        :project_id => "1"
      }
    }
    expected_json = File.read("./spec/fixtures/repo.json")
    expected_result = [201, JSON.parse(expected_json)]
    expect( r.create_with(params) ).to eq expected_result
  end

  class MockClient
    def post(path, body)
     body = File.read("./spec/fixtures/repo.json")
     status = 201
     MockResponse.new(status, body) # support.rb
    end
  end
end

