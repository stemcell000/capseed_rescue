<<<<<<< HEAD
function getBoxMap(id, container_name) {
=======
function getBoxMap(id, containername) {
>>>>>>> d&d_try5
console.log("Selected");
console.log("Box ID : "+id);
param = {box_id: id}; 
  $.ajax({
      url : '/virus_batches/map_tube',
      data: param,
      success: function(data){
<<<<<<< HEAD
        console.log("Box_id = "+id)
=======
        console.log("success");
>>>>>>> d&d_try5
        },
      //error: function(data) { alert("error"); }
      });
<<<<<<< HEAD
   $(container_name).attr({'data-id': id });
=======
    $(containername).attr({'data-id': id});
>>>>>>> d&d_try5
}