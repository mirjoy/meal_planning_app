$(document).ready(function(){


  toggleFoodList('#veggie-header', '#veggies');
  toggleFoodList('#protein-header', '#protein');
  toggleFoodList('#grains-header', '#grains');

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