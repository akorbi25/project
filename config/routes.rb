Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :stores
    resources :employees
    resources :assignments
    
    get 'home' => 'home#home', as: :home
    get 'about' => 'home#about', as: :about
    get 'contact' => 'home#contact', as: :contact
    get 'active_stores' => 'stores#active', as: :active_stores
    get 'inactive_stores' => 'stores#inactive', as: :inactive_stores
    get 'active_employees' => 'employees#active', as: :active_employees
    get 'inactive_employees' => 'employees#inactive', as: :inactive_employees


    root :to => "home#home"
    
    end
