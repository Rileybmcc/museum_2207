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
    @patron_3 = Patron.new("Johnny", 5)

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

  it 'can access patrons array' do
    expect(@dmns.patrons).to eq([])
  end


  it 'can admit patrons' do
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    @dmns.patrons
  end

  it 'can display patrons by interests' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")

    expect(@dmns.patrons_by_exhibit_interest.class).to eq(Hash)
    # # expect(@dmns.patrons_by_exhibit_interest).to eq({#<Exhibit:0x00007ff32a165178 @cost=0, @name="Gems and Minerals">=>
    # [#<Patron:0x00007ff32a164d18 @interests=["Gems and Minerals", "Dead Sea Scrolls"], @name="Bob", @spending_money=20>],
    # #<Exhibit:0x00007ff32a164f48 @cost=10, @name="Dead Sea Scrolls">=>
    # [#<Patron:0x00007ff32a164d18 @interests=["Gems and Minerals", "Dead Sea Scrolls"], @name="Bob", @spending_money=20>,
    # #<Patron:0x00007ff32a164ae8 @interests=["Dead Sea Scrolls"], @name="Sally", @spending_money=20>,
    # #<Patron:0x00007ff32a1649a8 @interests=["Dead Sea Scrolls"], @name="Johnny", @spending_money=5>],
    # #<Exhibit:0x00007ff32a164e58 @cost=15, @name="IMAX">=>[]})

  end

  it 'can return lottery contestants and choose winner' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")

    expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls).count).to eq(2)
        # => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x6666fb20114megan...>]
    expect(@dmns.draw_lottery_winner(@dead_sea_scrolls).count).to eq(1)
        # => "Johnny" or "Bob" can be returned here. Fun!
    expect(@dmns.draw_lottery_winner(@gems_and_minerals)).to eq(nil)

  end

  xit 'can display winner results' do
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)

    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
        #If no contestants are elgible for the lottery, nil is returned.
    expect(@dmns.announce_lottery_winner(@imax)).to eq("Bob has won the IMAX edhibit lottery")

    # The above string should match exactly, you will need to stub the return of `draw_lottery_winner` as the above method should depend on the return value of `draw_lottery_winner`.
    expect(@dmns.announce_lottery_winner(@gems_and_minerals)).to eq("No winners for this lottery")
  end
end
