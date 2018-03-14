class FinancialSummary

  class << self

    attr_accessor :transactions

    def one_day params
      transactions = Transaction.where(user: user(params), amount_currency: currency(params))
                                .where('created_at >= ?', 1.day.ago)
      self.transactions = transactions
      self
    end

    def seven_days params
      transactions = Transaction.where(user: user(params), amount_currency: currency(params))
                                .where('created_at >= ?', 7.days.ago)
      self.transactions = transactions
      self
    end

    def lifetime params
      transactions = Transaction.where(user: user(params), amount_currency: currency(params))
      self.transactions = transactions
      self
    end

    def count category
      transactions.where(category: category).count
    end

    def amount category
      transactions.where(category: category).sum(&:amount)
    end

    private

    def user params
      params[:user]
    end

    def currency params
      params[:currency].to_s.upcase
    end
  end

end
