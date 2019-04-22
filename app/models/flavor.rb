class Flavor < ApplicationRecord
    has_many :store_flavors
    has_many :stores, through: :store_flavors
    
    validates_presence_of :name
      # Scopes
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
end
