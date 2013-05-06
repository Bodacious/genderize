module Genderize
  class Engine < ::Rails::Engine

    initializer "genderize.extend_active_record" do

      if defined?(::ActiveRecord::Base)
        ::ActiveRecord::Base.send(:include, Genderize)
      end
      
    end
    
  end
end
