require "cgi"
require "time"
require "money"
require "structure"
require "mws/inventory/document"

module MWS
  module FulfillmentInventory
    class Entity < Document
      include Structure

      def float_at_xpath(path)
        text = text_at_xpath(path)
        text.to_f if text
      end

      def integer_at_xpath(path)
        text = text_at_xpath(path)
        text.to_i if text
      end

      def money_at_xpath(path)
        return unless amount = float_at_xpath("#{path}/Amount")

        currency_code = text_at_xpath("#{path}/CurrencyCode")
        amount = amount * 100 unless currency_code == "JPY"

        Money.new(amount, currency_code)
      end

      def time_at_xpath(path)
        text = text_at_xpath(path)
        Time.parse(CGI.unescape(text)) if text
      end

      def text_at_xpath(path)
        node = xpath(path).first
        node.text.strip if node
      end
    end
  end
end
