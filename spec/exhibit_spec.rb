require './lib/exhibit'


RSpec.describe Exhibit and Patron do

  before :each do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
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

  

end
