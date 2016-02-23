require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the page for all playlists" do
    playlist_one, playlist_two, playlist_three = create_list(:playlist, 3)

    visit playlists_path

    within('h1') do
      expect(page).to have_content("All Playlists")
    end

    [playlist_one, playlist_two, playlist_three].each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end

  context "with no playlists" do
    scenario "they see an error message" do
      visit playlists_path

      within(".error") do
        expect(page).to have_content("There are no playlists.")
      end
    end
  end
end
