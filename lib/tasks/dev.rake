# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  puts 'Gerando dados...'
  task setup: :environment do
    kinds = ['Amigo', 'Trabalho', 'Familia', 'Conhecido']
    kinds.each do |kind|
      kind = Kind.create!(
        description: kind
      )
      p "O tipo de contato #{kind.description} foi criado!"
    end
    50.times do
      contact = Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 100.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
      puts "#{contact.name} was created with email: #{contact.email}"
    end
  end
end
