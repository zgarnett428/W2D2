class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    @random_word = DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, i|
      arr << i if char == ele
    end
    arr
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    end

    @attempted_chars << char
    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
    
    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)

    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    self.try_guess(guess)
  end

  def win?
    p "WIN" if @secret_word == @guess_word.join("")
    @secret_word == @guess_word.join("")
  end

  def lose?
    p "LOSE" if @remaining_incorrect_guesses == 0
    @remaining_incorrect_guesses == 0
  end

  def game_over?
    p @secret_word if self.win? || self.lose?
    self.win? || self.lose?
  end

end
