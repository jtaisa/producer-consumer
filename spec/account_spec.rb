require_relative '../account'
require_relative '../transaction'

RSpec.describe Account do

  it 'not apply transaction if transaction account id not match' do
    acc = Account.new 100
    txn = Transaction.new 'id','otherid', TransactionType::PAYMENT, 10
    acc.apply(txn)
    expect(acc.balance).to eq(acc.balance)
  end

  it 'apply payment transaction and returns new account object' do
    acc = Account.new 100
    txn = Transaction.new 'id', acc.id, TransactionType::PAYMENT, 50
    acc.apply(txn)
    expect(acc.balance).to eq(50)
  end

  it 'apply topup transaction and returns new account object' do
    acc = Account.new 100
    txn = Transaction.new 'id', acc.id, TransactionType::TOPUP, 100
    acc.apply(txn)
    expect(acc.balance).to eq(200)
  end

end
