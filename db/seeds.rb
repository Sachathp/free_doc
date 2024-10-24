require 'faker'

5.times do
    City.create(name: Faker::Address.city)
  end

  specialties = ["Cardiologist", "Dermatologist", "Neurologist", "Pediatrician", "General Practitioner"].map do |specialty|
    Specialty.create(name: specialty)
  end

10.times do
    Doctor.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      specialty: Faker::Job.field, 
      zip_code: Faker::Address.zip_code
    )
  end

  10.times do
    Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    
  end


  50.times do
    Appointment.create(
      date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 30),
      doctor: Doctor.order('RANDOM()').first, 
      patient: Patient.order('RANDOM()').first 
    )
  end