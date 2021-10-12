class Employee

    attr_reader :name, :title

    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
        
        def pay(num)
            @earnings += num
        end
    end
end
