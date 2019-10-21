# frozen_string_literal: true

Holder.destroy_all
User.destroy_all

u1 = User.create!(name: 'matt', password: '123456')

_h1 = Holder.create!(
  name: 'holder1',
  last_name: 'holder1_ln',
  email: 'holder1@gmail.com',
  user: u1
)

_a1 = AdminUser.create!(
  name: 'admin1',
  last_name: 'admin1_ln',
  email: 'admin1@gmail.com',
  user: u1
)
