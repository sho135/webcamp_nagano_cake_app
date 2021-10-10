Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  devise_for :costomers

  root to: 'homes#top'
  get "/home/about" => "homes#about"

end
