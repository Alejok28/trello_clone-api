Rails.application.routes.draw do

  scope "(:locale)", locale: /es|en/ do
    namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :boards, except: [:edit, :new] do
          resources :lists do
            resources :tasks
          end
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
