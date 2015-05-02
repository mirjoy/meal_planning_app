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

  $("#allergy").find("button").on("click", function(){
    $(this).toggleClass("btn-danger");
    var allergyName = $(this).text().trim();
    if($(this).hasClass("btn-danger")){
      linkAllergyToCurrentUser(allergyName);
    }
    else{
      unlinkAllergyFromCurrentUser($(this).attr("data-id"));
    }
  });

  $("#diet").find("button").on("click", function(){
    $(this).toggleClass("btn-danger");
    var dietName = $(this).text().trim();
    if($(this).hasClass("btn-danger")){
      linkDietToCurrentUser(dietName);
    }
    else{
      unlinkDietFromCurrentUser($(this).attr("data-id"));
    }
  });

  $("#cuisine").find("button").on("click", function(){
    $(this).toggleClass("btn-danger");
    var cuisineName = $(this).text().trim();
    if($(this).hasClass("btn-danger")){
      linkCuisineToCurrentUser(cuisineName);
    }
    else{
      unlinkCuisineFromCurrentUser($(this).attr("data-id"));
    }
  });

  $("#meal-number").bind("click", function(){
    $("#meal-number-selection").toggleClass("hidden");
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
     $(".one-banned-food").on("click", function(e){
      var foodId = $(this).attr("data-id");
      
      $.ajax({
          method: "DELETE",
          url: "/banned_foods/" + foodId
        })

      return $(this).remove();
     });
    }

   function linkAllergyToCurrentUser(allergyName){
      $.ajax ({
        method: "POST",
        url: "/allergies",
        data: { allergy: { name: allergyName } }
      });
    }

   function unlinkAllergyFromCurrentUser(allergyId){
      $.ajax ({
        method: "DELETE",
        url: "/allergies/" + allergyId
      });
    }

    function linkDietToCurrentUser(dietName){
      $.ajax ({
        method: "POST",
        url: "/diets",
        data: { diet: { name: dietName } }
      });
    }

    function unlinkDietFromCurrentUser(dietId){
      $.ajax ({
        method: "DELETE",
        url: "/diets/" + dietId
      });
    }
    
    function linkCuisineToCurrentUser(cuisineName){
      $.ajax ({
        method: "POST",
        url: "/cuisines",
        data: { cuisine: { name: cuisineName } }
      });
    }

    function unlinkCuisineFromCurrentUser(cuisineId){
      $.ajax ({
        method: "DELETE",
        url: "/cuisines/" + cuisineId
      });
    }
    
   attachDeleteFoodClickHandler();
});