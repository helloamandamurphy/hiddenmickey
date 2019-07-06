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
}

def main
  make_users
  make_series
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

main
