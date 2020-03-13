# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  puts 'Gerando dados...'
  task setup: :environment do
    100.times do
      contact = Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 100.years.ago, to: 18.years.ago)
      )
      puts "#{contact.name} was created with email: #{contact.email}"
    end
  end
end
