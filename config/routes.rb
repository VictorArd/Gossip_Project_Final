Rails.application.routes.draw do

  root "static_page#team"
  get 'team', to: 'static_page#team'
  get 'contact', to: 'static_page#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
