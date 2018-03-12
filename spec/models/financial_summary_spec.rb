require 'rails_helper'

describe FinancialSummary do
  it 'summarizes over one day' do
    pending('Not implemented yet')

    user = create(:user)

    Timecop.freeze(Time.now) do
      create(:transaction, user: user, category: :deposit, amount: Money.from_amount(2.12, :usd))
      create(:transaction, user: user, category: :deposit, amount: Money.from_amount(10, :usd))
    end

    Timecop.freeze(2.days.ago) do
      create(:transaction, user: user, category: :deposit)
    end

    subject = FinancialSummary.one_day(user: user, currency: :usd)
    expect(subject.count(:deposit)).to eq(2)
    expect(subject.amount(:deposit)).to eq(Money.from_amount(12.12, :usd))
  end

  it 'summarizes over seven days' do
    pending('Not implemented yet')

    user = create(:user)

    Timecop.freeze(5.days.ago) do
      create(:transaction, user: user, category: :deposit, amount: Money.from_amount(2.12, :usd))
      create(:transaction, user: user, category: :deposit, amount: Money.from_amount(10, :usd))
    end

    Timecop.freeze(8.days.ago) do
      create(:transaction, user: user, category: :deposit)
    end

    subject = FinancialSummary.seven_days(user: user, currency: :usd)
    expect(subject.count(:deposit)).to eq(2)
    expect(subject.amount(:deposit)).to eq(Money.from_amount(12.12, :usd))
  end

  it 'summarizes over lifetime' do
    pending('Not implemented yet')

    user = create(:user)

    Timecop.freeze(30.days.ago) do
      create(:transaction, user: user, category: :deposit, amount: Money.from_amount(2.12, :usd))
      create(:transaction, user: user, category: :deposit, amount: Money.from_amount(10, :usd))
    end

    Timecop.freeze(8.days.ago) do
      create(:transaction, user: user, category: :deposit)
    end

    subject = FinancialSummary.lifetime(user: user, currency: :usd)
    expect(subject.count(:deposit)).to eq(3)
    expect(subject.amount(:deposit)).to eq(Money.from_amount(13.12, :usd))
  end
end
