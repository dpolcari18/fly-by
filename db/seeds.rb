# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ticket.destroy_all
Flight.destroy_all
Employee.destroy_all
Passenger.destroy_all
Airline.destroy_all

passenger1 = Passenger.create(first_name: "Hanna", last_name: "Mulugeta", username: "hmulugeta", password: "123", age: 28)
passenger2 = Passenger.create(first_name: "David", last_name: "Polcari", username: "dpolcari", password: "123", age: 28)

airline1 = Airline.create(name: "United Air", code: "UA")
airline2 = Airline.create(name: "Delta Air ", code: "DL")


employee1 = Employee.create(airline_id: airline1.id, name: "Sara", username: "Sara12", password: "password")
employee2 = Employee.create(airline_id: airline2.id, name: "Robert", username: "Rober12", password: "password")


flight1 = Flight.create(flight_no: "UA101", airline_id: airline1.id, origin: "Austin", destination: "Washington DC", departure: Time.now.to_datetime, arrival: (Time.now.to_datetime + 2), price: 100.00, number_of_seats: 40)
flight2 = Flight.create(flight_no: "DL323", airline_id: airline2.id, origin: "Houston", destination: "Seattle", departure: Time.now.to_datetime, arrival: (Time.now.to_datetime + 5), price: 200.00, number_of_seats: 40)



ticket1 = Ticket.create(passenger_id: passenger1.id, flight_id: flight1.id, status: "open", number_of_bags: "2PC")
ticket2 = Ticket.create(passenger_id: passenger2.id, flight_id: flight2.id, status: "open",  number_of_bags: "1PC")