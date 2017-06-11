require 'spec_helper'

describe User, type: :model do

  describe "gender" do

    let(:user) { User.new(gender: gender) }

    context "when female" do
      let(:gender) { "f" }

      it "should return a Gender object" do
        expect(user.gender).to be_an_instance_of(Genderize::Gender)
      end

      it "should be female?" do
        expect(user.gender).to be_female
      end
    end

    context "when male" do
      let(:gender) { "m" }

      it "should return a Gender object" do
        expect(user.gender).to be_an_instance_of(Genderize::Gender)
      end

      it "should be male?" do
        expect(user.gender).to be_male
      end
    end

    context "when blank" do
      let(:gender) { "" }

      it "should return a Gender object" do
        expect(user.gender).to be_an_instance_of(Genderize::Gender)
      end

      it "should be blank?" do
        expect(user.gender).to be_blank
      end
    end

    context "when changed" do
      let(:gender) { "f" }

      it "should be male when changed" do
        user.gender = "m"
        expect(user.gender).to be_male
      end

      it "should be blank when changed" do
        user.gender = ""
        expect(user.gender).to be_blank
      end
    end
  end

  describe "full gender names" do

    it 'should set the gender as the abbreviation' do
      expect(User.new(gender: "female").gender).to be_female
      expect(User.new(gender: "male").gender).to   be_male
      expect(User.new(gender: "").gender).to       be_blank
    end

  end
  # Since the db column name can be changed, we're using the "name" column to
  # test this behaviour
  describe "name" do

    let(:user) { User.new(name: "f", gender: "f") }

    it "should return a Gender object" do
      expect(user.name).to be_an_instance_of Genderize::Gender
    end

    it "should change the name column" do
      user.save!
      user = User.last
      expect(user.name).to eq("f")
      expect(user.name).to be_female
    end

    it "should not change the gender column" do
      user.name = "m"
      expect(user.name).to be_male
      expect(user.gender).not_to be_male
    end

  end

end
