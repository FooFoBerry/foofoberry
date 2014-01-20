require './spec/spec_helper'
require './lib/foofoberry/repo'

describe FooFoBerry::Client do
  it "url for dev" do
    client = FooFoBerry::Client.new
    expect(client.connection.url_prefix.to_s).to eq("http://localhost:8080/api/v1/")
  end

  it "url for prod" do
    FooFoBerry::Client.any_instance.stub(:production_env?).and_return(true)
    client = FooFoBerry::Client.new
    expect(client.connection.url_prefix.to_s).to eq("http://162.243.206.48/api/v1/")
  end
end
