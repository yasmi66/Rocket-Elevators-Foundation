# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD

=======
>>>>>>> a9daeb9eabffb946a230306c886bb8b5d262cff4
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

<<<<<<< HEAD

####### ------- Create Addresses ------- ##########


addresses = Address.create(
=======
####### ------- Create Addresses ------- ##########

Address.destroy_all ([
  addresses = Address.create(
>>>>>>> a9daeb9eabffb946a230306c886bb8b5d262cff4
    type_address: address_type[rand(4)],
    status: address_status[rand(2)],
    entity: "entity",
    number_and_street: address['address1'],
    suit_or_apartment: address['address2'],
    city: address['city'],
    postal_code: address['postalCode'],
    country: address["state"],
    notes: Faker::Lorem.paragraph,
<<<<<<< HEAD
)

end
=======
    )
   addresses.save

end
])

Elevator.destroy_all ([
100.times do 

    elevators = Elevator.new(
        serial_nb: Faker::Number.number(digits: 10),
        model: Faker::Commerce.brand,
        type: Faker::Types.rb_string,
        date_commissioning: Faker::Date.in_date_period,
        date_last_inspection: Faker::Date.in_date_period,
        certificate_inspection: Faker::Commerce.brand,
        information: Faker::Company.catch_phrase,
        notes: Faker::Quote.yoda,

    )
    elevators.save

end
])

# Building.destroy_all
# ([
# 100.times do
#     full_address = Faker::Address.full_address
#     name = Faker::Name.name
#     email = Faker::Internet.email
#     phone1 = Faker::PhoneNumber.cell_phone,
#     name2 = Faker::Name.name
#     email2 = Faker::Internet.email
#     phone2 = Faker::PhoneNumber.cell_phone
#     building = Building.new(
#         AdressBuilding: full_address,
#         FullNameBuildingAdmin: name,
#         EmailAdminBuilding: email,
#         PhoneNumberBuildingAdmin: phone1,
#         FullNameTechContact: name2,
#         TechContactEmail: email2,
#         TechContactPhone: phone2
#     )
#     building.save
# end
# ])

# Battery.destroy_all
# ([
# 100.times do
#     battery = Battery.new(
#         buildingType: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#         status: ["Active", "Inactive"].sample,
#         employee_id: Faker::Number.number(digits: 1),
#         date_commissioning: Faker::Date.in_date_period,
#         date_last_inspection: Faker::Date.in_date_period,
#         certificate_operations: Faker::Lorem.sentence,
#         information: Faker::Lorem.sentence,
#         notes: Faker::Lorem.sentence
#         )
#         battery.save
# end
# ])

# Customer.destroy_all
# ([
# 100.times do
#     customer = Customer.new(
#         CustomerCreationDate: Faker::Date.in_date_period,
#         CompanyName: Faker::Company.name,
#         FullNameCompanyContact: Faker::Name.name,
#         CompanyContactPhone: Faker::PhoneNumber.cell_phone,
#         EmailCompanyContact: Faker::Internet.email,
#         CompanyDescription: Faker::Lorem.sentence,
#         FullNameServiceTechnicalAuth: Faker::Name.name,
#         TechnicalAuthorityPhoneService: Faker::PhoneNumber.cell_phone,
#         TechnicalManagerEmailService: Faker::Internet.email
#         )
#         customer.save
#     end
# ])

# Columns.destroy_all
# ([
# 100.times do
#     columns = Columns.new(
#         type: ..,
#         served_floors_nb: ..,
#         status: ["Active", "Inactive"].sample,
#         information: Faker::Lorem.sentence,
#         notes: Faker::Lorem.sentence,

#         )
#         columns.save
#     end
# ])

# Building_details.destroy_all
# ([
# 100.times do
#     building_details = Building_details.new(
#         building: ..,
#         information_key: ..,
#         value: ..,

#         )
#         building_details.save
#     end
# ])






>>>>>>> a9daeb9eabffb946a230306c886bb8b5d262cff4
