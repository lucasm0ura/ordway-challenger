class Seat < ApplicationRecord
    belongs_to :venue


    def best_group_seat
        close_rows || = []
        limit = Venue.first.columns / 2
        
        total_available = self.where(available: true).count

        limit -= total_available / 2.to_i

        close_rows = self.where(available: true).group_by(&:row)
                                                .min_by(total_available) { |_, v| (v[0].column - limit)}        
    end

end
