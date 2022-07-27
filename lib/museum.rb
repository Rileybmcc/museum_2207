
class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(visitor)
    @patrons << visitor
  end

  def patrons_by_exhibit_interest
    final = Hash.new
    @exhibits.each do |exhibit|
      final[exhibit] = @patrons.select { |guy| guy.interests.map { |thing| thing.downcase}.include?(exhibit.name.downcase) }
    end
    final
  end

end
