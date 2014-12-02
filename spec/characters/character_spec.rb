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
      MockCharacter.should be_substitutable_for(Character)
    end

  end

  describe "initialization of default character" do

    it "creates a character with a name" do
      @default_character.name.should == "Pookie Pookerson"
    end

    it "creates a character with two moves" do
      @default_character.moves.should == 2
    end

    it "creates a character with a default 'active' status" do
      @default_character.status.should == :active
    end

    it "creates a character with ten action points" do
      @default_character.action_points.should == 10
    end

    it "creates a character with three wounds" do
      @default_character.wounds.should == 3
    end

  end

  describe "initialization of a customized character" do

    it "creates a character with a name" do
      @custom_character.name.should == "Bob"
    end

    it "creates a character with a custom number of moves" do
      @custom_character.moves.should == 3
    end

    it "creates a character with a custom status" do
      @custom_character.status.should == :unconscious
    end

    it "creates a character with a custom number of action points" do
      @custom_character.action_points.should == 12
    end

    it "creates a character with a custom number of wounds" do
      @custom_character.wounds.should == 5
    end

  end

  describe "character status" do

    it "can be changed to dead" do
      @default_character.has_died
      @default_character.status.should == :dead
    end

    it "can be changed to unconscious" do
      @default_character.has_been_knocked_out
      @default_character.status.should == :unconscious
    end

    it "can be changed to inactive" do
      @custom_character.is_inactive
      @custom_character.status.should == :inactive
    end

    it "can be changed to active" do
      @custom_character.is_active
      @custom_character.status.should == :active
    end

  end

end

