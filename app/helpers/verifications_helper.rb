module VerificationsHelper
  def to_c(number)
    number_to_currency(number, :unit => 'SEK', :delimiter => " ", :format => "%n %u")
  end
  
  def find_costcenter(account)
    Costcenter.find(:first, :conditions => [ "account = ?", account ])
  end
  
  def sum_up_transactions(type)
    @verification.transactions.sum(type)
  end
  
  def fields_for_transaction(transaction, &block)
    prefix = transaction.new_record? ? 'new' : 'existing'
    fields_for("verification[#{prefix}_transaction_attr][]", task, &block)
  end
  
  def add_transaction_link(name)
    link_to_function name do |page|
    	page.insert_html :bottom, :transactions, :partial => 'transaction', :object => Transaction.new
    end
  end
end
