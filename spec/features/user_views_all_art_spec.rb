require 'spec_helper'

feature "User views all art & info", %(
  as a user
  I want to view all individual art, cataloged in a table
  So that I can find more information about each one

  Acceptance Criteria:
  [x] I can view a table of all submitted art
  [x] There should be a column for the following:
  [x] Title
  [x] Art Series
  [x] Number in the series
  [x] Name of art series
  [x] Photo (URL for now)
  [x] Artwork Date
  [x] Artwork description

) do

  title = "Original Art"
  series_num = "1"
  date = "1990"
  description = "Original wale art"
  photo_url = "http://i.imgur.com/rwj3It7.jpg"
  series_name = "Planets"

  scenario "user clicks artwork and sees specific information" do
    visit "/artwork"
    expect(page).to have_content title
    expect(page).to have_content series_num
    expect(page).to have_content date
    expect(page).to have_content series_name
    expect(page).to have_content description
    find_link(photo_url)
  end

end
