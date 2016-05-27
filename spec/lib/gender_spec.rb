require "spec_helper"

describe Genderize::Gender do

  let(:female) { Gender.new("f") }
  let(:male)   { Gender.new("M") }
  let(:blank)  { Gender.new('')  }

  context "when full gender name is used" do

    it "should find the correct abbreviation" do
      expect(Gender.new("female").abbr).to eql('f')
      expect(Gender.new("male").abbr).to eql('m')
      expect(Gender.new("").abbr).to eql('')
    end

  end


  describe :name do

    context "when male" do

      it "should be 'male'" do
        expect(male.name).to eql("male")
      end

    end

    context "when female" do

      it "should be 'female'" do
        expect(female.name).to eql("female")
      end

    end

    context "when blank" do

      it "should be ''" do
        expect(blank.name).to eql("")
      end

    end


  end

  describe :abbr do

    context "when male" do

      it "should be 'm'" do
        expect(male.abbr).to eql("m")
      end

    end

    context "when female" do

      it "should be 'f'" do
        expect(female.abbr).to eql("f")
      end

    end

    context "when blank" do

      it "should be ''" do
        expect(blank.abbr).to eql("")
      end

    end


  end

  describe :subject do

    context "when male" do

      it "should be 'he'" do
        expect(male.subject).to eql("he")
      end

    end

    context "when female" do

      it "should be 'she'" do
        expect(female.subject).to eql("she")
      end

    end

    context "when blank" do

      it "should be 'they'" do
        expect(blank.subject).to eql("they")
      end

    end

  end

  describe  :object do

    context "when male" do

      it "should be 'him'" do
        expect(male.object).to eql("him")
      end

    end

    context "when female" do

      it "should be 'her'" do
        expect(female.object).to eql("her")
      end

    end

    context "when blank" do

      it "should be 'them'" do
        expect(blank.object).to eql("them")
      end

    end


  end

  describe  :possessive do

    context "when male" do

      it "should be 'his'" do
        expect(male.possessive).to eql("his")
      end

    end

    context "when female" do

      it "should be 'her'" do
        expect(female.possessive).to eql("her")
      end

    end

    context "when blank" do

      it "should be 'their'" do
        expect(blank.possessive).to eql("their")
      end

    end



  end

  describe :casual do

    context "when male" do

      it "should be 'guy'" do
        expect(male.casual).to eql("guy")
      end

    end

    context "when female" do

      it "should be 'girl'" do
        expect(female.casual).to eql("girl")
      end

    end

    context "when blank" do

      it "should be 'person'" do
        expect(blank.casual).to eql("person")
      end

    end


  end

  describe :to_s do

    it "should equal the abbr value" do
      expect(male.to_s).to   eql(male.abbr)
      expect(female.to_s).to eql(female.abbr)
      expect(blank.to_s).to  eql(blank.abbr)
    end

    it "returns a string" do
      expect(male.to_s).to   be_an_instance_of(String)
      expect(female.to_s).to be_an_instance_of(String)
      expect(blank.to_s).to  be_an_instance_of(String)
    end

  end

  describe :capital_abbr do

    it "should equal the abbr value capitalized" do
      expect(male.capital_abbr).to   eql(male.abbr.capitalize)
      expect(female.capital_abbr).to eql(female.abbr.capitalize)
      expect(blank.capital_abbr).to  eql(blank.abbr.capitalize)
    end

  end

  describe :== do

    it "should return true if passed abbr value" do
      expect(male == "m").to be_truthy
      expect(female == "f").to be_truthy
      expect(blank == nil).to be_truthy
      expect(blank == '').to be_truthy
    end

    it "should return false if not passed abbr value" do
      expect(male == "f").to be_falsey
      expect(female == 1).to be_falsey
      expect(blank == "$").to be_falsey
    end

  end

end