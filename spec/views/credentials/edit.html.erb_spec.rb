require 'spec_helper'

describe "credentials/edit" do
  before(:each) do
    @credential = assign(:credential, stub_model(Credential,
      :name => "MyString",
      :password => "MyString",
      :user => nil
    ))
  end

  it "renders the edit credential form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => credentials_path(@credential), :method => "post" do
      assert_select "input#credential_name", :name => "credential[name]"
      assert_select "input#credential_password", :name => "credential[password]"
      assert_select "input#credential_user", :name => "credential[user]"
    end
  end
end
