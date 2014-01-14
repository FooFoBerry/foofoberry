require './lib/foofoberry/client'

module FooFoBerry
  class GitHubNotification
    attr_reader :payload, :commit_id, :timestamp, :author_name, :author_email,
                :author_username, :repository_id, :repository_url, :client

    def initialize(json_payload, input_client = FooFoBerry::Client.new)
      @client          = input_client
      @payload         = JSON.parse(json_payload)
      @commit_id       = @payload["head_commit"]["id"]
      @timestamp       = @payload["head_commit"]["timestamp"]
      @author_name     = @payload["head_commit"]["author"]["name"]
      @author_email    = @payload["head_commit"]["author"]["email"]
      @author_username = @payload["head_commit"]["author"]["username"]
      @repository_id   = @payload["repository"]["id"]
      @repository_url  = @payload["repository"]["url"]
    end

    def save!
      client.post do |req|
        req.url "/commits"
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def data
      {
        :commit_id => commit_id,
        :timestamp => timestamp,
        :repository => {
          :id  => repository_id,
          :url => repository_url
        },
        :author => {
          :name     => author_name,
          :email    => author_email,
          :username => author_username
        }
      }.to_json
    end
  end
end
