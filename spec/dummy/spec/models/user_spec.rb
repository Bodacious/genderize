require 'spec_helper'

describe User do
  
  describe "gender" do
    
    let(:user) { User.new }
      
    context "when gender is set to a valid value" do

      before do
        user.gender = %w[ f m female male ].sample
      end
      
      it "returns a Gender object" do
        expect(user.gender).to be_an_instance_of(Gender)
      end
      
    end
    
    context "when gender is set to an empty string" do

      before do
        user.gender = ''
      end
      
      it "returns an unknown gender" do
        expect(user.gender).to be_unknown
      end
      
    end
    
    context "when gender is set to nil" do

      before do
        user.gender = nil
      end
      
      it "returns an unknown gender" do
        expect(user.gender).to be_unknown
      end
      
    end
    
    context "when gender is set to 'f'" do
      
      before do
        user.gender = 'f'
      end
            
      it "is female?" do
        expect(user.gender).to be_female
      end
      
    end
    
    context "when gender is set to 'm'" do
      
      before do
        user.gender = "m"
      end
      
      it "is male?" do
        expect(user.gender).to be_male
      end

    end
    
    context "when gender is set to :male" do

      before do
        user.gender = :male
      end
      
      it "is male?" do
        expect(user.gender).to be_male
      end
      
    end

    context "when gender is set to :m" do

      before do
        user.gender = :m
      end
      
      it "is male?" do
        expect(user.gender).to be_male
      end
      
    end
    
    context "when gender is set to :female" do

      before do
        user.gender = :female
      end
      
      it "is female?" do
        expect(user.gender).to be_female
      end
      
    end

    context "when gender is set to :f" do

      before do
        user.gender = :f
      end
      
      it "is female?" do
        expect(user.gender).to be_female
      end
      
    end
    
  end
  
  # Since the db column name can be changed, we're using the "name" column to
  # test this behaviour
  describe "name" do
    
    let(:user) { User.new(name: "f", gender: '') }
    
    it "returns a Gender object" do
      expect(user.name).to be_an_instance_of Gender
    end
    
    it "changes the DB row in the name column" do
      user.save!
      user = User.last
      expect(user.send(:read_attribute, :name)).to eql("f")
      expect(user.name).to be_female
    end
    
    it "should not change the gender column" do
      user.name = "m"
      expect(user.name).to be_male
      expect(user.gender).to be_unknown
    end
    
  end
  
end