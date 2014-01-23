require 'json'
require 'client'

module FooFoBerry
  class TrackerProject
    attr_reader :client

    def initialize(input_client = FooFoBerry::Client.new)
      @client = input_client
    end

    def create_with(params)
      project_id = params[:project_id]
      tracker_project_params = { :tracker_project =>
                                 params[:tracker_project] }
      url = "projects/#{project_id}/tracker_projects"
      binding.pry
      response = client.post(url, tracker_project_params.to_json)
      [response.status, JSON.parse(response.body)]
    end
  end
end
