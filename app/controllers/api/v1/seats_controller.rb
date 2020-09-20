module Api
    module V1
        class SeatsController < ApplicationController

            def index
                seats = Seat.all
                render json: {
                    seats: seats,
                    status: 200
                }
            end

            def group_best_seats        
                seats = Seat.best_group_seat(params["amount_of_seats"].to_i)
                if(!seats.empty?)
                    render json: {
                        seats: seats,
                        status: 200
                    }                
                else
                    render json: {
                        message: "There haven't seat for all the people in request",
                        status: 400
                    }
                end                
            end
        end
    end
end