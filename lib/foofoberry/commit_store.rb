module FooFoBerry
  class CommitStore
    attr_reader :client

    def initialize(input_client = FooFoBerry::Client.new)
      @client = input_client
    end

    def recent_from(project_id)
      response = client.get("projects/#{project_id}/commits")
      [response.status, JSON.parse(response.body)]
    end

  end
end
