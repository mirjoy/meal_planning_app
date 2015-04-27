$(document).ready(function(){


  toggleFoodList('#specific-food-header', '#specific-food');
  toggleFoodList('#allergy-header', '#allergy');
  toggleFoodList('#diet-header', '#diet');

  function toggleFoodList(foodCategory, foodList){
    $(foodCategory).bind('click', function(){
      if ($(foodList).hasClass('hidden')){
        $('.hated-food').addClass('hidden');
      }
      else {
        $('.hated-food').addClass('hidden');
        $(foodList).removeClass('hidden');
      }
      $(foodList).toggleClass('hidden');
    });
  };

   $('.hated-food').children().on('click', function(){
    $(this).toggleClass('btn-danger');
  });

});