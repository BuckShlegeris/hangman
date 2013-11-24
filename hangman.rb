puts "hello world"

class HangmanGame
  def initialize(choosing_player, guessing_player, number_of_chances = 10)
    @choosing_player, @guessing_player = choosing_player, guessing_player
    @number_of_chances = number_of_chances
  end

  def play
    # current_progress is something like "__a__"
    current_progress = choosing_player.choose_word
    incorrect_guesses = []

    while incorrect_guesses.length < @number_of_chances
      puts current_progress
      puts "Incorrect guesses: #{incorrect_guesses.join(", ")}"
      guess = guessing_player.guess(current_progress, incorrect_guesses)

      if choosing_player.correct_guess?(guess)
        puts "Correct!"
        current_progress = choosing_player.update_progress(guess)

        unless current_progress.include? "_"
          puts "Guessing player wins!"
          return
        end
      else
        puts "Incorrect!"
      end
    end

    puts "Chooing player wins!"
    return

  end
end
