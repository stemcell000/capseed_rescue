function getBoxMap(id, containername) {
console.log("Selected");
console.log("Box ID : "+id);
param = {box_id: id}; 
  $.ajax({
      url : '/virus_batches/map_tube',
      data: param,
      success: function(data){
        console.log("success");
        },
      //error: function(data) { alert("error"); }
      });
    $(containername).attr({'data-id': id});
}