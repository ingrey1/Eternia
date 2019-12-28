class Character < ActiveRecord::Base
  belongs_to :game
  belongs_to :zone

  #has_one :game_class
  has_one :inventory
  has_many :encounters
  has_many :monsters, through: :encounters
  has_many :items, through: :inventory
  #has_many :items, through: :equipment

  def lose_health(damage)
    self.current_health = self.current_health - damage
  end

  def calculate_damage(ability)
    if ability.class == Ability
      return ability.damage
    else
      return 1 + (self.strength / 5 * rand(5))
    end
  end

  def attack(monster)
    puts "1. Regular Attack\n2. Choose an Ability"
    choice = gets.chomp
    if choice == "1"
      self.calculate_damage("Regular Attack")
    end
  end

  def level_up
    self.update_attribute(:level, self.level + 1)
    puts "Ding! Level up! You are now level #{self.level}."
    self.level_up_base_stat_increase
    # call related class to gain additional attributes, before setting max health and mana
    self.calculate_max_health
    self.current_health = self.max_health
    self.calculate_max_mana
    self.current_mana = self.max_mana
  end

  def exp_to_next_level
    self.level * 100
  end

  def gain_experience(monster)
    puts "You gain #{monster.experience} experience from monster.name"
    self.experience = self.experience + monster.experience
    level_check = self.exp_to_next_level - self.experience

    if level_check <= 0
      self.experience = level_check
      self.level_up
    end
  end

  def level_up_base_stat_increase
    self.update_attributes(strength: self.strength + 1,
                           dexterity: self.dexterity + 1, wisdom: self.wisdom + 1,
                           intelligence: self.intelligence + 1, charisma: self.charisma + 1,
                           constitution: self.constitution + 1)
  end

  def calculate_max_health
    self.max_health = 10 * self.level + self.constitution * 5
  end

  def calculate_max_mana
    self.max_mana = 10 * self.level + self.intelligence * 5
  end
end
