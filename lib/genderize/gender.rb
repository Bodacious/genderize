module Genderize
  class Gender
  
    include I18n
    
    attr_reader :abbr
    
    def initialize(abbr)
      raise "Invalid abbreviation: '#{abbr}'" unless abbr.blank? or abbr.to_s =~ /\A(f|m)\Z/i
      @abbr = abbr.blank? ? nil : abbr.to_s.downcase
    end
    
    def name
      @name ||= translation_for("name")
    end
  
    def subject
      @subject ||= translation_for("subject")
    end
    
    def object
      @object ||= translation_for("object")
    end
    
    def possessive
      @possessive ||= translation_for("possessive")
    end
    
    def casual
      @casual ||= translation_for("casual")
    end
    
    def capital_abbr
      abbr.capitalize
    end
  
    def male?
      abbr == 'm'
    end
  
    def female?
      abbr == 'f'
    end
  
    def to_s
      abbr
    end
  
    def ==(val)
      abbr.to_s == val.to_s
    end
  
    private
    
    def translation_for(key)
      case
      when male? then I18n.t("genderize.#{key}.masculine")
      when female? then I18n.t("genderize.#{key}.feminine")
      else
        nil
      end
    end
    
  end
end