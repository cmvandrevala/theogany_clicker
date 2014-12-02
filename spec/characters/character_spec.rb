require 'surrogate/rspec'
require 'characters/mock_character'
require 'characters/character'

describe Character do

  before(:each) do
    @default_character = Character.new({name: "Pookie Pookerson"})
    @custom_character = Character.new({name: "Bob", moves: 3, action_points: 12})
  end

  describe "mocking in surrogate" do

    it "implements the methods defined in MockCharacter" do
      expect(MockCharacter).to be_substitutable_for(Character)
    end

  end

  describe "initialization of default character" do

    it "creates a character with a name" do
      expect(@default_character.name).to eq("Pookie Pookerson")
    end

    it "creates a character with two moves" do
      expect(@default_character.moves).to eq(2)
    end

    it "creates a character with ten action points" do
      expect(@default_character.action_points).to eq(10)
    end

  end

  describe "initialization of a customized character" do

    it "creates a character with a name" do
      expect(@custom_character.name).to eq("Bob")
    end

    it "creates a character with a custom number of moves" do
      expect(@custom_character.moves).to eq(3)
    end

    it "creates a character with a custom number of action points" do
      expect(@custom_character.action_points).to eq(12)
    end

  end

end

