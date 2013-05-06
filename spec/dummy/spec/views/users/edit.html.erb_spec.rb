require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :new => "MyString",
      :index => "MyString",
      :show => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_new[name=?]", "user[new]"
      assert_select "input#user_index[name=?]", "user[index]"
      assert_select "input#user_show[name=?]", "user[show]"
    end
  end
end
