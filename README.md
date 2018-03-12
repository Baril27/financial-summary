# Interviews - Financial Summary

## Overview

This is a fairly typical and small rails project.

- database: sqlite3
- test framework: rspec

The project contains the following models:

- User
    - Represents an end-user identified by an email
    - Has many wallets
- Wallet
    - Contains a money balance (amount, currency)
    - Belongs to a user
- Transaction
    - A financial transaction performed by a user
    - Contains a money amount (amount, currency)
    - Described by a category (deposit, refund, withdraw)
    - Belongs to a user
    - Example: a transaction for a deposit that placed $5 USD into a user's wallet
- Financial Summary
    - A summary of count and amount of deposits, withdraws, refunds for a given user and currency
    - A summary spans over one day, seven days and a lifetime of a user's transactions

## The Problem

Implement the logic for the `FinancialSummary`.
There are pending specs that you should make pass.
The specs are non-exhaustive (hint hint).

## Installation

You will need:

- ruby 2.4.2
- bundler

Assuming you have ruby installed, install bundler:

```
$ gem install bundler
```

`cd` to the project dir and install dependencies:

```
$ bundle
```

Run specs:

```
$ bundle exec rspec
```

## Submission

Push this entire project (with your changes) onto Github and send us the link to the repo.

## Remarks

This project does not expose the `FinancialSummary` as an API or html.
If you want to expose it, then feel free. There is no "extra credit" for doing so.
It would just another thing that we can discuss after submission.
