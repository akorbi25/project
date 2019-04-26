Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :shift_jobs
  resources :shifts
  resources :jobs
  resources :store_flavors
  resources :flavors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :stores
    resources :employees
    resources :assignments
    
    get 'home' => 'home#home', as: :home
    get 'about' => 'home#about', as: :about
    get 'contact' => 'home#contact', as: :contact
    get 'active_stores' => 'stores#active', as: :active_stores
    get 'active_flavors' => 'flavors#active', as: :active_flavors
    get 'active_jobs' => 'jobs#active', as: :active_jobs

    get 'inactive_stores' => 'stores#inactive', as: :inactive_stores
    get 'inactive_flavors' => 'flavors#inactive', as: :inactive_flavors
    get 'inactive_jobs' => 'jobs#inactive', as: :inactive_jobs
    
    get 'active_employees' => 'employees#active', as: :active_employees
    
    get 'inactive_employees' => 'employees#inactive', as: :inactive_employees
    get 'managers' => 'employees#managers', as: :managers
    get 'regulars' => 'employees#regulars', as: :regulars
    get 'admins' => 'employees#admins', as: :admins
    
    get 'for_store' => 'assignments#for_store', as: :for_store
    get 'for_employee' => 'assignments#for_employee', as: :for_employee
    get 'for_pay_level' => 'assignments#for_pay_level', as: :for_pay_level
    get 'for_role' => 'assignments#for_role', as: :for_role
    get 'current' => 'assignments#current', as: :current
    get 'past' => 'assignments#past', as: :past


    get 'for_past_days' => 'shifts#for_past_days', as: :for_past_days
    get 'for_next_days' => 'shifts#for_next_days', as: :for_next_days
    get 'past' => 'shifts#past', as: :past_shifts
    get 'upcoming' => 'shifts#upcoming', as: :upcoming
    get 'completed' => 'shifts#completed', as: :completed
    get 'incomplete' => 'shifts#incomplete', as: :incomplete


  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout



    root :to => "home#home"
    
    end
