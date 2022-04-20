class ProductPricingRule
  attr_reader :product_code, :price, :bulk_discount_threshold, :bulk_discount_price

  def initialize(product_code, price, bulk_discount_threshold = nil, bulk_discount_price = nil)
    @product_code = product_code
    @price = price
    @bulk_discount_threshold = bulk_discount_threshold
    @bulk_discount_price = bulk_discount_price
  end
end
