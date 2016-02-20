require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they see the page for all artist excluding deleted artist" do
    artist = Artist.create(name: "Bob Marley",
                           image_path: "/images/bob_marley.jpg")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to have_content "All Artists"
    expect(page).not_to have_content artist.name
  end
end
