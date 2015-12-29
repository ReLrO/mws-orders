require "mws/inventory/collection"
require "mws/inventory/inventory"
require "mws/inventory/tokenable"

module MWS
  module InventorySupplyList
    class InventorySupplyList < Collection
      include Tokenable

      def each(&blk)
        xpath("inventory/inventory").map { |node| yield Order.new(node) }
      end
    end
  end
end
