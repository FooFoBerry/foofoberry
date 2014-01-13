require './spec/spec_helper'
require './lib/foofoberry/project'

describe FooFoBerry::Project do 
  it "exists" do 
    expect(FooFoBerry::Project).not_to be_nil
  end
  
  it "can create a new Project" do
    p = FooFoBerry::Project.new
    params = { 
      :project => { 
        :user_id => 1, 
        :name => "KC" 
      }
    }
    expected_result = [201, {:id => 1, :name => "KC", :user_id => 1}]
    expect( p.create_with(params) ).to eq expected_result 
  end 

end
