DATA = {
  :user_keys => ["name", "email", "password", "location"],
  :users => [
    ["Jessica Jones", "jjones@gmail.com", "1234", "Hell's Kitchen"],
    ["Thor", "thor@gmail.com", "1234", "Asgard"],
    ["Steve", "srogers@gmail.com", "1234", "America"]
  ],
  :series_keys => ["release_year", "name", "number_in_set", "park"],
  :series => [
    #2019, Wave A, Disneyland
    ["2019", "Character Presents", 6, "Disneyland"],
    ["2019", "Monsters University Greek Letters", 6, "Disneyland"],
    ["2019", "Winnie the Pooh Quotes", 6, "Disneyland"],
    ["2019", "Disney Duos", 6, "Disneyland"],
    ["2019", "8 Bit Characters", 6, "Disneyland"],
    ["2019", "Chaser Pins, Wave A", 5, "Disneyland"],
    #2019, Wave B, Disneyland
    ["2019", "Disneyland Attraction Signs", 6, "Disneyland"],
    ["2019", "Disney Watches", 6, "Disneyland"],
    ["2019", "Trophies", 6, "Disneyland"],
    ["2019", "Chaser Pins, Wave B", 5, "Disneyland"],

    #2019, Wave B, Shared
    ["2019", "Animated Shorts Art Style", 6, "Shared"],
    ["2019", "Princesses", 6, "Shared"],

    #2019, Wave A, Disney World
    ["2019", "Character Presents", 6, "Walt Disney World"],
    ["2019", "Disney Villains", 6, "Walt Disney World"],
    ["2019", "Stylized Attractions", 6, "Walt Disney World"],
    ["2019", "Disney Duos", 6, "Walt Disney World"],
    ["2019", "8 Bit Characters", 6, "Walt Disney World"],
    ["2019", "Chaser Pins, Wave A", 5, "Walt Disney World"],

    #2019, Wave B, Disney World
    ["2019", "Figment", 6, "Walt Disney World"],
    ["2019", "Ribbons", 6, "Walt Disney World"],
    ["2019", "8 Bit Characters", 6, "Walt Disney World"],
    ["2019", "Chaser Pins, Wave B", 5, "Walt Disney World"]
  ],

  :pin_keys => ["number", "image", "status", "subject", "series_id", "user_id"],
  :pins => [
    [ 1, "https://i.imgur.com/X13PAgU.png", "Not for Sale", "Cinderella's Castle", 15, 1],
    [ 2, "https://i.imgur.com/YxQ2W14.png", "Not for Sale", "Thunder Mountain", 15, 1],
    [ 3, "https://i.imgur.com/EkkCV2A.png", "Not for Sale", "It's a Small World", 15, 1],
    [ 4, "https://i.imgur.com/9yn3bFR.png", "Not for Sale", "Epcot Monorail", 15, 1],
    [ 5, "https://i.imgur.com/wLOJje7.png", "Not for Sale", "Haunted Mansion", 15, 1],
    [ 6, "https://i.imgur.com/xN3tGBc.png", "Not for Sale", "Nautilus", 15, 1]
  ],
}

def main
  make_users
  make_series
  make_pins
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_series
  DATA[:series].each do |series|
    new_series = Series.new
    series.each_with_index do |attribute, i|
      new_series.send(DATA[:series_keys][i] + "=", attribute)
    end
    new_series.save
  end
end

def make_pins
  DATA[:pins].each do |pin|
    new_pin = Pin.new
    pin.each_with_index do |attribute, i|
      new_pin.send(DATA[:pin_keys][i] + "=", attribute)
    end
    new_pin.save
  end
end

main
