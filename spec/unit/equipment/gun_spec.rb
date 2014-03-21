require 'equipment/gun'

describe Gun do
  
  before(:each) do
    @gun = Gun.new({name: "Weenie", type: :large_pistol, weight: 50})
  end
  
  describe "the general of parameters of a gun" do
    
    it "should have a name" do
      @gun.name.should == "Weenie"
    end
  
    it "should have an adjustable name" do
      @gun.name = "Pooper"
      @gun.name.should == "Pooper"
    end
  
    it "should have a type" do
      @gun.type.should == :large_pistol
    end
  
    it "should have an adjustable type" do
      @gun.type = :not_so_large_pistol
      @gun.type.should == :not_so_large_pistol
    end
  
    it "should have a weight" do
      @gun.weight.should == 50
    end
  
    it "should have a number of shots" do
      @gun.shots.should == 6
    end
  
    it "should have a base range in meters" do
      @gun.range.should == 10
    end
  
  end
  
  describe "add-ons to the gun" do
  
    it "starts off with no extra features" do
      @gun.features.should == []
    end
  
  end
  
end