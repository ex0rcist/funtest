require 'rails_helper'

describe IndexController do
  describe 'root' do
    it 'returns 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
