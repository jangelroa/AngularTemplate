Rails.application.routes.draw do
  root to: 'main#index'
  match '*any' => "main#index", :via => [:get, :post]

end
