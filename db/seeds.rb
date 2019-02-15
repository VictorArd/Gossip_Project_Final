require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p '#' * 60
p 'DESTRUCTION DE LA BASE DE DONNEE EXISTANTE'
p '#' * 60

User.destroy_all
p 'Base de donnée des Utilisateurs détruite avec succès'

p '*' * 60

City.destroy_all
p 'Base de donnée des Villes détruite avec succès'

p '*' * 60

Comment.destroy_all
p 'Base de donnée des Commentaires détruite avec succès'

p '*' * 60

Gossip.destroy_all
p 'Base de donnée des Potins détruite avec succès'

p '*' * 60

Like.destroy_all
p 'Base de donnée des Likes détruite avec succès'

p '*' * 60

PrivateMessage.destroy_all
p 'Base de donnée des Messages privées détruite avec succès'

p '*' * 60

Tag.destroy_all
p 'Base de donnée des Tags détruite avec succès'

p '#' * 60
p 'CREATION DE LA NOUVELLE BASE DE DONNEE'
p '#' * 60

  10.times do
  City.create!( name: Faker::Address.unique.city,
                zip_code: Faker::Address.unique.zip
              )
  end
  p 'Création de 10 Villes dans la BD'

  p '*' * 60

  10.times do
  User.create!( first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                description: Faker::Quote.unique.matz,
                email: Faker::Internet.unique.email,
                age: Faker::Number.within(1..60),
                city_id: rand(City.first.id..City.last.id)
              )
  end
  p 'Création de 10 Utilisateurs dans la BD'

  p '*' * 60

  10.times do
  Gossip.create!( title: Faker::Book.title,
                  content: Faker::Marketing.buzzwords,
                  user_id: rand(User.first.id..User.last.id)
              )
  end
  p 'Création de 10 Potins dans la BD'

  p '*' * 60

  5.times do
  Tag.create!(  title: Faker::Book.title,
                gossip_id: rand(Gossip.first.id..Gossip.last.id)
              )
  end
  p 'Création de 10 Tags dans la BD'

  p '*' * 60

  10.times do
  Comment.create!(  content: Faker::Quote.unique.yoda,
                    gossip_id: rand(Gossip.first.id..Gossip.last.id),
                    user_id: rand(User.first.id..User.last.id)
                  )
  end
  p 'Création de 10 Commentaires sur un Potin dans la BD'

  p '*' * 60

  5.times do
  Like.create!( user_id: rand(User.first.id..User.last.id),
                gossip_id: rand(Gossip.first.id..Gossip.last.id),
              )
  end
  p 'Création de 5 Likes sur un Potin dans la BD'

  p '*' * 60

  5.times do
  Like.create!( user_id: rand(User.first.id..User.last.id),
                comment_id: rand(Comment.first.id..Comment.last.id),
              )
  end
  p 'Création de 5 Likes sur un Commentaire dans la BD'

  p '*' * 60

  5.times do
  private_message = PrivateMessage.create!( sender_id: rand(User.first.id..User.last.id),
                                            recipient_id: rand(User.first.id..User.last.id)
                                          )
  end
  p 'Création de Messages Privées dans la BD'

  p '#' * 60
