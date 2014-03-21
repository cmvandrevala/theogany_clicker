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
    
    context "general" do
  
      it "starts off with no extra features" do
        @gun.features.should == {}
      end
    
      it "allows you to add a single feature to the gun" do
        @gun.add_feature({"Scope" => [:range, 10]})
        @gun.features.should == {"Scope" => [:range, 10]}
      end
    
      it "allows you to add multiple features to the gun" do
        @gun.add_feature({"Scope" => [:range, 10], "Extended Barrel" => [:range, 10]})
        @gun.features.should == {"Scope" => [:range, 10], "Extended Barrel" => [:range, 10]}
      end
    
      it "allows you to add multiple features to the gun in succession" do
        @gun.add_feature({"feature_1" => [:range, 10]})
        @gun.add_feature({"feature_2" => [:range, 30]})
        @gun.features.should == {"feature_1" => [:range, 10], "feature_2" => [:range, 30]}
      end
      
      it "allows you to add a feature with multiple effects" do
        @gun.add_feature({"complicated feature" => [:range, 10, :weight, 5, :shots, 12]})
        @gun.features.should == {"complicated feature" => [:range, 10], "complicated feature" => [:weight, 5], "complicated feature" => [:shots, 12]}
      end
          
    end
    
    context "range" do
    
      it "adjusts the range of the gun with an appropriate feature" do
        @gun.add_feature({"Scope" => [:range, 10]})
        @gun.range.should == 20
      end
    
      it "adjusts the range of the gun with many appropriate features" do
        @gun.add_feature({"Scope" => [:range, 10], "Extended Barrel" => [:range, 30]})
        @gun.range.should == 50
      end
    
      it "does not adjust the range if the add on does not involve range" do
        @gun.add_feature({"Scope" => [:weight, 10]})
        @gun.range.should == 10
      end
    
    end
    
    context "shots" do
    
      it "adjusts the shots of the gun with an appropriate feature" do
        @gun.add_feature({"Clip" => [:shots, 10]})
        @gun.shots.should == 16
      end
    
      it "adjusts the shots of the gun with many appropriate features" do
        @gun.add_feature({"Scope" => [:shots, 10], "Extended Barrel" => [:shots, 14]})
        @gun.shots.should == 30
      end
    
      it "does not adjust the range if the add on does not involve range" do
        @gun.add_feature({"Scope" => [:weight, 10]})
        @gun.shots.should == 6
      end
      
    end
    
    context "weight" do
    
      it "adjusts the weight of the gun with an appropriate feature" do
        @gun.add_feature({"Clip" => [:weight, 10]})
        @gun.weight.should == 60
      end
    
      it "adjusts the weight of the gun with many appropriate features" do
        @gun.add_feature({"Scope" => [:weight, 10], "Extended Barrel" => [:weight, 14]})
        @gun.weight.should == 74
      end
    
      it "does not adjust the weight if the add on does not involve weight" do
        @gun.add_feature({"Scope" => [:range, 10]})
        @gun.weight.should == 50
      end
      
    end
  
  end
  
end