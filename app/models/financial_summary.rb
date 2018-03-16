class FinancialSummary

  class << self

    attr_accessor :transactions

    def one_day params
      self.transactions = get_transactions(params).where('created_at >= ?', 1.day.ago)
      self
    end

    def seven_days params
      self.transactions = get_transactions(params).where('created_at >= ?', 7.days.ago)
      self
    end

    def lifetime params
      self.transactions = get_transactions(params)
      self
    end

    def count category
      transactions.where(category: category).count
    end

    def amount category
      transactions.where(category: category).sum(&:amount)
    end

    private

    def get_transactions params
      Transaction.where(user: user(params), amount_currency: currency(params))
    end

    def user params
      params[:user]
    end

    def currency params
      params[:currency].to_s.upcase
    end
  end

end
