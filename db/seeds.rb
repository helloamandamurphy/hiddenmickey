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
    ["2019", "Character Presents", 6, 0], #1
    ["2019", "Monsters University Greek Letters", 6, 0], #2
    ["2019", "Winnie the Pooh Quotes", 6, 0], #3
    ["2019", "Disney Duos", 6, 0], #4
    ["2019", "8 Bit Characters", 6, 0], #5
    ["2019", "Chaser Pins, Wave A", 5, 0], #6
    #2019, Wave B, Disneyland
    ["2019", "Disneyland Attraction Signs", 6, 0], #7
    ["2019", "Disney Watches", 6, 0], #8
    ["2019", "Trophies", 6, 0], #9
    ["2019", "Chaser Pins, Wave B", 5, 0], #10

    #2019, Wave B, Shared
    ["2019", "Animated Shorts Art Style", 6, 1], #11
    ["2019", "Princesses", 6, 1], #12

    #2019, Wave A, Disney World
    ["2019", "Character Presents", 6, 2], #13
    ["2019", "Disney Villains", 6, 2], #14
    ["2019", "Stylized Attractions", 6, 2], #15
    ["2019", "Disney Duos", 6, 2], #16
    ["2019", "8 Bit Characters", 6, 2], #17
    ["2019", "Chaser Pins, Wave A", 5, 2], #18

    #2019, Wave B, Disney World
    ["2019", "Figment", 6, 2], #19
    ["2019", "Ribbons", 6, 2], #20
    ["2019", "8 Bit Characters", 6, 2], #21
    ["2019", "Chaser Pins, Wave B", 5, 2] #22
  ],

  :pin_keys => ["number", "image", "status", "subject", "series_id", "user_id"],
  :pins => [
    [ 1, "https://i.imgur.com/X13PAgU.png", 0, "Cinderella's Castle", 15, 1],
    [ 2, "https://i.imgur.com/YxQ2W14.png", 0, "Thunder Mountain", 15, 1],
    [ 3, "https://i.imgur.com/EkkCV2A.png", 0, "It's a Small World", 15, 1],
    [ 4, "https://i.imgur.com/9yn3bFR.png", 0, "Epcot Monorail", 15, 1],
    [ 5, "https://i.imgur.com/wLOJje7.png", 0, "Haunted Mansion", 15, 1],
    [ 6, "https://i.imgur.com/xN3tGBc.png", 0, "Nautilus", 15, 1],

    [ 1, "https://i.imgur.com/ViIx9Bv.png", 2, "Evil Queen", 14, 2],
    [ 2, "https://i.imgur.com/t6pMGg9.png", 2, "Ursula", 14, 2],
    [ 3, "https://i.imgur.com/GYpElGo.png", 2, "Maleficent", 14, 2],
    [ 4, "https://i.imgur.com/1WxACld.png", 2, "Cruella", 14, 2],
    [ 5, "https://i.imgur.com/pMrP02v.png", 2, "Queen of Hearts", 14, 2],
    [ 6, "https://i.imgur.com/jGnzTLg.png", 2, "Captain Hook", 14, 2]
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
