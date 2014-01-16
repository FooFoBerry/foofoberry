require './spec/spec_helper'
require './lib/foofoberry/project_store'

describe FooFoBerry::ProjectStore do
  it "exists" do
    expect(FooFoBerry::ProjectStore).not_to be_nil
  end

  it "can retrieve projects by user" do
    p = FooFoBerry::ProjectStore.new(MockClient.new)
    expect( p.projects_for(1)[1].map { |p| p["name"] }).to eq (["FooFoBerry Project"])
  end

  class MockClient
    def post(path, body)
     body = File.read("./spec/fixtures/project.json")
     status = 201
     MockResponse.new(status, body) # support.rb
    end
  end
end

