require 'pry'

module FooFoBerry
  class TrackerNotification
    attr_reader :story_url, 
                :message,
                :kind,
                :user_name,
                :story_id,
                :client 

    def initialize(payload, input_client = FooFoBerry::Client.new)
      json = JSON.parse(payload)
      @story_url = json["primary_resources"][0]["url"]
      @message = json["message"]
      @kind = json["kind"]
      @user_name = json["performed_by"]["name"]
      @story_id = json["primary_resources"][0]["id"]
      @client = input_client
    end

    def data
      {
        :story_url => story_url,
        :message   => message,
        :kind      => kind,
        :user_name => user_name,
        :story_id  => story_id
      }
    end

    def save!
      response = client.post("story_events", data)
      [response.status, JSON.parse(response.body)]
    end
  end
end
