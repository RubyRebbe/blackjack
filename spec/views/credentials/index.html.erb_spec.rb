require 'spec_helper'

describe "credentials/index" do
  before(:each) do
    assign(:credentials, [
      stub_model(Credential,
        :name => "Name",
        :password => "Password",
        :user => nil
      ),
      stub_model(Credential,
        :name => "Name",
        :password => "Password",
        :user => nil
      )
    ])
  end

  it "renders a list of credentials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
