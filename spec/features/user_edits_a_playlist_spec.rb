require 'rails_helper'

RSpec.feature 'User edits a playlist' do
  scenario 'they see the page for the updated playlist' do
    playlist = create(:playlist)
    checked_song = playlist.songs.first
    song_one, song_two = create_list(:song, 2)
    new_playlist_title = "My personl playlist"

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: new_playlist_title
    check("song-#{song_one.id}")
    uncheck("song-#{checked_song.id}")
    click_on "Update Playlist"

    within("h1") do
      expect(page).to have_content new_playlist_title
    end

    expect(page).to have_content song_one.title
    expect(page).not_to have_content checked_song.title
  end

  context 'with invalid data' do
    scenario 'they see the edit page with an error' do
      playlist = create(:playlist)
      checked_song = playlist.songs.first
      song_one, song_two = create_list(:song, 2)
      invalid_name = ""

      visit playlist_path(playlist)
      click_on "Edit"
      fill_in "playlist_name", with: invalid_name
      check("song-#{song_one.id}")
      uncheck("song-#{checked_song.id}")
      click_on "Update Playlist"
      
      expect(page).to have_content "Name can't be blank"
    end
  end
end
