require 'surrogate/rspec'
require 'characters/mock_character'
require 'characters/character'

describe Character do

  before(:each) do
    @default_character = Character.new({name: "Pookie Pookerson"})
    @custom_character = Character.new({name: "Bob", moves: 3, status: :unconscious, action_points: 12, wounds: 5})
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

    it "creates a character with a default 'active' status" do
      expect(@default_character.status).to eq(:active)
    end

    it "creates a character with ten action points" do
      expect(@default_character.action_points).to eq(10)
    end

    it "creates a character with three wounds" do
      expect(@default_character.wounds).to eq(3)
    end

  end

  describe "initialization of a customized character" do

    it "creates a character with a name" do
      expect(@custom_character.name).to eq("Bob")
    end

    it "creates a character with a custom number of moves" do
      expect(@custom_character.moves).to eq(3)
    end

    it "creates a character with a custom status" do
      expect(@custom_character.status).to eq(:unconscious)
    end

    it "creates a character with a custom number of action points" do
      expect(@custom_character.action_points).to eq(12)
    end

    it "creates a character with a custom number of wounds" do
      expect(@custom_character.wounds).to eq(5)
    end

  end

  describe "character status" do

    it "can be changed to dead" do
      @default_character.has_died
      expect(@default_character.status).to eq(:dead)
    end

    it "can be changed to unconscious" do
      @default_character.has_been_knocked_out
      expect(@default_character.status).to eq(:unconscious)
    end

    it "can be changed to inactive" do
      @custom_character.is_inactive
      expect(@custom_character.status).to eq(:inactive)
    end

    it "can be changed to active" do
      @custom_character.is_active
      expect(@custom_character.status).to eq(:active)
    end

  end

end

