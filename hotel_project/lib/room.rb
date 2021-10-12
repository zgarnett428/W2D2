class Room

    attr_reader :capacity, :occupants

    def initialize(capacity)
        @occupants = []
        @capacity = capacity
    end        

    def full?
        @occupants.length >= @capacity
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !self.full?
            @occupants << name
            return true
        end
        false
    end
end
