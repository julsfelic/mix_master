require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the page for all artists" do
    artist1 = Artist.create(name: "Sting", image_path: "/images/sting.jpg")
    artist2 = Artist.create(name: "Cher", image_path: "/images/cher.jpg")

    visit artists_path

    expect(page).to have_content artist1.name
    expect(page).to have_css("a[href=\"#{artist_path(artist1)}\"]")
    expect(page).to have_content artist2.name
    expect(page).to have_css("a[href=\"#{artist_path(artist2)}\"]")
  end

  context "with no artists registered" do
    scenario "they see the page for all artists with no artists message" do
      no_artists_message = "There are no artists registered"

      visit artists_path

      expect(page).to have_content no_artists_message
    end
  end
end
