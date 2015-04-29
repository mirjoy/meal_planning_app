$(document).ready(function(){
  toggleFoodList("#specific-food-header", "#specific-food");
  toggleFoodList("#allergy-header", "#allergy");
  toggleFoodList("#diet-header", "#diet");
  toggleFoodList("#cuisine-header", "#cuisine");

  function toggleFoodList(foodCategory, foodList){
    $(foodCategory).bind("click", function(){
      if ($(foodList).hasClass("hidden")){
        $(".hated-food").addClass("hidden");
      }
      else {
        $(".hated-food").addClass("hidden");
        $(foodList).removeClass("hidden");
      }
      $(foodList).toggleClass("hidden");
    });
  };

  $(".hated-food").find("button").on("click", function(){
    $(this).toggleClass("btn-danger");
  });

  $("#favorite-number").bind("click", function(){
    $("#favorite-number-selection").toggleClass("hidden");
  });

  $("#specific-food").on("ajax:success", function(e, data, status, xhr) {
      var button = $("<button type='button' class='btn btn-danger one-banned-food' style='margin: 2px' data-id=" + data.id + ">"+data.name+"</button>");
      $("#banned-food-list").append(button);
      attachDeleteFoodClickHandler();
      return $("input").val("");
    }).on("ajax:error", function(e, xhr, status, error) {
    
    return $("#banned-food-list").append("<p>You have already banned that food.</p>");
  });

   function attachDeleteFoodClickHandler() {
     // $(".one-banned-food").off("click", "**");
     $(".one-banned-food").on("click", function(e){
      var foodId = $(this).attr("data-id");
      
      $.ajax({
          method: "DELETE",
          url: "/banned_foods/" + foodId
        })

      return $(this).remove();
     });
    }

   $("#allergy button").on("click", function(){
      // var allergy_id = $(this).attr("data-id");
      var allergyName = $(this).text();
      
      $.ajax ({
        method: "POST",
        url: "/allergies"

      });
   });

   attachDeleteFoodClickHandler();
});