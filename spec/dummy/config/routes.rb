Rails.application.routes.draw do

  mount Genderize::Engine => "/genderize"
end
