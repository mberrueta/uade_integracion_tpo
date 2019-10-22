# frozen_string_literal: true

Service.destroy_all
Student.destroy_all
AdminUser.destroy_all
Employee.destroy_all
Holder.destroy_all
User.destroy_all

u1 = User.create!(id: 1, name: 'José', password: '123456')
u2 = User.create!(id: 2, name: 'Mónica', password: '123456')
u3 = User.create!(id: 3, name: 'Arturo', password: '123456')
u4 = User.create!(id: 4, name: 'Jorge', password: '123456')
u5 = User.create!(id: 5, name: 'Julia', password: '123456')
u6 = User.create!(id: 6, name: 'Federico', password: '123456')
u7 = User.create!(id: 7, name: 'Leandro', password: '123456')
u8 = User.create!(id: 8, name: 'Agustina', password: '123456')
u9 = User.create!(id: 9, name: 'Facundo', password: '123456')
u10 = User.create!(id: 10, name: 'Laureano', password: '123456')
u11 = User.create!(id: 11, name: 'Laura', password: '123456')
u12 = User.create!(id: 12, name: 'Julieta', password: '123456')
u13 = User.create!(id: 13, name: 'Fatima', password: '123456')
u14 = User.create!(id: 14, name: 'Julian', password: '123456')

h1 = Holder.create!(
  id: 1,
  name: 'José',
  last_name: 'Argento',
  email: 'pepe.arg@gmail.com',
  user: u1
)

h2 = Holder.create!(
  id: 2,
  name: 'Mónica',
  last_name: 'Galindez',
  email: 'monigali@gmail.com',
  user: u2
)

h3 = Holder.create!(
  id: 3,
  name: 'Arturo',
  last_name: 'Galindez',
  email: 'arthur_galindez@gmail.com',
  user: u3
)

a1 = AdminUser.create!(
  id: 1,
  name: 'José',
  last_name: 'Argento',
  email: 'pepe.arg@gmail.com',
  user: u1
)

a2 = AdminUser.create!(
  id: 2,
  name: 'Jorge',
  last_name: 'Rodriguez',
  email: 'jrodriguez@gmail.com',
  user: u4
)

a3 = AdminUser.create!(
  id: 3,
  name: 'Julia',
  last_name: 'Antin',
  email: 'jantin@gmail.com',
  user: u5
)

e1 = Employee.create!(
  id: 1,
  name: 'Federico',
  last_name: 'Lopez',
  email: 'flopez@gmail.com',
  user: u6
)

e2 = Employee.create!(
  id: 2,
  name: 'Leandro',
  last_name: 'Lopez',
  email: 'llopez@gmail.com',
  user: u7
)

e3 = Employee.create!(
  id: 3,
  name: 'Agustina',
  last_name: 'Lopez',
  email: 'alopez@gmail.com',
  user: u8
)

s1 = Student.create!(
  id: 1,
  name: 'Facundo',
  last_name: 'Aguilar',
  email: 'facuaguilar@gmail.com',
  user: u9,
  holder: h1
)

s2 = Student.create!(
  id: 2,
  name: 'Laureano',
  last_name: 'Balvin',
  email: 'leanbalvin@gmail.com',
  user: u10,
  holder: h2
)

s3 = Student.create!(
  id: 3,
  name: 'Laura',
  last_name: 'Echeverria',
  email: 'laueche@gmail.com',
  user: u11,
  holder: h2
)

s4 = Student.create!(
  id: 4,
  name: 'Julieta',
  last_name: 'Ficco',
  email: 'julificco@gmail.com',
  user: u12,
  holder: h1
)

s5 = Student.create!(
  id: 5,
  name: 'Fátima',
  last_name: 'Guido',
  email: 'fatimag@gmail.com',
  user: u13,
  holder: h1
)

s6 = Student.create!(
  id: 6,
  name: 'Julian',
  last_name: 'Fantino',
  email: 'jfantino@gmail.com',
  user: u14,
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
  description: 'Café con 2 medialunas.',
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