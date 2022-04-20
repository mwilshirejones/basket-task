class Basket
  attr_reader :product_pricing_rules, :total

  def initialize(product_pricing_rules)
    @product_pricing_rules = product_pricing_rules
    @total = 0
    @items = {}
  end

  def add(product_code)
    if @items[product_code]
      @items[product_code] += 1
    else
      @items[product_code] = 1
    end

    calculate_total
  end

  private

  def calculate_total
    basket_total = @items.reduce(0) do |sum, (product_code, count)|
      product_pricing_rule = product_pricing_rules.select do |rule|
        rule.product_code == product_code
      end.first

      if !product_pricing_rule.bulk_discount_threshold || count < product_pricing_rule.bulk_discount_threshold
        price = product_pricing_rule.price
      else
        price = product_pricing_rule.bulk_discount_price
      end

      sum + (price * count)
    end

    @total = basket_total.ceil(2)
  end
end
