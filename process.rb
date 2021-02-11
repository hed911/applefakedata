SAMPLE_COUNT = 250
$models = [
  { name:'5' },
  { name:'6' },
  { name:'XS' },
  { name:'11' },
  { name:'X' }
]
$years   = [
  { name:'2017' },
  { name:'2018' },
  { name:'2019' }
]

def toss_coin(yes_value, no_value, yes_percentage)
  coin = Faker::Number.between(from: 1, to: 100 - yes_percentage)
  coin > yes_percentage ? yes_value : no_value
end

def generate_line(brand, model, year)
  # probability of getting 
  percentage = { "2017":80, "2018":80, "2019":65, "2020":0 }
  performance = toss_coin(true, false, percentage) ? 'BAD' : 'GOOD'
  [
    brand,
    model,
    year,
    performance
  ].join(';')
end

headers = [
  'BRAND',
  'MODEL',
  'YEAR',
  'PERFORMANCE',
].join(";")

result = []
$models.each do |model|
  $years.each do |year|
    SAMPLE_COUNT.times{ result << generate_line('IPHONE', model, year) }
  end
end
result.shuffle!
result.unshift headers
File.write('dataset.csv', result.join("\n"))
