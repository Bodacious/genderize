require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :new => "MyString",
      :index => "MyString",
      :show => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_new[name=?]", "user[new]"
      assert_select "input#user_index[name=?]", "user[index]"
      assert_select "input#user_show[name=?]", "user[show]"
    end
  end
end
