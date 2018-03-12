require 'rails_helper'

describe User do
  it 'requires a valid email' do
    expect(User.new(email: nil).valid?).to eq(false)
    expect(User.new(email: '').valid?).to eq(false)
    expect(User.new(email: 'foo@').valid?).to eq(false)
    expect(User.new(email: 'foo@example.org').valid?).to eq(true)
  end
end