Rails.application.routes.draw do
  devise_for :patients
  get 'welcome/index'
  root to: 'welcome#index'
end
