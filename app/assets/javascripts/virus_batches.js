function getBoxMap(id, container_name) {
console.log("Selected");
console.log("Box ID : "+id);
param = {box_id: id}  
  $.ajax({
      url : '/virus_batches/map_tube',
      data: param,
      success: function(data){
        console.log("Box_id = "+id)
        },
      error: function(data) { alert("error") }
      });
   $(container_name).attr({'data-id': id });
}