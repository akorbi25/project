module Contexts
  module StoreFlavorContexts
    def create_store_flavors
      @vanillaInCmu = FactoryBot.create(:store_flavor, flavor: @vanilla, store: @cmu)
      @jamokaInOak = FactoryBot.create(:store_flavor, flavor: @jamoka, store: @oakland)

    end
    
    def remove_store_flavors
      @vanillaInCmu.destroy
      @jamokaInOak.destroy

    end
  end
end