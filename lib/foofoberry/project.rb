require 'json'
require 'faraday'

module FooFoBerry
  class Project
    def self.create_with(params)
      url = "http://localhost:3001"

      ### ASK SOMEONE: HOW WE MAKE THIS WORK BETTER
      conn = Faraday.new(:url => url) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end

      response = conn.post do |req|
        req.url '/projects'
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end

      [response.status, response.body]
    end
  end
end
