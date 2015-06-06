require 'spec_helper'

feature "User fills out artwork form", %(
  as a user
  i want to fill out the artwork form
  So that i can submit a new piece of artwork

  Acceptance Criteria:
  [x] I can fill out the series artwork form and includes;
  [x] Series Number
  [x] Art Series
  [x] Title
  [x] Photo_URL
  [x] Date

) do

  scenario "user fills out name in series form" do
    visit '/artform'
    find_field('art_title')
    fill_in('art_title', with: "Original Art")

    find_field('series_number')
    fill_in('series_number', with: "1")

    find_field('art_series_id')

    find_field('photo_url')
    fill_in('photo_url', with: "http://i.imgur.com/rwj3It7.jpg")

    find_field('artwork_date')
    fill_in('artwork_date', with: "02/05/1990")

    find(:xpath, '//input[@id="submit_art"]')

  end
end
