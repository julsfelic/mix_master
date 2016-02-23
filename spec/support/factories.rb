FactoryGirl.define do
  factory :artist do
    name
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end

  factory :playlist do
    sequence(:name) { |n| "Playlist #{n}" }

    after(:create) do |playlist|
      playlist.songs << FactoryGirl.create(:song)
    end
  end
end
