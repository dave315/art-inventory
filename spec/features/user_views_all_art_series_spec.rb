require 'spec_helper'

feature "User views all series & info", %(
  as a user
  i want to view all the series
  So that I can find more information about each one

  Acceptance Criteria:
  [x] I can view the all the names of the art series
  [x] I can click on each series and go to an info page
  [x] On the info page I can see the following:
  [x] Series name
  [x] Total printed
  [x] Series date (if it has one)
  [x] Series description (if it has one)

) do

  title = "Chinese Vases"
  total_printed = "Total Printed: 50"
  date = "Date: 1965"
  description = "Chinese artwork on vases by Elaine Simel"


  scenario "user sees all series" do
    visit '/series'
    expect(page).to have_content "Chinese Vases"
  end

  scenario "user clicks on series and sees specific information" do
    visit "/series"
    click_link('Chinese Vases')
    expect(page).to have_content title
    expect(page).to have_content total_printed
    expect(page).to have_content date
    expect(page).to have_content description
    end
end
