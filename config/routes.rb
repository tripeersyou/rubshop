Rails.application.routes.draw do

  # Communities
  devise_for :suppliers
  devise_scope :supplier do
    authenticated :supplier do
      root 'postings#index', as: :supplier_root
      resources :postings
    end
  end

  # Companies
  devise_for :sellers
  devise_scope :seller do
    authenticated :seller do
        root 'products#index', as: :seller_root
        resources :products
    end
  end

  # Customers of Recyclable Products
  devise_for :buyers
  devise_scope :buyer do
    authenticated :buyer do

    end
  end
  
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
