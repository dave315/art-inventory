require 'spec_helper'

feature "User fills out artwork form", %(
  as a user
  i want to fill out the artwork form
  So that i can submit a new piece of artwork

  Acceptance Criteria:
  [ ] I can fill out the series artwork form and includes;
  [ ] Series Number
  [ ] Art Series
  [ ] Title
  [ ] Photo_URL
  [ ] Date

) do

  scenario "user fills out name in series form" do
    visit '/'
    find_field('art_title')
    find_field('series_number')
    find_field('art_series_name')
    find_field('photo_url')
    find_field('artwork_date')
    find(:xpath, '//input[@id="submit_art"]')

  end
end
