require "surrogate/rspec"
require "equipment/mock_item_parameters"
require "equipment/item_parameters"

describe ItemParameters do
  
  describe "mocking in surrogate" do
    
    it "implements the methods defined in MockItemParameters" do
      MockItemParameters.should be_substitutable_for(ItemParameters)
    end
    
  end
  
  describe "initialization of a default item" do
  
    before(:each) do
      @params = ItemParameters.new({name: "Bob", type: :small_pistol, weight: 100})
    end
  
    it "has a name" do
      @params.name.should == "Bob"
    end
  
    it "has an adjustable name" do
      @params.name = "Sam"
      @params.name.should == "Sam"
    end
  
    it "has a type" do
      @params.type.should == :small_pistol
    end
  
    it "has an adjustable type" do
      @params.type = :unicorn
      @params.type.should == :unicorn
    end
  
    it "has a weight in kilograms" do
      @params.weight.should == 100
    end
  
    it "has an adjustable weight" do
      @params.weight = 50
      @params.weight.should == 50
    end
    
    it "has a default description of nil" do
      @params.description.should == nil
    end
  
  end
  
  describe "initialization of a custom item" do
  
    before(:each) do
      @params = ItemParameters.new({name: "Mary", type: :watch, weight: 10, description: "This is a gun!"})
    end
  
    it "has a name" do
      @params.name.should == "Mary"
    end
  
    it "has an adjustable name" do
      @params.name = "Sam"
      @params.name.should == "Sam"
    end
  
    it "has a type" do
      @params.type.should == :watch
    end
  
    it "has an adjustable type" do
      @params.type = :pegasus
      @params.type.should == :pegasus
    end
  
    it "has a weight in kilograms" do
      @params.weight.should == 10
    end
  
    it "has an adjustable weight" do
      @params.weight = 30
      @params.weight.should == 30
    end
    
    it "has a custom description" do
      @params.description.should == "This is a gun!"
    end
    
    it "has an adjustable description" do
      @params.description = "New!"
      @params.description.should == "New!"
    end
  
  end
  
end