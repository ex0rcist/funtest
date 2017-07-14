require 'rails_helper'

describe 'homepage' do
  context 'homepage' do
    before(:all) do
      Rails.cache.clear
    end

    it 'renders ok', js: true do
      Rails.cache.write('rate', 99.4)

      visit root_path
      expect(page).to have_content('99.4')
    end
  end
end
