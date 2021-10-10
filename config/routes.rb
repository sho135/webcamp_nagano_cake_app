Rails.application.routes.draw do
  devise_for :admins
  devise_for :costomers

  root to: 'homes#top'
end
