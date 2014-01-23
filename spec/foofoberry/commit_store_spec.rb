require './spec/spec_helper'
require './lib/foofoberry/commit_store'

describe FooFoBerry::CommitStore do
  it "exists" do
    expect(FooFoBerry::CommitStore).not_to be_nil
  end

  it "can retrieve commits by project_id" do
    c = FooFoBerry::CommitStore.new(MockCommitClient.new)
    _, response = c.recent_from(1)
    expect(response.map {|c| c["commit_hash"]}).to eq(["a3039", "ca26a"])
  end

  class MockCommitClient
    def get(path)
      body = File.read("./spec/fixtures/project_commits.json")
      status = 200
      MockResponse.new(status, body) # support.rb
    end
  end

end
