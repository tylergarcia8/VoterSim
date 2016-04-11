class Usa

  attr_accessor :name, :pref_party, :voter_name

  def initialize(name, pref_party, *voter_name)
  	@voter_name = voter_name
     @name = name
    @pref_party = pref_party
  end

end