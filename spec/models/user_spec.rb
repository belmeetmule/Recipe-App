require 'rails_helper'

describe User do
  it('has many foods') do
    user = User.create(name: 'User1')
    food1 = Food.create(name: 'food1', measurement_unit: 'pcs', price: 9.5, quantity: 3, user_id: user.id)
    food2 = Food.create(name: 'food2', measurement_unit: 'kg', price: 15, quantity: 1, user_id: user.id)
    expect(user.foods).to(eq([food1, food2]))
  end
end
