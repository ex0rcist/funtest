require 'rails_helper'

describe 'homepage' do
  context 'adminpage', js: true do
    before(:all) do
      Rails.cache.clear
    end

    before(:each) do
      visit admin_root_path
    end

    it 'renders ok' do
      expect(page).to have_selector('#rate_input')
    end

    it 'validate empty inputs' do
      find('#submit').click

      expect(page).to have_content('Некорректный формат даты')
      expect(page).to have_content('Курс не указан')
    end

    it 'validate incorrect inputs' do
      fill_in with: '1.a', id: 'rate_input'
      fill_in with: '2017-01-01 00:00:00', id: 'date_input'

      find('#submit').click

      expect(page).to have_content('Дата в прошлом')
      expect(page).to have_content('Некорректный формат курса')
    end

    it 'runs ok' do
      Rails.cache.write('rate', 42)

      fill_in with: '10.33', id: 'rate_input'
      fill_in with: (Time.zone.now + 10.seconds).strftime('%Y-%m-%d %H:%M:%S'), id: 'date_input'

      find('#submit').click

      expect(page).to have_content('Успешно')

      visit root_path
      expect(page).to have_content('10.33')
    end
  end
end
