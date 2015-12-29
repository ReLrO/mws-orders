require "nokogiri"
require "mws/inventory/inventory_supply_list"
require "mws/inventory/service_status"

module MWS
  module InventorySupplyList
    class Parser
      SERVICE_STATUS = /GetServiceStatus/
      LISTINVENTORYSUPPLY  = /ListInventorySupply/
      

      def initialize(response, _)
        @response = response
      end

      def parse
        node = find_result_node
        puts"hi"
        case node.name
        when SERVICE_STATUS
          ServiceStatus.new(node)
        when LISTINVENTORYSUPPLY
          puts"hi1"
          InventorySupplyList.new(node).first
        else
          raise NotImplementedError
        end
      end

      private

      def find_result_node
        xml = Nokogiri(@response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?("Result") }
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
