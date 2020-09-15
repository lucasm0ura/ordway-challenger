module Api
    module V1
        class VenuesController < ApplicationController

            def import
                venue = Venue.new(venue_params)
                Venue.transaction do 
                    venue.create_seats if venue.save
                    venue.seats_process(seats_params)
                end
            end


            private 

            def venue_params
                params.require(:venue).require(:layout).permit(:rows, :columns).to_h.symbolize_keys
                         
            end

            def seats_params
                params.require(:seats).permit!
            end

        end
    end

end