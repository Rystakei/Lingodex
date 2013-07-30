class Deck < ActiveRecord::Base
	has_many :cards
  belongs_to :user
  accepts_nested_attributes_for :cards, allow_destroy: true
  attr_accessible :name, :subject, :cards_attributes, :correct_answers, :incorrect_answers, :correct_card_indices



  def quiz
    #Displays a key to the user and user has to type in the correct term. 
    #If the term is correct, moves on to next term. 
    #If term is incorrect, user is shown the answer and will be quizzed again. 
    #Keeps track of what cards have been presented to the user. 
    #Keeps track of the words that are wrong. If words are wrong, they remain in the deck. 
    #When all the cards have been answered correctly, user is presented with how many
    #times they got each word wrong and the percentage of words right on the first try. 


    ##Need to make sure flashcard is not in correct_answers array. 

    # pair_number = generate_random_number

    # #question is a random key from @deck)hash
    # question = @deck_hash.keys[pair_number]
    # #correct_answer is the corresponding key
    # correct_answer = @deck_hash.values[pair_number]

    @correct_answers = []
    @incorrect_answers = []
    @correct_card_indices = []


    until @correct_answers.size == self.cards.size
      ##Need to make sure flashcard is not in correct_answers array. 
      card_number = generate_random_number
      
      #question is the card's term
      question = self.cards[card_number].term
      
      #correct_answer is the corresponding definition
      correct_answer = self.cards[card_number].definition

      puts "The card is: #{question}" 
      user_answer = gets.chomp
      puts " \n \n \n" 


      if user_answer == correct_answer.strip.downcase
        #Put user_answers
        @correct_answers << user_answer
        @correct_card_indices<< card_number
        puts "You got it right!"
        puts " " 
        puts "Current correct answers: #{@correct_answers} \n"
        puts "Cards remaining: #{self.cards.size - @correct_answers.size} \n\n"
      else
        @incorrect_answers[question] = correct_answer
        puts "Sorry, that isn't the right answer. \n\n"
        puts "The correct answer is #{correct_answer}. \n\n"
        puts "Current correct answers: #{@correct_answers} \n\n"
        puts "You go these wrong: #{@incorrect_answers}"
        puts "Cards remaining: #{self.cards.size - @correct_answers.size} \n\n"
      end

    end
    puts "Quiz ended!"

    if @incorrect_answers.empty?
      puts "You got everything right! Great!"
    else
    puts "You need to work on the following terms: #{@incorrect_answers}"
    end
  end


    def generate_random_number
      rand_num = rand(self.cards.size)
      if @correct_card_indices.include?(rand_num)
        generate_random_number
      else 
        return rand_num
      end
  
  end
end
