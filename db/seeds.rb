# frozen_string_literal: true

Student.destroy_all
AdminUser.destroy_all
Holder.destroy_all
Employee.destroy_all
User.destroy_all

u1 = User.create!(id: 1, name: 'matt', password: '123456')

_h1 = Holder.create!(
  id: 1,
  name: 'holder1',
  last_name: 'holder1_ln',
  email: 'holder1@gmail.com',
  user: u1
)

_a1 = AdminUser.create!(
  id: 1,
  name: 'admin1',
  last_name: 'admin1_ln',
  email: 'admin1@gmail.com',
  user: u1
)
