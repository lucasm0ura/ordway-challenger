module Api
    module V1
        class SeatsController < ApplicationController

            def index
                seats = Seat.all
                render json: {
                    seats: seats
                    status: 200
                }
            end

            def group_best_seats        
                seats = Seat.best_group_seat
                if !seats.nil?
                    render json: {
                        seats: seats
                        status: 200
                    }                
                else
                    render json: {
                        seats: seats
                        status: 400
                    }
                end                
            end
        end
    end
end