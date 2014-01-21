require './spec/spec_helper'
require './lib/foofoberry/github_notification'

describe FooFoBerry::GitHubNotification do

  it "can parse payload data" do
    payload = File.read('./spec/fixtures/github_payload.json')
    p = FooFoBerry::GitHubNotification.new(payload, MockClient.new)
    desired_data = {
      :commit_id => "96dd704dc8770624e5da9082498c531edf0aef4a",
      :timestamp => "2014-01-13T18:45:47-08:00",
      :message => "add readme",
      :repository => {
        :id  => "15889813",
        :url => "https://github.com/thewatts/testing-callbacks"
      },
      :author => {
        :name     => "Nathaniel Watts",
        :email    => "reg@nathanielwatts.com",
        :username => "thewatts"
      }
    }
    expect( p.data ).to eq desired_data
  end

  xit "can send notifications to the API" do
    payload = File.read('./spec/fixtures/github_payload.json')
    p = FooFoBerry::GitHubNotification.new(payload, MockClient.new)
    expect( p.save! ).to eq # finish me
  end

  class MockClient
    def post(path, body)
     body = File.read("./spec/fixtures/project.json")
     status = 201
     MockResponse.new(status, body) # support.rb
    end

    def get(path)
      body = File.read("./spec/fixtures/get_projects.json")
      status = 200
      MockResponse.new(status, body)
    end
  end
end
