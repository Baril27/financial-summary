require 'rails_helper'

describe FinancialSummary do

  shared_examples "summarizes over one day" do |category|
    let(:category) { category }

    it "for #{category}" do
      user = create(:user)

      Timecop.freeze(Time.now) do
        create(:transaction, user: user, category: category, amount: Money.from_amount(2.12, :usd))
        create(:transaction, user: user, category: category, amount: Money.from_amount(10, :usd))
      end

      Timecop.freeze(2.days.ago) do
        create(:transaction, user: user, category: category)
      end

      subject = FinancialSummary.one_day(user: user, currency: :usd)
      expect(subject.count(category)).to eq(2)
      expect(subject.amount(category)).to eq(Money.from_amount(12.12, :usd))
    end
  end

  shared_examples "summarizes over seven days" do |category|
    let(:category) { category }

    it "for #{category}" do
      user = create(:user)

      Timecop.freeze(5.days.ago) do
        create(:transaction, user: user, category: category, amount: Money.from_amount(2.12, :usd))
        create(:transaction, user: user, category: category, amount: Money.from_amount(10, :usd))
      end

      Timecop.freeze(8.days.ago) do
        create(:transaction, user: user, category: category)
      end

      subject = FinancialSummary.seven_days(user: user, currency: :usd)
      expect(subject.count(category)).to eq(2)
      expect(subject.amount(category)).to eq(Money.from_amount(12.12, :usd))
    end
  end

  shared_examples "summarizes over lifetime" do |category|
    let(:category) { category }

    it "for #{category}" do
      user = create(:user)

      Timecop.freeze(30.days.ago) do
        create(:transaction, user: user, category: category, amount: Money.from_amount(2.12, :usd))
        create(:transaction, user: user, category: category, amount: Money.from_amount(10, :usd))
      end

      Timecop.freeze(8.days.ago) do
        create(:transaction, user: user, category: category)
      end

      subject = FinancialSummary.lifetime(user: user, currency: :usd)
      expect(subject.count(category)).to eq(3)
      expect(subject.amount(category)).to eq(Money.from_amount(13.12, :usd))
    end
  end

  ["deposit", "refund", "withdraw"].each do |category|
    include_examples "summarizes over one day", category
    include_examples "summarizes over seven days", category
    include_examples "summarizes over lifetime", category
  end

end
