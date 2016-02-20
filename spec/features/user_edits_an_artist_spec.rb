require 'rails_helper'

RSpec.feature "User edits an artists" do
  scenario "they see the page for the individual artists with updated info" do
    artist = Artist.create(name: "Bob Marley",
                           image_path: "/images/bob_marley.jpg")
    updated_name = "Ziggy Marley"

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content updated_name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist = Artist.create(name: "Bob Marley",
                             image_path: "/images/bob_marley.jpg")
      invalid_name = ""

      visit artist_path(artist)
      click_on "Edit"
      fill_in "artist_name", with: invalid_name
      click_on "Update Artist"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
