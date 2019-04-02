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
    get 'managers' => 'employees#managers', as: :managers
    get 'regulars' => 'employees#regulars', as: :regulars
    get 'admins' => 'employees#admins', as: :admins
    
    get 'for_store' => 'assignments#for_store', as: :for_store
    get 'for_employee' => 'assignments#for_employee', as: :for_employee
    get 'for_pay_level' => 'assignments#for_pay_level', as: :for_pay_level
    get 'for_role' => 'assignments#for_role', as: :for_role





    root :to => "home#home"
    
    end
