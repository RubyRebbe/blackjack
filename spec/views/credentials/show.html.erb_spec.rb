require 'spec_helper'

describe "credentials/show" do
  before(:each) do
    @credential = assign(:credential, stub_model(Credential,
      :name => "Name",
      :password => "Password",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Password/)
    rendered.should match(//)
  end
end
