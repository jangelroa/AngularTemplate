Rails.application.routes.draw do
  scope '/api' do
    mount_devise_token_auth_for 'User', at: '/auth'
  end

  root to: 'main#index'
  match '*any' => "main#index", :via => [:get, :post]

end
