require './usa.rb'

class Voter < Usa

  def self.choose_voter(party_v)
    if party_v == "1"
      "Liberal"
    elsif party_v == "2"
      "Tea Party"
  	elsif party_v == "3"
  	  "Conservative"
  	elsif party_v == "4"
  	  "Socialist"
  	else party_v == "5"
  	  "Neutral"
    end
  end
end