class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []

  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      @sequence_length += 1
      round_success_message
    end 
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color on a new line."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    colors = ['red', 'blue', 'yellow', 'green']
    @seq << colors.sample
  end

  def round_success_message
    p "Nice job the correct color was #{@seq.last}"
  end

  def game_over_message
    p "Better luck next time the correct color was #{@seq.last}"
  end

  def reset_game
    @seq = []
    @game_over = false
    @sequence_length = 1
  end
end
