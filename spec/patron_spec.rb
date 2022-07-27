require './lib/patron'

RSpec.describe Patron do
  before :each do
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'can create instance of Patron' do
    expect(@patron_1).to be_instance_of(Patron)
  end

  it 'can access patron name' do
    expect(@patron_1.name).to eq("Bob")
  end

  it 'can access patron spending money' do
    expect(@patron_1.spending_money).to eq(20)
  end

  xit 'can access patron interests array' do
    expect(@patron_1.interests).to eq([])
  end

  xit 'can add interests to interest array' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end


end
