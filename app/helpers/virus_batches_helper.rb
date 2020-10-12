module VirusBatchesHelper
  
  def change_box(id1,id2)
    box1 = Box.find(id1)
    box2 = Box.find(id2)
    box1_pos = box1.positions
    box2_pos = box2.positions
    box1_pos.each_with_index do |pos, index|
    vb = pos.virus_batch
    vb.position = box2_virus_batch[index]
    vb.save!
    end
  end
end
