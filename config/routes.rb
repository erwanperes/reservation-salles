Rails.application.routes.draw do
  devise_for :users
  
  root to: "pages#index"
  get 'about', to: 'pages#about', as: 'about'
  get 'main', to: 'pages#main', as: 'main'
  
  # Route pour les erreurs 404
  match '/404', to: 'errors#not_found', via: :all
  
  # Rediriger toutes les autres routes non trouvées vers la page 404
  match '*path', to: 'errors#not_found', via: :all
end


