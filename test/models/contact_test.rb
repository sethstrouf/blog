require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'email cannot be blank' do
    contact = Contact.create(email: '', message: 'Message here!')
    assert contact.invalid?
  end

  test 'email must be valid' do
    contact = Contact.create(email: 'example@mail', message: 'Message here!')
    assert contact.invalid?
  end

  test 'message cannot be blank' do
    contact = Contact.create(email: 'example@email.com', message: '')
    assert contact.invalid?
  end
end
