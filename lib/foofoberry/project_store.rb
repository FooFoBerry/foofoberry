require 'json'
require_relative 'client'

module FooFoBerry
  class ProjectStore
    attr_reader :client

    def initialize(input_client = FooFoBerry::Client.new)
      @client = input_client
    end

    def projects_for(user_id)
      response = client.get("projects?user_id=#{user_id}")
      [response.status, JSON.parse(response.body)]
    end
  end
end
