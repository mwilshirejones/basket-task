require 'basket'
require 'product_pricing_rule'

RSpec.describe Basket do
  describe '#add' do
    context 'when there are no bulk discounts to apply' do
      let(:product_pricing_rules) do
        [
          ProductPricingRule.new('BAS', 2.11),
          ProductPricingRule.new('PAR', 5.00)
        ]
      end

      it 'adds the price of the item to the basket total' do
        basket = Basket.new(product_pricing_rules)
        basket.add('BAS')
        basket.add('PAR')

        expect(basket.total).to eq(7.11)
      end
    end

    context 'when there are bulk discounts to apply' do
      let(:product_pricing_rules) do
        [
          ProductPricingRule.new('BAS', 2.11),
          ProductPricingRule.new('PAR', 5.00, 3, 4.50)
        ]
      end

      context 'when the number of products is equal to the discount threshold' do
        it 'uses the discount price' do
          basket = Basket.new(product_pricing_rules)
          basket.add('BAS')
          basket.add('PAR')
          basket.add('PAR')
          basket.add('PAR')

          expect(basket.total).to eq(15.61)
        end
      end

      context 'when the number of products is greater than the discount threshold' do
        it 'uses the discount price' do
          basket = Basket.new(product_pricing_rules)
          basket.add('BAS')
          basket.add('PAR')
          basket.add('PAR')
          basket.add('PAR')
          basket.add('PAR')

          expect(basket.total).to eq(20.11)
        end
      end

      context 'when the number of products less than the discount threshold' do
        it 'uses the regular price' do
          basket = Basket.new(product_pricing_rules)
          basket.add('BAS')
          basket.add('PAR')

          expect(basket.total).to eq(7.11)
        end
      end
    end
  end
end
