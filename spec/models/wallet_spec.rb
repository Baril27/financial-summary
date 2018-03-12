require 'rails_helper'

describe Wallet do
  subject { build(:wallet) }

  context 'balance' do
    it 'can be added to, subtracted from' do
      subject.balance += Money.from_amount(10.99, subject.balance_currency)
      subject.balance += Money.from_amount(31.56, subject.balance_currency)
      subject.balance += Money.from_amount(5, subject.balance_currency)
      subject.balance -= Money.from_amount(2.22, subject.balance_currency)
      expect(subject.balance).to eq(Money.from_amount(45.33, :usd))
    end

    it 'can be multiplied by, divided by' do
      subject = build(:wallet, balance: Money.from_amount(5, :usd))
      subject.balance *= 3.56
      subject.balance /= 2.345
      subject.balance *= 6.789
      expect(subject.balance).to eq(Money.from_amount(51.5327078891258, :usd))
    end
  end

  it 'only supports usd and cad wallets' do
    subject.balance_currency = :yen
    expect(subject.valid?).to eq(false)

    subject.balance_currency = :cad
    expect(subject.valid?).to eq(true)

    subject.balance_currency = :usd
    expect(subject.valid?).to eq(true)
  end
end
