require 'json'
require_relative 'client'

module FooFoBerry
  class Repo
    attr_reader :client

    def initialize(input_client = FooFoBerry::Client.new)
      @client = input_client
    end

    def create_with(params)
      url  = "projects/#{params[:repo][:project_id]}/repos"
      body = { :repo => { :github_url => params[:repo][:github_url] } }

      response = client.post(url, body.to_json)
      [response.status, JSON.parse(response.body)]
    end
  end
end
