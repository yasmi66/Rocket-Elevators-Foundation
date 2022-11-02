# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

require 'json'

file = File.read('addresses.json')

data_hash = JSON.parse(file)

data_hash['addresses'].each do |address|

address_type = ["HOME", "BUSINESS", "BILLING", "SHIPPING"]
address_status = ["ACTIVE", "INACTIVE"]



####### ------- Create Employees ------- ##########

employees = Employee.create([
    {lastName: "Houde", firstName: "Mathieu", title: "Gopher"},
    {lastName: "Thibault", firstName: "Patrick", title: "Maximalist"},
    {lastName: "Patry-Jessop", firstName: "Francis", title: "Captain"},
    {lastName: "Amyot", firstName: "David", title: "The Man"},
    {lastName: "Goupil", firstName: "Marie-Ève", title: "Al Master"},
    {lastName: "Boivin", firstName: "François", title: "The Tank"},
    {lastName: "Wever", firstName: "Timothy", title: "Beard whisperer"},
    {lastName: "Kleinerman", firstName: "Kiril", title: "I <3 Winnipeg"},
    {lastName: "Hartono", firstName: "Felicia", title: "Scrums are too early"},
    {lastName: "Ai", firstName: "Eileen", title: "They really are"},
])


####### ------- Create Addresses ------- ##########


addresses = Address.create(
    type_address: address_type[rand(4)],
    status: address_status[rand(2)],
    entity: "entity",
    number_and_street: address['address1'],
    suit_or_apartment: address['address2'],
    city: address['city'],
    postal_code: address['postalCode'],
    country: address["state"],
    notes: Faker::Lorem.paragraph,
)

end