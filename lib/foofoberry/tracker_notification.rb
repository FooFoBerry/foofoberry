require 'pry'

module FooFoBerry
  class TrackerNotification
    attr_reader :story_url, 
                :message,
                :kind,
                :user_name,
                :story_id 

    def initialize(payload)
      json = JSON.parse(payload)
      @story_url = json["primary_resources"][0]["url"]
      @message = json["message"]
      @kind = json["kind"]
      @user_name = json["performed_by"]["name"]
      @story_id = json["primary_resources"][0]["id"]
    end
  end
end
