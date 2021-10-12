require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
        @name.split.map!(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.include?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any?{ |k, v| !v.full? }
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k + " " + v.available_space.to_s
        end
    end
    
end
