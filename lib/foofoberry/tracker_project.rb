require 'json'
require_relative 'client'

module FooFoBerry
  class TrackerProject
    attr_reader :client

    def initialize(input_client = FooFoBerry::Client.new)
      @client = input_client
    end

    def create_with(params)
      response = client.post("tracker_projects", params.to_json)
      [response.status, JSON.parse(response.body)]
    end
  end
end
