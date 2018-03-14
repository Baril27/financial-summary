# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# User 1
user1 = User.create(email: "test1@test.com")

Timecop.freeze(Time.now) do
  Transaction.create(user: user1, category: "deposit", amount: Money.from_amount(2.12, :usd))
  Transaction.create(user: user1, category: "deposit", amount: Money.from_amount(10, :usd))
end

Timecop.freeze(2.days.ago) do
  Transaction.create(user: user1, category: "deposit")
end

# User 2
user2 = User.create(email: "test2@test.com")
