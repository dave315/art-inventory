require 'spec_helper'

feature "User views all art & info", %(
  as a user
  I want to view all individual art, cataloged in a table
  So that I can find more information about each one

  Acceptance Criteria:
  [ ] I can view a table of all submitted art
  [ ] There should be a column for the following:
  [x] Title
  [ ] Art Series
  [ ] Number in the series
  [ ] Photo (URL for now)
  [ ] Artwork Date
  [ ] Artwork description

) do

  title = "Original Art"
  series_num = "1"
  date = "1990"
  description = "Original wale art"
  photo_url = "http://i.imgur.com/rwj3It7.jpg"

  scenario "user clicks artwork and sees specific information" do
    visit "/artwork"
    expect(page).to have_content title
    expect(page).to have_content series_num
    expect(page).to have_content date
    expect(page).to have_content description
    expect(page).to have_content photo_url
  end

end
