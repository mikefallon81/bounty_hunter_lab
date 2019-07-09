require('pry')
require_relative('./models/bounty_hunters.rb')

hunter1 = BountyHunter.new({
  'name' => 'Dog',
  'bounty_value' => 300,
  'favourite_weapon' => 'A prayer',
  'last_location' => 'Hawaii'
  })

hunter1.save()

hunter1.bounty_value = 500
hunter1.update()

binding.pry
nil
