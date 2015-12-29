require "mws/inventory/collection"
require "mws/inventory/inventory"
require "mws/inventory/tokenable"

module MWS
  module FulfillmentInventory
    class InventorySupplyList < Collection
      include Tokenable

      def each(&blk)
      	puts "yo"
        xpath("InventorySupplyList/member").map { |node| yield Member.new(node) }
      end
    end
  end
end
