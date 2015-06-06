require 'spec_helper'

feature "User fills out series form", %(
  as a user
  i want to fill out the series form
  So that i can submit a new art series

  Acceptance Criteria:
  [x] I can fill out the series form with a name (required);
  [x] total number of art in the series (required)
  [x] date of series (optional)
  [x] description (optional)

) do

  scenario "user fills out name in series form" do
    visit '/'

    find_field('series_name')
    fill_in('series_name', with: 'Chinese Vases')

    find_field('total_printed')
    fill_in('total_printed', with: 50)

    find_field('series_date')
    fill_in('series_date', with: "04/09/1965")

    find_field('series_description')
    fill_in('series_description', with: "Chinese artwork on vases by Elaine Simel")

    find(:xpath, '//input[@id="submit"]')

  end
end
