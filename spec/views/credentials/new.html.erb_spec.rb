require 'spec_helper'

describe "credentials/new" do
  before(:each) do
    assign(:credential, stub_model(Credential,
      :name => "MyString",
      :password => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new credential form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => credentials_path, :method => "post" do
      assert_select "input#credential_name", :name => "credential[name]"
      assert_select "input#credential_password", :name => "credential[password]"
      assert_select "input#credential_user", :name => "credential[user]"
    end
  end
end
