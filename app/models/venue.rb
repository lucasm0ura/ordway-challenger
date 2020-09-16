class Venue < ApplicationRecord
    has_many :seats

    attribute :rows
    attribute :columns

    ROWS_GROUP_NAME = ('a'..'z').to_a

    def create_seats
        p 'Creating seats'
        (1..self.rows).each do |row|
            (1..self.columns).each do |col|
                position = (row - 1).to_i
                row_name = ROWS_GROUP_NAME[position] + col.to_s
                seats << Seat.new(position: row_name, row: row, column: col)
            end
        end
        seats.each(&:save)
        p 'Done!'
      end

    def seats_process(seats_params)
        p 'Update seats to available'
        array_seats ||= []  
        seats_params.each {|_, v| array_seats << v}
        array_seats.each do |seat_param|
            seat = find_seat_by_position(seat_param["id"])
            seat.available = true if seat_param["status"] == "AVAILABLE"
            seat.save
        end
        p 'done'
    end

    def best_seat
        limit = get_limit
        close_row = Seat.where(available: true).group_by(&:row)
                                               .min_by { |_, v| (v[0].column - limit)}

        seat = find_seat_by_position(close_rom[1][0].position)
        seat.best_seat = true
        seat.save
    end

    def find_seat_by_position position
        Seat.find_by_position(position)
    end

    def get_limit
        self.columns.to_f / 2
    end
end
