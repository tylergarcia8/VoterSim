require './usa.rb'

class Politician < Usa

  def self.choose_pol(party)
    if party == "d"
      "Democrat"
    else party == "r"
      "Republican"
    end
  end
end