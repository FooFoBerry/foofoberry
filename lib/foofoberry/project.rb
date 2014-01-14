require 'json'
require_relative 'client'

module FooFoBerry
  class Project
    attr_reader :client

    def initialize(input_client = FooFoBerry::Client.new)
      @client = input_client
    end

    def create_with(params)
      response = client.post("projects", params.to_json)
      [response.status, JSON.parse(response.body)]
    end
  end
end
