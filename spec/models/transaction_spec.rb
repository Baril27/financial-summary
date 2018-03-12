require 'rails_helper'

describe Transaction do
  subject { build(:transaction) }

  it 'is immutable' do
    subject.save
    expect(subject.readonly?).to be true
    expect(Transaction.find(subject.id).readonly?).to be true
  end

  it 'has [deposit, refund, withdraw] as categories' do
    %i(deposit refund withdraw).each do |category|
      subject.category = category
      expect(subject.valid?).to eq(true)
    end
  end

  it 'must have greater than zero amount' do
    subject.amount = Money.from_amount(0, :usd)
    expect(subject.valid?).to eq(false)

    subject.amount = Money.from_amount(-1, :usd)
    expect(subject.valid?).to eq(false)

    subject.amount = Money.from_amount(0.01, :usd)
    expect(subject.valid?).to eq(true)
  end
end
