require "mws/inventory/collection"
require "mws/inventory/inventory"
require "mws/inventory/tokenable"

module MWS
  module FulfillmentInventory
    class InventorySupplyList < Collection
      include Tokenable

      def each(&blk)
        xpath("InventorySupplyList/member").map { |node| yield Member.new(node) }
      end
    end
  end
end
