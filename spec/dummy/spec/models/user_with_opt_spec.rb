require 'spec_helper'

describe UserWithOpt, type: :model do

  describe "gender" do

    let(:user) { UserWithOpt.new(gender: gender) }

    context "testing :no_empty_string" do
      context "when blank" do
        let(:gender) { "" }

        it "should return a Gender object" do
          expect(user.gender).to be_an_instance_of(Genderize::Gender)
        end

        it "should be blank?" do
          expect(user.gender).to be_blank
        end

        it "should keep the stored value as nil" do
          expect(user[:gender]).to be_nil
        end
      end

      context "when nil" do
        let(:gender) { nil }

        it "should return a Gender object" do
          expect(user.gender).to be_an_instance_of(Genderize::Gender)
        end

        it "should be blank?" do
          expect(user.gender).to be_blank
        end

        it "should keep the stored value as nil" do
          expect(user[:gender]).to be_nil
        end
      end
    end

    context "testing :set_invalid_to_nil" do

      context "when something unexpected" do
        let(:gender) { "something unexpected" }

        it "should return a Gender object" do
          expect(user.gender).to be_an_instance_of(Genderize::Gender)
        end

        it "should be blank?" do
          expect(user.gender).to be_blank
        end

        it "should keep the stored value as nil" do
          expect(user[:gender]).to be_nil
        end
      end

    end

  end

end
