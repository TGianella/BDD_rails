# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
JoinTableDoctorSpecialty.destroy_all

['Immunology', 'Cardiology', 'Dermatology', 'Endocrinology', 'Gastroenterology',
 'Neurology', 'Ophtalmology', 'Physical medicine', 'Psychiatry', 'General medicine'].each do |specialty|
  Specialty.create(name: specialty)
end

100.times do |i|
  City.create(name: Faker::Address.unique.city)
  Doctor.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                zip_code: Faker::Address.zip_code,
                city: City.all.sample)
  Patient.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 city: City.all.sample)
  JoinTableDoctorSpecialty.create(specialty: Specialty.all.sample,
                                  doctor: Doctor.find(i + 1))
end

300.times do |_i|
  JoinTableDoctorSpecialty.create(specialty: Specialty.all.sample,
                                  doctor: Doctor.all.sample)
end

JoinTableDoctorSpecialty.dedupe

1000.times do |_i|
  doctor = Doctor.all.sample
  Appointment.create(patient: Patient.all.sample,
                     doctor: doctor,
                     date: Faker::Date.in_date_period,
                     city: doctor.city)
end
