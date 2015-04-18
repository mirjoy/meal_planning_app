$(document).ready(function(){
  $('#hated-foods').bind('click', function(){
    $('#hated-foods-list').toggle();
  });

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

});