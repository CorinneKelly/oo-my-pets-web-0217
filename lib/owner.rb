class Owner

  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(species)
  	@species = species
  	@pets = {
  		:fishes => [], 
  		:dogs => [], 
  		:cats => [],
  	}
  	@@all << self
  end

  def say_species
  	"I am a #{species}."
  end

  def buy_fish(fish_name)
  	@pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
  	@pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
  	@pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
  	@pets[:dogs].each do |dog|
  		dog.mood = "happy"
  	end
  end

  def play_with_cats
  	@pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
  	@pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
  	@pets.each do |pet_type, pet_array|
  		pet_array.each do |pet|
  			pet.mood = "nervous"
  		end
  		pet_array.clear
  	end
  end

  def list_pets
  	num_of_fish = @pets[:fishes].count
  	num_of_cat = @pets[:cats].count
  	num_of_dog = @pets[:dogs].count
  	"I have #{num_of_fish} fish, #{num_of_dog} dog(s), and #{num_of_cat} cat(s)."
  end

  def self.all
  	@@all
  end

  def self.reset_all
  	self.all.clear
  end

  def self.count
  	self.all.count
  end


end