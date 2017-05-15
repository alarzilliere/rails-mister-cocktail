# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Ingredient.destroy_all

# aller chercher json

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

json_string = open(url).read

# parser json

ingredients_attributes = JSON.parse(json_string)['drinks']

#itérer et créer les ingrédients
ingredients_attributes.each do |ingredient_attribute|
  Ingredient.create!(name: ingredient_attribute['strIngredient1'])
end
print '.'



puts 'creating ingredient'

puts 'Creating cocktails...'

cocktails_attributes = [
{
name: "Sex on the beach"
},
{
name: "Mojito"
},
{
name: "The headshot"
}
]


Cocktail.create!(cocktails_attributes)
puts 'Finished!'
