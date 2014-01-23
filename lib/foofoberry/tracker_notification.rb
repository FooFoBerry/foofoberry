require 'pry'

module FooFoBerry
  class TrackerNotification
    attr_reader :story_url,
                :message,
                :kind,
                :user_name,
                :story_id,
                :change_type,
                :story_title,
                :user_initials,
                :pt_project_id,
                :client

    def initialize(payload, input_client = FooFoBerry::Client.new)
      json           = JSON.parse(payload)
      @story_url     = json["primary_resources"][0]["url"]
      @message       = json["message"]
      @kind          = json["kind"]
      @user_name     = json["performed_by"]["name"]
      @story_id      = json["primary_resources"][0]["id"]
      @change_type   = json["changes"][0]["change_type"]
      @story_title   = json["primary_resources"][0]["name"]
      @user_initials = json["performed_by"]["initials"]
      @pt_project_id = json["project"]["id"]
      @client        = input_client
    end

    def data
      { :tracker_event =>
        {
          :story_url     => story_url,
          :message       => message,
          :kind          => kind,
          :user_name     => user_name,
          :story_id      => story_id,
          :change_type   => change_type,
          :story_title   => story_title,
          :user_initials => user_initials,
          :pt_project_id => pt_project_id
        }
      }
    end

    def save!
      response = client.post("tracker_events", data.to_json)
      [response.status, JSON.parse(response.body)]
    end
  end
end
