### Example
```
basil = ProductPricingRule.new('BAS', 3.11)
parsley = ProductPricingRule.new('PAR', 5.00, 3, 4.50)
coriander = ProductPricingRule.new('COR', 11.23)
pricing_rules = [basil, parsley, coriander]

ba = Basket.new(pricing_rules)
ba.add('PAR')
ba.add('PAR')
ba.add('BAS')
ba.add('PAR')

ba.total
=> 16.61
```
