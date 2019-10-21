# frozen_string_literal: true

Service.destroy_all
Student.destroy_all
AdminUser.destroy_all
Employee.destroy_all
Holder.destroy_all
User.destroy_all

u1 = User.create!(id: 1, name: 'pepe', password: '123456')
u2 = User.create!(id: 2, name: 'moni', password: '123456')
u3 = User.create!(id: 3, name: 'asd', password: '123456')

h1 = Holder.create!(
  id: 1,
  name: 'pepe',
  last_name: 'argento',
  email: 'pp.arg@gmail.com',
  user: u1
)

h2 = Holder.create!(
  id: 2,
  name: 'moni',
  last_name: 'argento',
  email: 'moni@gmail.com',
  user: u2
)

a1 = AdminUser.create!(
  id: 1,
  name: 'admin1',
  last_name: 'admin1_ln',
  email: 'admin1@gmail.com',
  user: u1
)

e1 = Employee.create!(
  id: 1,
  name: 'emp1',
  last_name: 'emp1_ln',
  email: 'emp1@gmail.com',
  user: u1
)

s1 = Student.create!(
  id: 1,
  name: 'student1',
  last_name: 'student1_ln',
  email: 'student1@gmail.com',
  user: u1,
  holder: h1
)

s2 = Student.create!(
  id: 2,
  name: 'student2',
  last_name: 'student2_ln',
  email: 'student2@gmail.com',
  user: u2,
  holder: h1
)

s3 = Student.create!(
  id: 3,
  name: 'student3',
  last_name: 'student3_ln',
  email: 'student3@gmail.com',
  user: u3,
  holder: h2
)

serv1 = Service.create!(
  id: 1,
  name: 'Escolaridad simple',
  description: 'Turno de 5 hs.',
  price: 1000
)

serv2 = Service.create!(
  id: 2,
  name: 'Doble escolaridad',
  description: 'Turno de 8 hs.',
  price: 1900
)

serv3 = Service.create!(
  id: 3,
  name: 'Ingles',
  description: '2 hs semanales.',
  price: 270
)

serv4 = Service.create!(
  id: 4,
  name: 'Computación',
  description: '2 hs semanales.',
  price: 270
)

serv5 = Service.create!(
  id: 5,
  name: 'Almuerzo',
  description: 'Platos del día.',
  price: 70
)

serv6 = Service.create!(
  id: 6,
  name: 'Desayuno',
  description: 'Cafe con 2 medialunas.',
  price: 30
)

serv7 = Service.create!(
  id: 7,
  name: 'Merienda',
  description: 'Mate con bizcochitos.',
  price: 30
)

s1.services << serv1
s1.services << serv3
s1.services << serv6
s1.save

s2.services << serv1
s2.services << serv3
s2.services << serv6
s2.save

s3.services << serv2
s3.services << serv4
s3.services << serv6
s3.services << serv7
s3.save
