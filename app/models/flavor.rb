class Flavor < ApplicationRecord
    has_many :store_flavors
    has_many :stores, through: :store_flavors
    
    validates_presence_of :name
      # Scopes
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    
    
    before_destroy :cant
    after_rollback :be_inactive
    
    private 
    def cant
      throw :abort
    end
    
    def be_inactive
      self.update_attribute(:active, false)
    end
end
