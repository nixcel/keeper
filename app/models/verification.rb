class Verification < ActiveRecord::Base
  
  has_many  :transactions, :dependent => :destroy
  
  validates_presence_of :date, :description
  validate :date_cannot_be_in_the_future
  
  after_update :save_transactions
  
  def new_transactions_attr=(transaction_attr)
    transaction_attr.each do |attr|
      transactions.build(attr)
    end
  end
  
  def existing_transactions_attr=(transaction_attr)
    transactions.reject(&:new_record?).each do |transaction|
      attributes = transaction_attr[transaction.id.to_s]
      if attributes
        transaction.attributes = attributes
      else
        transactions.delete(transaction)
      end
    end
  end
  
  def save_transactions
    transactions.each do |transaction|
      transaction.save(false)
    end
  end
  
  def transaction_attr=(transaction_attr)
    transaction_attr.each do |attr|
      transactions.build(attr)
    end
  end
  
  protected
    def date_cannot_be_in_the_future
      errors.add(:date, 'cannot be in the future') if date.to_s > Date.today.to_s
    end
end
