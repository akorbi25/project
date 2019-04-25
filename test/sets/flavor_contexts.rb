module Contexts
  module FlavorContexts
    # Context for flavors 
    def create_flavors
      @vanilla  = FactoryBot.create(:flavor)
      @strawberry    = FactoryBot.create(:flavor, name: "Strawberry")
      @mocha = FactoryBot.create(:flavor, name: "Mocha")
      @jamoka  = FactoryBot.create(:flavor, name: "Jamoka", active: false)
    end
    
    def remove_flavors
      @vanilla.destroy
      @strawberry.destroy
      @mocha.destroy
      @jamoka.destroy
    end
  end
end