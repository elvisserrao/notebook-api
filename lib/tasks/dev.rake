# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  puts 'Gerando dados...'
  task setup: :environment do
    
    %x(rails db:drop db:create db:migrate)

    kinds = %w[Amigo Trabalho Familia Conhecido]
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

    puts 'Cadastrando os telefones...'

    Contact.all.each do |contact|
      Random.rand(5).times do |_i|
        phone = Phone.create!(number: Faker::PhoneNumber.phone_number)
        contact.phones << phone
        contact.save!
      end
    end

    puts 'Cadastrando os endereços...'

    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )

    end
  end
end
