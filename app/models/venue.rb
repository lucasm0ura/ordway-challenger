class Venue < ApplicationRecord
    has_many :seats

    attribute :rows
    attribute :columns

    ROWS_NAME = ('a'..'z').to_a

    def create_seats
        p 'Creating seats'
        (1..self.rows).each do |row|
            (1..self.columns).each do |col|
                position = (row - 1).to_i
                row_name = ROWS_NAME[position] + col.to_s
                seats << Seat.new(position: row_name, row: row, column: col)
            end
        end
        seats.each(&:save)
        p 'Done!'
      end

      def seats_process(seats_params)
          
      end
end
