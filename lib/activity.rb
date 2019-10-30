class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, total_cost)
    @participants[name] = total_cost
  end

  def total_cost
    @participants.sum { |key, value| value }
  end

  def split
    total_cost / @participants.keys.length
  end

  def owed
    owed = Hash.new
    @participants.each do |key, value|
      owed[key] = split - value
    end
    owed
  end

end
