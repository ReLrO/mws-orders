module MWS
  module InventorySupplyList
    module Tokenable
      def next_token
        node = xpath('NextToken').first
        node.text if node
      end
    end
  end
end
