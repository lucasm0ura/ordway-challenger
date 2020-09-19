class Seat < ApplicationRecord
    belongs_to :venue


    def self.best_group_seat(amount_of_seats)
        close_seats ||= []

        venue = Venue.first

        (1..venue.rows).each do |row|
            row_selected = self.where(available: true, row: row)
            if row_selected.count > 2

                close_seats << row_selected.sort_by(&:column).min_by(amount_of_seats).first

                (0..(row_selected.count-1)).each do |index|
                    if !row_selected[index+1].nil?
                        if(row_selected[index].column - 1 == row_selected[index+1].column || 
                            row_selected[index].column + 1 == row_selected[index+1].column)       

                            close_seats << row_selected[index+1]                
                        end
                    end
                end
                
            end
            
   
        end


        close_seats = [] if close_seats.count != amount_of_seats
        close_seats
    end

end
