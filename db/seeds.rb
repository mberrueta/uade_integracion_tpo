# frozen_string_literal: true

raise StandardError, "Don't delete prod data" if ENV['RAILS_ENV'] != 'development'

Item.delete_all
Payment.delete_all
Invoice.delete_all
Service.delete_all
Student.delete_all
AdminUser.delete_all
Employee.delete_all
Holder.delete_all
User.delete_all

u1 = User.create!(
  id: 10_001,
  name: 'pepe.arg@gmail.com',
  password: '123456'
)
u2 = User.create!(
  id: 10_002,
  name: 'monigali@gmail.com',
  password: '123456'
)
u3 = User.create!(
  id: 10_003,
  name: 'arthur_galindez@gmail.com',
  password: '123456'
)
u4 = User.create!(
  id: 10_004,
  name: 'jrodriguez@gmail.com',
  password: '123456'
)
u5 = User.create!(
  id: 10_005,
  name: 'jantin@gmail.com',
  password: '123456'
)
u6 = User.create!(
  id: 10_006,
  name: 'flopez@gmail.com',
  password: '123456'
)
u7 = User.create!(
  id: 10_007,
  name: 'llopez@gmail.com',
  password: '123456'
)
u8 = User.create!(
  id: 10_008,
  name: 'alopez@gmail.com',
  password: '123456'
)
u9 = User.create!(
  id: 10_009,
  name: 'facuaguilar@gmail.com',
  password: '123456'
)
u10 = User.create!(
  id: 100_010,
  name: 'leanbalvin@gmail.com',
  password: '123456'
)
u11 = User.create!(
  id: 100_011,
  name: 'laueche@gmail.com',
  password: '123456'
)
u12 = User.create!(
  id: 100_012,
  name: 'julificco@gmail.com',
  password: '123456'
)
u13 = User.create!(
  id: 100_013,
  name: 'fatimag@gmail.com',
  password: '123456'
)
u14 = User.create!(
  id: 100_014,
  name: 'jfantino@gmail.com',
  password: '123456'
)

h1 = Holder.create!(
  id: 10_001,
  name: 'José',
  last_name: 'Argento',
  email: 'pepe.arg@gmail.com',
  user_id: 10_001
)

h2 = Holder.create!(
  id: 10_002,
  name: 'Mónica',
  last_name: 'Galindez',
  email: 'monigali@gmail.com',
  user: u2
)

_h3 = Holder.create!(
  id: 10_003,
  name: 'Arturo',
  last_name: 'Galindez',
  email: 'arthur_galindez@gmail.com',
  user: u3
)

_a1 = AdminUser.create!(
  id: 10_001,
  name: 'José',
  last_name: 'Argento',
  email: 'pepe.arg@gmail.com',
  user: u1
)

_a2 = AdminUser.create!(
  id: 10_002,
  name: 'Jorge',
  last_name: 'Rodriguez',
  email: 'jrodriguez@gmail.com',
  user: u4
)

_a3 = AdminUser.create!(
  id: 10_003,
  name: 'Julia',
  last_name: 'Antin',
  email: 'jantin@gmail.com',
  user: u5
)

_e1 = Employee.create!(
  id: 10_001,
  name: 'Federico',
  last_name: 'Lopez',
  email: 'flopez@gmail.com',
  rol: 'Maestro',
  user: u6,
  employee_code: 1001,
  employee_code: 1001,
  start_date: '2007-02-10T00:00:00Z',
  cuil: '20153869182',
  gender: 'm',
  birthdate: '1965-05-10T00:00:00Z'
)

_e2 = Employee.create!(
  id: 10_002,
  name: 'Leandro',
  last_name: 'Lopez',
  email: 'llopez@gmail.com',
  rol: 'Director',
  user: u7,
  employee_code: 1000,
  start_date: '2003-02-04T00:00:00Z',
  cuil: '20123829183',
  gender: 'm',
  birthdate: '1962-05-20T00:00:00Z'
)

_e3 = Employee.create!(
  id: 10_003,
  name: 'Agustina',
  last_name: 'Lopez',
  email: 'alopez@gmail.com',
  rol: 'Secretaria',
  user: u8,
  employee_code: 1011,
  start_date: '2017-04-19T00:00:00Z',
  cuil: '20353863452',
  gender: 'f',
  birthdate: '1992-09-14T00:00:00Z'
)

s1 = Student.create!(
  id: 10_001,
  name: 'Facundo',
  last_name: 'Aguilar',
  email: 'facuaguilar@gmail.com',
  user: u9,
  holder: h1
)

s2 = Student.create!(
  id: 10_002,
  name: 'Laureano',
  last_name: 'Balvin',
  phone: '15601560',
  email: 'leanbalvin@gmail.com',
  user: u10,
  holder: h2
)

s3 = Student.create!(
  id: 10_003,
  name: 'Laura',
  last_name: 'Echeverria',
  email: 'laueche@gmail.com',
  user: u11,
  holder: h2
)

s4 = Student.create!(
  id: 10_004,
  name: 'Julieta',
  last_name: 'Ficco',
  phone: '15459007',
  email: 'julificco@gmail.com',
  user: u12,
  holder: h1
)

s5 = Student.create!(
  id: 10_005,
  name: 'Fátima',
  last_name: 'Guido',
  email: 'fatimag@gmail.com',
  user: u13,
  holder: h1
)

s6 = Student.create!(
  id: 10_006,
  name: 'Julian',
  last_name: 'Fantino',
  phone: '4304303',
  email: 'jfantino@gmail.com',
  user: u14,
  holder: h2
)

serv1 = Service.create!(
  id: 10_001,
  name: 'Escolaridad simple',
  description: 'Turno de 5 hs.',
  price: 1000
)

serv2 = Service.create!(
  id: 10_002,
  name: 'Doble escolaridad',
  description: 'Turno de 8 hs.',
  price: 1900
)

serv3 = Service.create!(
  id: 10_003,
  name: 'Ingles',
  description: '2 hs semanales.',
  price: 270
)

serv4 = Service.create!(
  id: 10_004,
  name: 'Computación',
  description: '2 hs semanales.',
  price: 270
)

serv5 = Service.create!(
  id: 10_005,
  name: 'Almuerzo',
  description: 'Platos del día.',
  price: 70
)

serv6 = Service.create!(
  id: 10_006,
  name: 'Desayuno',
  description: 'Café con 2 medialunas.',
  price: 30
)

serv7 = Service.create!(
  id: 10_007,
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

s4.services << serv2
s4.services << serv4
s4.services << serv6
s4.save

s5.services << serv1
s5.services << serv4
s5.services << serv5
s5.save

s6.services << serv1
s6.services << serv4
s6.services << serv7
s6.save
