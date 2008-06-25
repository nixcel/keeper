class AddTestCostcenters < ActiveRecord::Migration
  def self.up
    Costcenter.delete_all
    Costcenter.create(:name => 'Datorer',                     :account => 1250, :sru => 236)
    Costcenter.create(:name => 'Kassa',                       :account => 1910, :sru => 200)
    Costcenter.create(:name => 'Plusgiro',                    :account => 1920, :sru => 200)
    Costcenter.create(:name => 'Bankkonto',                   :account => 1940, :sru => 200)
    Costcenter.create(:name => 'Utgående moms 25%',           :account => 2610, :sru => 307)
    Costcenter.create(:name => 'Försäljning',                 :account => 3010, :sru => 400)
    Costcenter.create(:name => 'Förbrukningsinventarier',     :account => 5410, :sru => 531)
    Costcenter.create(:name => 'Resekostnader',               :account => 5800, :sru => 538)
    Costcenter.create(:name => 'Reklam och PR',               :account => 5900, :sru => 541)
    Costcenter.create(:name => 'Kundfordringar',              :account => 1510, :sru => 204)
    Costcenter.create(:name => 'Uttag av eget kapital',       :account => 2013, :sru => 364)
    Costcenter.create(:name => 'Insättning av eget kapital',  :account => 5900, :sru => 366)
    Costcenter.create(:name => 'Eget kapital',                :account => 2010, :sru => 360)
    Costcenter.create(:name => 'Ingående moms',               :account => 2640, :sru => 307)
  end

  def self.down
    Costcenter.delete_all
  end
end
