require "mws/inventory/entity"

module MWS
  module InventorySupplyList
    class ServiceStatusMessage < Entity
      attribute(:locale) do
        text_at_xpath("Locale")
      end

      attribute(:text) do
        text_at_xpath("Text")
      end
    end
  end
end
