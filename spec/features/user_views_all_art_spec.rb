require 'spec_helper'

feature "User views all art & info", %(
  as a user
  I want to view all individual art, cataloged in a table
  So that I can find more information about each one

  Acceptance Criteria:
  [ ] I can view a table of all submitted art
  [ ] There should be a column for the following:
  [ ] Title
  [ ] Art Series
  [ ] Number in the series
  [ ] Photo (URL for now)
  [ ] Artwork Date

# ) do
#
#   before(:each) do
#
#   end
#
#   title = "Chinese Vases"
#   total_printed = "Total Printed: 50"
#   date = "Date: 1965"
#   description = "Chinese artwork on vases by Elaine Simel"
#
#
#   scenario "user sees all series" do
#     visit '/series'
#     expect(page).to have_content "Chinese Vases"
#   end
#
#   scenario "user clicks on series and sees specific information" do
#     visit "/series"
#     click_link('Chinese Vases')
#     expect(page).to have_content title
#     expect(page).to have_content total_printed
#     expect(page).to have_content date
#     expect(page).to have_content description
#     end
# end
