Rails.application.routes.draw do
  devise_for :users

  # Rutas RESTful para posts con reacciones y comentarios
  resources :posts do
    member do
      post :react # Ruta para manejar reacciones a publicaciones
    end
    resources :comments, only: :create # Ruta para crear comentarios
  end

  # Define la ruta raíz
  root to: "home#index"

  # Elimina rutas innecesarias
  # Las rutas RESTful de posts ya incluyen acciones como index, show, new, create, edit, update, y destroy.

  # Ruta explícita para la página principal (opcional)
  get "home/index", as: :home

  # Rutas adicionales para PWA y salud
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
