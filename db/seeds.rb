# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'pry'

Ticket.destroy_all
Flight.destroy_all
Employee.destroy_all
Passenger.destroy_all
Airline.destroy_all

passenger1 = Passenger.create(first_name: "Hanna", last_name: "Mulugeta", username: "hmulugeta", password: "123456", age: 28)
passenger2 = Passenger.create(first_name: "David", last_name: "Polcari", username: "dpolcari", password: "123456", age: 28)

airline1 = Airline.create(name: "United", code: "UA")
airline2 = Airline.create(name: "Delta", code: "DL")
airline3 = Airline.create(name: "Southwest", code: "SW")
airline4 = Airline.create(name: "American", code: "AA")
airline5 = Airline.create(name: "Alaska", code: "AS")


employee1 = Employee.create(airline_id: airline1.id, name: "Sara", username: "Sara12", password: "password")
employee2 = Employee.create(airline_id: airline2.id, name: "Robert", username: "Rober12", password: "password")

csv_text = File.read(Rails.root.join('lib', 'seeds', 'flight_passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    f = Flight.new
    f.airline_id = Airline.all.sample(1)[0].id
    f.origin = row['Flying_From']
    f.destination = row['Flying_To']
    year = row['Scheduled_Departure_From_Start_City'].to_datetime.year
    case year
    when 2017
        f.departure = row['Scheduled_Departure_From_Start_City'].to_datetime + 1460
        f.arrival = row['Scheduled_Arrival_To_Destination'].to_datetime + 1460
    when 2018
        f.departure = row['Scheduled_Departure_From_Start_City'].to_datetime + 1095
        f.arrival = row['Scheduled_Arrival_To_Destination'].to_datetime + 1095
    when 2019
        f.departure = row['Scheduled_Departure_From_Start_City'].to_datetime + 730
        f.arrival = row['Scheduled_Arrival_To_Destination'].to_datetime + 730
    end
    f.price = rand(100..450)
    f.number_of_seats = rand(25..50)
    f.flight_no = row['Flight_Number']
    f.save
end

# flight1 = Flight.create(flight_no: "UA101", airline_id: airline1.id, origin: "Austin", destination: "Washington DC", departure: Time.now.to_datetime, arrival: (Time.now.to_datetime + 0.1), price: 100.00, number_of_seats: 40)
# flight2 = Flight.create(flight_no: "DL323", airline_id: airline2.id, origin: "Houston", destination: "Seattle", departure: Time.now.to_datetime, arrival: (Time.now.to_datetime + 0.2), price: 200.00, number_of_seats: 40)

# ticket1 = Ticket.create(passenger_id: passenger1.id, flight_id: flight1.id, status: "open", number_of_bags: "2", ticket_number: 100)
# ticket2 = Ticket.create(passenger_id: passenger2.id, flight_id: flight2.id, status: "open",  number_of_bags: "1", ticket_number: 101)