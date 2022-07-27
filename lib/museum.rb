
class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(new_thing)
    @exhibits << new_thing
  end

  def recommend_exhibits(dude)
    return_me = []
    dude.interests.each do |interest|
      @exhibits.each { |exhibit| return_me << exhibit.name if exhibit.name.downcase == interest.downcase }

    end
    return_me
  end

end
