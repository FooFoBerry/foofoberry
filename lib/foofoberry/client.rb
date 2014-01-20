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
      if production_env?
        'http://162.243.206.48/api/v1/'
      else
        'http://localhost:8080/api/v1/'
      end
    end

    def extension
      ".json"
    end

    def production_env?
      production_rails? || production_sinatra?
    end

    def production_rails?
      defined?(Rails) && Rails.env.production?
    end

    def production_sinatra?
      defined?(Sinatra) && Sinata::Base.production?
    end

  end
end
