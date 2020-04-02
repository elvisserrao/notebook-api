require 'rails_helper'

describe ContactsController, type: :controller do
  contact = Contact.last

  it 'GET contacts/:id' do
    request.accept = 'application/vnd.api+json'
    get :show, params: {id: contact.id}

    response_body = JSON.parse(response.body)

    expect(response_body.fetch('data').fetch('id')).to eq(contact.id.to_s)
    expect(response_body.fetch('data').fetch('attributes').fetch('name')).to eq(contact.name)

  end

end
