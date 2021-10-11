class GuessingGame

    attr_accessor :min, :max, :num_attempts

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false

        def game_over?
            @game_over
        end

        def check_num(num)
            @num_attempts += 1
            if num == @secret_num
                @game_over = true
                p "you win"
            elsif num > @secret_num
                p "too big"
            else
                p "too small"
            end
        end

        def ask_user
            p "enter a number"
            response = gets.chomp.to_i
            check_num(response)
        end
    end
end
