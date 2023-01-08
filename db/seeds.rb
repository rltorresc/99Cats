# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Cat.new(birth_date: '2015/01/20', color: 'black', name: 'Sami', sex: 'M', description: 'Un gato negro poco sociable').save
Cat.new(birth_date: '2020/02/02', color: 'grey', name: 'Una', sex: 'M', description: 'Un gato gris muy pesado').save
Cat.new(birth_date: '2010/02/02', color: 'grey', name: 'Runa', sex: 'F', description: 'Un gato gris muy dormilon').save
Cat.new(birth_date: '2008/01/02', color: 'orange', name: 'Margarita', sex: 'F', description: 'El mejor gato del mundo').save