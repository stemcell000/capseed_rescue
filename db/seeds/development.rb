 #Mandatory Seeds
  #Add units
  Unit.create( name:"ng/uL")
  Unit.create( name:"ug/uL")
   #Add Volume units
  VolUnit.create( name:"µL")
  VolUnit.create( name:"mL")
  
  #Add Types
  Type.create( name:"Helper")
  Type.create( name:"Transgene")
  Type.create(name:"Capsid")
  Type.create(name:"Library")
  Type.create(name:"Lenti")
  Type.create(name:"Other | Unknown")
  
  #Add Strands
  Strand.create( name:"sc")
  Strand.create( name:"ss")
  Strand.create( name:"nc")
  Strand.create( name:"Irrelevant")
  Strand.create( name:"Unknown")

  
   #Add boxes
  #Box.create(name: "Unknown")
  PlasmidBox.create(name: "Garbage")
  
  #Add cloning methods
  Cmeth.create(name: "InFusion")
  Cmeth.create(name: "Directed mutagenesis")
  Cmeth.create(name: "Classic")
  Cmeth.create(name: "Gibson")
  Cmeth.create(name: "other")
  Cmeth.create(name: "unknown") 
 
  #Add columns
  Column.create( name:"1")
  Column.create( name:"2")
  Column.create( name:"3")
  Column.create( name:"4")
  Column.create( name:"5")
  Column.create( name:"6")
  Column.create( name:"7")
  Column.create( name:"8")
  Column.create( name:"9")
  Column.create(name: "None")
  
  
  #Add rows
  Row.create( name:"A")
  Row.create( name:"B")
  Row.create( name:"C")
  Row.create( name:"D")
  Row.create( name:"E")
  Row.create( name:"F")
  Row.create( name:"G")
  Row.create( name:"H")
  Row.create( name:"I")
  Row.create(name: "None")
  
  #Formats
  Format.create(name: "mini")
  Format.create(name: "midi")
  Format.create(name: "maxi")
  Format.create(name: "giga")
  
  #PCR Colony
  PcrColony.create(name: "ok")
  PcrColony.create(name: "failed")
  PcrColony.create(name: "not done")
  PcrColony.create(name: "passed")
  
  #Sequencing
  Sequencing.create(name: "ok")
  Sequencing.create(name: "failed")
  Sequencing.create(name: "not done")
  Sequencing.create(name: "passed")
  
  #Target
  Target.create(name: "Unknown")
  Target.create(name: "Ubiquitous")
  Target.create(name: "RGC")
  Target.create(name: "Cones")
  Target.create(name: "neuronal")
  Target.create(name: "Bipolar cells on")
  Target.create(name: "Red cones")
  Target.create(name: "Blue cones")
  Target.create( name: "Neuronal")
  Target.create( name: "RGC")
  
  #Add Projects to Assay
  Project.create( name:"Global project")
  
  User.all.each do |u|
   if u.options.empty?
      u.options.create(:display_all_virus => false, :display_all_clone_batch => false)
   end
   
   BoxType.create(name: "9x9", max_position: "81")
   BoxType.create(name: "8x12", max_position: "96")
  end