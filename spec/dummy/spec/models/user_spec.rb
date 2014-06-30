require 'spec_helper'

describe User do
  
  describe "gender" do
    
    let(:user) { User.new(gender: "f") }
      
    it "should return a Gender object" do
      user.gender.should be_an_instance_of(Gender)
    end
    
    it "should be female?" do
      user.gender.should be_female
    end
    
    it "should be male when changed" do
      user.gender = "m"
      user.gender.should be_male
    end
    
  end
  
  describe "full gender names" do
    
    it 'should set the gender as the abbreviation' do
      User.new(gender: "female").gender.should be_female
      User.new(gender: "male").gender.should be_male
    end
    
  end
  # Since the db column name can be changed, we're using the "name" column to
  # test this behaviour
  describe "name" do
    
    let(:user) { User.new(name: "f", gender: "f") }
    
    it "should return a Gender object" do
      user.name.should be_an_instance_of Gender
    end
    
    it "should change the name column" do
      user.save!
      user = User.last
      user.name.should == "f"
      user.name.should be_female
    end
    
    it "should not change the gender column" do
      user.name = "m"
      user.name.should be_male
      user.gender.should_not be_male
    end
    
  end
  
end
