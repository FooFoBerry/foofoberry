require 'faraday'

module FooFoBerry
  class Client

    def connection
      @connection ||= new_connection
    end

    def get(path)
      connection.get(path + extension)
    end

    def post(path, body)
      connection.post do |req|
        req.url path
        req.headers['Content-Type'] = 'application/json'
        req.body = body
      end
    end

    private

    def new_connection
      Faraday.new(:url => connection_url)
    end

    def connection_url
      if Rails.env.production?
        'http://162.243.206.48/api/v1/'
      else
        'http://localhost:8080/api/v1/'
      end
    end

    def extension
      ".json"
    end
  end
end
