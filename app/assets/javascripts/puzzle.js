var complete, present;
var correct = 0;

$(function () {
  complete = $('#complete .element');
  present = $('#present .element');

  $('#editor input').eq(0).focus();

  $(document).on('focus', '.property', function() {
    $('.property').each(function(index, el) {
      $(this).removeClass('focus');
    });
    $(this).addClass('focus');
  });
	$(document).on('keyup', '.property', function() {
    event.preventDefault();
    var property = $(this).find('label').text();
    var value = $(this).find('input').val();
    present.css(property, value);
    if(check(property)){
      $(this).find('input').attr("disabled", "disabled");
      console.log('correct');
      $(this).addClass('correct').find('label').before('<i class="fa fa-star">');
      $(this).next().find('input').focus();
      correct++;
      if (correct === 5) {
        alert('CLEAR!');
      };
    }
    else{
      console.log('try again');
    }
    
  });
});

function check (property) {
  return complete.css(property) == present.css(property);
}

function alt () {
  alert('右クリックさせないよ');
}