require 'timecop'

FoodBatch.delete_all

columns = [:category_name, :name, :variety_name]
values_set = [
  ['Meat', 'Chicken', 'Wings'],
  ['Meat', 'Chicken', 'thigh fillets'],
  ['Meat', 'Chicken', 'breast fillets'],
  ['Meat', 'Chicken', 'marylands'],
  ['Meat', 'Chicken', 'carcass'],
  ['Meat', 'Chicken', 'whole'],
  ['Meat', 'Chicken', 'drumsticks'],
  ['Meat', 'Beef', 'Fillet Steak'],
  ['Meat', 'Beef', 'porterhouse steak'],
  ['Meat', 'Beef', 'chops'],
  ['Meat', 'Beef', 'mince'],
  ['Meat', 'Beef', 'sausages'],
  ['Meat', 'Beef', 'Rib Eye Steak'],
  ['Meat', 'Lamb', 'chops'],
  ['Meat', 'Lamb', 'cutlets'],
  ['Meat', 'Lamb', 'shanks'],
  ['Meat', 'Lamb', 'neck chops'],
  ['Meat', 'Lamb', 'leg'],
  ['Meat', 'Lamb', 'rolled roast'],
  ['Grains', 'Wheat', ''],
  ['Grains', 'Wheat Flour', 'white'],
  ['Grains', 'Wheat Flour', 'wholemeal'],
  ['Grains', 'Wheat Flour', 'Self-raising'],
  ['Grains', 'Corn', 'kernels'],
  ['Grains', 'Corn', 'frozen kernels'],
  ['Grains', 'Corn', 'meal'],
  ['Grains', 'Corn', 'flour'],
  ['Grains', 'Oats', 'rolled'],
  ['Grains', 'Rice', 'basmati'],
  ['Grains', 'Rice', 'arborio'],
  ['Grains', 'Rice', 'brown medium grain'],
  ['Grains', 'Rice', 'puffed'],
  ['Condiments', 'Jam', 'Strawberry'],
  ['Condiments', 'Jam', 'Black current'],
  ['Condiments', 'Jam', 'boysenberry'],
  ['Condiments', 'Jam', 'Feijoa'],
  ['Condiments', 'Marmalade', 'Cumquat'],
  ['Condiments', 'Marmalade', 'Orange'],
  ['Condiments', 'Jelly', 'Apple'],
  ['Condiments', 'Jelly', 'Feijoa'],
  ['Condiments', 'Paste', 'Quince'],
  ['Pickles', 'Chutney', 'Mixed Vegetable'],
  ['Pickles', 'Chutney', 'Courgette'],
  ['Pickles', 'Chutney', 'Peach'],
  ['Pickles', 'Chutney', 'Feijoa'],
  ['Pickles', 'Chutney', 'Cucumber'],
  ['Pickles', 'Pickled Gherkin', 'Sweet spiced'],
  ['Pickles', 'Pickled Gherkin', 'Dill'],
  ['Pickles', 'Pickled Onion', '']
]
values_set.map do |values|
  attributes = Hash[*columns.zip(values).flatten]
  (1..24).each do |num|
    num_date = num.months.ago
    creation_date = Date.new(num_date.year, num_date.mon, rand(27) + 1)
    Timecop.freeze(creation_date) do
      FoodBatch.create!(attributes.merge(
        :use_by => Time.now + 1.year, 
        :made_on => Date.today,
        :number_of_packages => rand(3) + 1,
        :package_size => rand * 1000.0,
        :package_size_units => 'kg',
        :use_in_one_go => (rand(2) == 1),
        :minimum_consumption => 200.0
      ))
    end
  end
end
