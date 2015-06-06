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
    find_field('series_name')
    fill_in('series_name', with: 'Chinese Vases')
    find(:xpath, '//input[@id="submit"]')

  end
end
