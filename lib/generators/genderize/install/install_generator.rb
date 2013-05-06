class Genderize::InstallGenerator < Rails::Generators::Base

  # Gem's root dir
  source_root File.expand_path('../../../../..', __FILE__)

  desc "Installs the genderize.yml files to your locales directory"

  def copy_initializer
    template "config/locales/genderize.en.yml", "config/locales/genderize.en.yml"
  end

end
