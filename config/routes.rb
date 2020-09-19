Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
        post "venues/import", to: "venues#import"
        resources :seats, only:[:index]
        post "seats/group_best_seats", to: "seats#group_best_seats"
    end
  end
end
