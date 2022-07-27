class Patron
  attr_reader :name,
              :spending_money

  def initialize(name, moneys)
    @name = name
    @spending_money = moneys
  end


end
