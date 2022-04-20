require 'product_pricing_rule'

RSpec.describe ProductPricingRule do
  describe '#new' do
    context 'when all arguments are given' do
      let(:product_pricing_rule) { ProductPricingRule.new('BAS', 5.00, 3, 4.50) }

      it 'sets @product_code' do
        expect(product_pricing_rule.product_code).to eq('BAS')
      end

      it 'sets @price' do
        expect(product_pricing_rule.price).to eq(5.00)
      end

      it 'sets @bulk_discount_threshold' do
        expect(product_pricing_rule.bulk_discount_threshold).to eq(3)
      end

      it 'sets @bulk_discount_price' do
        expect(product_pricing_rule.bulk_discount_price).to eq(4.50)
      end
    end

    context '@bulk_discount_threshold and @bulk_discount_price are not given' do
      let(:product_pricing_rule) { ProductPricingRule.new('BAS', 5.00) }

      it 'sets @product_code' do
        expect(product_pricing_rule.product_code).to eq('BAS')
      end

      it 'sets @price' do
        expect(product_pricing_rule.price).to eq(5.00)
      end

      it 'does not set @bulk_discount_threshold' do
        expect(product_pricing_rule.bulk_discount_threshold).to be_nil
      end

      it 'does not set @bulk_discount_price' do
        expect(product_pricing_rule.bulk_discount_price).to be_nil
      end
    end
  end
end
