Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
        post "venues/import", to: "venues#import"      
    end
  end
end
