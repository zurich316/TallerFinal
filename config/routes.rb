
Rails.application.routes.draw do
  
  root 'home#index'
  get '/daily_tracking' => 'band_informations#home'
  get '/daily_tracking/options' => 'band_informations#options'
  get '/daily_tracking/today_work' => 'band_informations#today_work'
  get '/daily_tracking/daily_comp' => 'band_informations#daily_comp'
  get '/daily_tracking/weekly_comp' => 'band_informations#weekly_comp'
  get '/daily_tracking/monthly_comp' => 'band_informations#monthly_comp'
  get '/daily_tracking/custom' => 'band_informations#custom'
  post '/daily_tracking/custom' => 'band_informations#custom'
  
  resources :alarms
  get 'user/welcome'=>'home#welcome'
  get 'user/profile' => 'profile#show'
  get 'dream_sessions/:id/start_session' =>'dream_sessions#start_time'
  get 'dream_sessions/:id/finish_session' =>'dream_sessions#end_time'

  get 'fitness_sessions/results'=>'fitness_sessions#results'
  get 'fitness_sessions/:id/start'=>'fitness_sessions#start'
  get 'fitness_sessions/:id/end'=>'fitness_sessions#end'
  get 'fitness_sessions/:id/graf_sessions_results'=>'fitness_sessions#graf_sessions_results'

  get 'alarms/:id/turn_on'=>'alarms#turn_on'
  get 'alarms/:id/turn_off'=>'alarms#turn_off'
  resources :dream_sessions
  resources :band_informations
  resources :fitness_sessions
  resources :bands
  resources :goals
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/contact_us' => 'home#contact_us'
  get '/jogging' => 'home#jogging'
  get '/cycling' => 'home#cycling'
  get '/weight_lifting' => 'home#weight_lifting'
  get '/terms_of_use' => 'home#terms_of_use'
  get '/users'=>'admin#users'
  get '/lock_unlock'=>'admin#lock_unlock'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
