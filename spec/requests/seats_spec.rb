require 'rails_helper'
Requests::JsonHelpers

describe 'Seats', type: :request do
    before do
        post '/api/v1/venues/import', params: json_data('import')

        seats = Seat.where(position: ["a24", "a25", "a26"])
        seats.map {|seat| seat.available = true}
        seats.update_all(available: true)
        post '/api/v1/seats/group_best_seats', params: json_data('import_seats')   
        @amount_of_seats = JSON.parse(response.body)["seats"].count
    end
    
    it 'Import JSON Data' do
        expect(response.status).to eq 200
    end  

    it 'Validate request value' do
        expect(json_data('import_seats')[:amount_of_seats]).not_to eq(nil)
    end

    it 'Validate responde of amount of seats ' do
        expect(@amount_of_seats).to eq json_data('import_seats')[:amount_of_seats]
    end

end