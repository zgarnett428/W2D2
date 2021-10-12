class Room

    def initialize(capacity)
        @occupants = []
        @capacity = capacity
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        @occupants.length < @capacity
    end

    def available_space
        @capacity - @occupants
    end

    def add_occupant(name)
        @occupants << name if !self.full
        !self.full
    end

end
