class Costcenter < ActiveRecord::Base
  has_many  :transactions
end
