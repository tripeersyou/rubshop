Rails.application.routes.draw do

  root 'postings#index'
  # Communities
  devise_for :suppliers
  devise_scope :supplier do
    authenticated :supplier do
      resources :postings
    end
  end

  # Companies
  devise_for :sellers
  devise_scope :seller do
    authenticated :seller do

    end
  end

  # Customers of Recyclable Products
  devise_for :buyers
  devise_scope :buyer do
    authenticated :buyer do

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
