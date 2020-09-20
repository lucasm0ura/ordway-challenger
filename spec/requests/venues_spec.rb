require 'rails_helper'
Requests::JsonHelpers

describe 'Venues', type: :request do
    before do 
        post '/api/v1/venues/import', params: json_data('import')
    end
    
    it 'Import JSON Data' do
        expect(response.status).to eq 200
        expect(json['venue']['rows']).to eq("10")        
        expect(json['venue']['columns']).to eq("50")
    end

    it 'Test the min and max of rows' do
        expect((json['venue']['rows']).to_i).to be_between(1, 27)
    end

    it 'Test the min of columns' do
        expect((json['venue']['columns']).to_i).to be > 0
    end    

end