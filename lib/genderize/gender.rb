module Genderize
  class Gender
  
    include I18n

    attr_reader :name, :abbr, :subject, :object, :possessive, :casual

    def initialize(abbr)
      raise "Invalid abbreviation" unless abbr.to_s =~ /\A(f|m)\Z/i
      @abbr = abbr.downcase
      @male = self.abbr == 'm'
      @name = male? ? t("name") : t("name", "feminine")
    
      # pronouns
      @subject    = male? ? t("subject") : t("subject", "feminine")
      @object     = male? ? t("object") : t("object", "feminine")
      @possessive = male? ? t("possessive") : t("possessive", "feminine")
    
      # Other forms
      @casual     = male? ? t("casual") : t("casual", "feminine")
    end
  
    def capital_abbr
      abbr.capitalize
    end
  
    def male?
      @male
    end
  
    def female?
      !male?
    end
  
    def to_s
      @abbr
    end
  
    def ==(val)
      to_s == val.to_s
    end
  
    private
  
    def t(attribute, gender = "masculine")
      I18n.t("genderize.#{attribute}.#{gender}")
    end
    
  end
end