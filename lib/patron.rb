class Patron
  attr_reader :name,
              :spending_money,
              :interests

  def initialize(name, moneys)
    @name = name
    @spending_money = moneys
    @interests = []
  end

  def add_interest(int)
    @interests << int
  end

end
