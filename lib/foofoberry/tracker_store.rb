require 'json'
require_relative 'client'

module FooFoBerry
  class TrackerStore
    attr_reader :client

    def initialize(input_client)
      @client = input_client
    end

    def recent_from(project_id)
      response = client.get("projects/#{project_id}/tracker_events")
      [response.status, JSON.parse(response.body)]
    end

  end
end
