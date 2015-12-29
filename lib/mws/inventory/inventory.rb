require "mws/inventory/entity"


module MWS
  module FulfillmentInventory
    class Member < Entity


      attribute(:condition) do
        text_at_xpath("Condition")
      end
      
      
      attribute(:supply_detail) do
        text_at_xpath("SupplyDetail")
      end

      attribute(:total_supply_quantity) do
        text_at_xpath("TotalSupplyQuantity")
      end

      attribute(:fn_sku) do
        time_at_xpath("FNSKU")
      end

      attribute(:in_stock_supply_quantity) do
        text_at_xpath("InStockSupplyQuantity")
      end

      attribute(:asin) do
        text_at_xpath("ASIN")
      end

      attribute(:seller_sku) do
        text_at_xpath("SellerSKU")
      end
      
      
    end
  end
end
