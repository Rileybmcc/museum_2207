require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do

  before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)

  end

  it 'can create instance of museum' do
    expect(@dmns).to be_instance_of(Museum)
  end

  it 'can access museum name' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it 'can access exhibits array' do
    expect(@dmns.exhibits).to eq([])
  end

  it 'can add exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    expect(@dmns.exhibits.count).to eq(3)
  end

  it 'can recommend exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    expect(@dmns.recommend_exhibits(@patron_1)).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    expect(@dmns.recommend_exhibits(@patron_2).count).to eq(1)
  end
end
