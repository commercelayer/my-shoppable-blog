Rails.application.routes.draw do
  root "posts#index"
  get "/blog/:slug" => "posts#show", as: :post
  post "/blog/:slug/purchase" => "posts#purchase", as: :purchase_post
end
