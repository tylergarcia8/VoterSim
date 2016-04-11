# require './Test.rb'
require './voter.rb'
require './politician.rb'

class VoterSim
  def initialize
    @voter = []
    @politician = []
    start
  end

# puts `clear`

  def start
  	puts "========================="
    puts 'Welcome to Voter Sim!'
    # `say "Welcome to Voter Sim"`
  	main_menu
  end

  def main_menu
    puts 'What would you like to do?'
    # `say "What would you like to do?"`
    puts "========================="
    user_input("1. Make voters profile\n2. Create politician\n3. List\n",[:voter_prof, :politician_party, :list_people],"1", "2", "3")
  end

    def voter_prof
        # puts `clear`
        puts "Choose your political party"
        user_input("1. Liberal\n2. Tea Party\n3. Conservative\n4. Socialist\n5. Neutral",[:make_voter, :make_voter, :make_voter, :make_voter, :make_voter],"1", "2", "3", "4", "5")
    end

    def politician_party
        # puts `clear`
        # `say "Democrat or Republican?"`
        puts "Politician party: "
        user_input("1. Democrat\n2. Republican\n",[:make_politician, :make_politician],"1","2")
    end

    def list_people
    	# puts `clear`
        @voter.map do |v|
            puts "=============="
            puts "#{v.name}: #{v.pref_party}"
            puts "=============="
        end
            @politician.map do |a|
                puts "=============="
                puts "#{a.name}: #{a.pref_party}"
                puts "=============="
        end
        puts "1. Continue\n2. Register another voter\n3. Delete\n4. Exit"
        input = gets.chomp.downcase
        if input == '1'
            main_menu
        elsif input =='2'
            new_voter
        elsif input == '3'
        	delete_person
        else input == '4'
            # `say "goodbye"`
            puts "Goodbye"
        end
    end

    def make_voter
    	# puts `clear`
        # `say "Voter's name"`
        puts "Voter name: "
        voter_name = gets.chomp.capitalize
        @voter << Voter.new(voter_name, @voter_prof)
        puts "================="
        puts @voter
        puts "================="
         @voter.each do |f|
         puts f.name.capitalize
         puts "================"
        end
        voter_made
    end

        def voter_made
        @voter.map do |f|
        	# puts `clear`
        	puts "================"
             puts "Voter name: " + f.name.capitalize
             puts "Political party: " + f.pref_party
        end
        # `say "Thank you for registering"`
        puts "Thank you for registering!"
        puts "=================="
        puts "1. Main Menu\n2. Register another voter\n3. List\n4. Exit\n"
        input = gets.chomp.downcase
        if input =='1'
        	main_menu
        elsif input == '2'
            voter_prof
        elsif input == '3'
        	list_people
        else input == '4'
            # `say "Goodbye"`
            puts "Goodbye"
        end
    end

    def delete_person
    	user_input("1. Delete voter?\n2. Delete politician?",[:delete_voter, :delete_pol],"1","2")
    end

    def delete_voter
    	# puts `clear`
    	puts "What voter would you like to delete?"
        @voter.map do |v|
            puts "=============="
            puts "#{v.name}: #{v.pref_party}"
            puts "=============="
        end
        puts "Please type the voters name"
        input = gets.chomp.capitalize
        found_somebody = false
        @voter.each_with_index do |value, index|
            # puts "value.person is: >#{value.name}<"
            # puts "input is #{input}"
            if input == value.name
                puts "found a match! now I will delete it"
                @voter.delete_at(index)
                found_somebody = true
            end
        end
        unless found_somebody
            puts "Name not found in database"
            puts "Please try again"
            delete_voter
        end
        main_menu
    end

    def delete_pol
        # puts `clear`
        puts "What politician would you like to delete?"
        @politician.map do |p|
            puts "=============="
            puts "#{p.name}: #{p.pref_party}"
            puts "=============="
        end
        puts "Please type the politicians name"
        input = gets.chomp.capitalize
        found_somebody = false
        @politician.each_with_index do |value, index|
            # puts "value.person is: >#{value.name}<"
            # puts "input is #{input}"
            if input == value.name
                puts "found a match! now I will delete it"
                @politician.delete_at(index)
                found_somebody = true
            end
        end
        unless found_somebody
            puts "Name not found in database"
            puts "Please try again"
            delete_pol
        end
        main_menu
    end

    def new_voter
    	# `say "voter name"`
        user_input("Choose:\n(V)oter name?",[:make_voter],"v")
        puts "=================="
        puts "1. Continue\n2. Register another voter\n3. Exit\n"
        input = gets.chomp.downcase
        if input == '1'
            main_menu
        elsif input =='2'
            new_voter
        else input == '3'
            # `say "goodbye"`
            puts "Goodbye"
        end
    end

     def make_politician
        puts "Enter name of Politician: "
        pol_name = gets.chomp.capitalize
        # @pol_party is on the user_input method
         @politician << Politician.new(pol_name , @pol_party)
         p "================="
        p @politician
        p "================="
         @politician.map do |a|
             # puts `clear`
             puts "==============="
         puts "Politician name: " + a.name
         puts "Political party: " + a.pref_party
        end
    politician_made
    end

  def vote_again
      user_input("(P)oltician name?\n",[:make_politician],"p")
  end

    def politician_made
        puts "================="
        puts "1. Main Menu\n2. Vote for this Candidate?\n3. Create another politician?\n4. List\n5. Exit?\n"
        input = gets.chomp.downcase
        if input == '1'
        main_menu
        elsif input == '2'
        # `say "thank you for your vote"`
        puts "Thank you for your vote!"
        # `say "goodbye"`
        puts "Goodbye."
        elsif input == '3'
            make_politician
        elsif input == '4'
            list_people
        else input == '5'
            puts "Goodbye"
        end
    end

    def user_input(question, options=[], *possible_answers)
        answer = nil
        until answer
            puts question
            input = gets.chomp.downcase
            possible_answers.each_with_index do |user_answer, index|
                if input == user_answer
                    answer = index
                end
            end
        end
        @pol_party = Politician.choose_pol(input)
        @voter_prof = Voter.choose_voter(input)
        send(options[answer])
    end
end

VoterSim.new