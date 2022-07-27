require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do

  before :each do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # @patron_1 = Patron.new("Bob", 20)
  end

  it 'can create instance of Exhibit' do
    expect(@exhibit).to be_instance_of(Exhibit)
  end

  it 'can access exhibit name' do
    expect(@exhibit.name).to eq("Gems and Minerals")
  end

  it 'can access exhibit cost' do
    expect(@exhibit.cost).to eq(0)
  end

  xit 'can create instance of Patron' do
    expect(@patron_1).to be_instance_of(Patron)
  end

  xit 'can access patron name' do
    @patron_1.name.to eq("Bob")
  end

  xit 'can access patron spending money' do
    @patron_1.spending_money.to eq(20)
  end

  xit 'can access patron interests array' do
    @patron_1.interests.to eq([])
  end

  xit 'can add interests to interest array' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    @patron_1.interests.to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

end
