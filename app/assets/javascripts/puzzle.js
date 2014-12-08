var complete, present;
var correct=0,clear=0;

var starts = [
  {"property":'font-size',"value":"20px"},
  {"property":'border',"value":"1px double #000"},
  {"property":'border-radius',"value":"0"}
]

var goals = [
  {"property":'font-size',"value":"30px"},
  {"property":'border',"value":"3px solid #f99"},
  {"property":'border-radius',"value":"6px"}
]

$(function () {
  complete = $('#ans .element');
  present = $('#present .element');

  var init = initialize();
  init.done(function(values) {
    
  });

  

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
      console.log(correct);
      if (correct == clear) {
        alert('CLEAR!');
      };
    }
    else{
      console.log('try again');
    }
  });
});

function initialize () {
  var d = new $.Deferred;
  var frm = $('#editor form');
  clear = starts.length;
  console.log(starts.length);
  for (var i = 0; i < starts.length; i++) {
    present.css(starts[i].property, starts[i].value);
    var id = "q"+i;
    var label = $('<label>').attr('for', id).text(starts[i].property);
    var input = $('<input>').attr({
      type: 'text',
      value: starts[i].value,
      id: id,
      name: id
    });
    var quiz = $('<div class="property">').append(label).append(input);
    frm.append(quiz);
    
  }
  var style = "";
  for (var i = 0; i < goals.length; i++) {
    complete.css(goals[i].property, goals[i].value);
    style += goals[i].property + ':' + goals[i].value + ';';
  };
  var canvas = document.getElementById("complete");
  var ctx = canvas.getContext("2d");
  var data = "<svg xmlns='http://www.w3.org/2000/svg' width='600' height='300'>" +
               "<foreignObject width='100%' height='100%'>" +
                 "<div xmlns='http://www.w3.org/1999/xhtml' style='padding:16px;'>" +
                   "<div style='"+style+"font-family:\"Hiragino Kaku Gothic Pro\";'>てきすと</div>" +
                 "</div>" +
               "</foreignObject>" +
             "</svg>";
  var DOMURL = self.URL || self.webkitURL || self;
  var img = new Image();
  var svg = new Blob([data], {type: "image/svg+xml;charset=utf-8"});
  var url = DOMURL.createObjectURL(svg);
  img.onload = function() {
      ctx.drawImage(img, 0, 0);
      DOMURL.revokeObjectURL(url);
  };
  img.src = url;
  $('#editor input').eq(0).focus();
  $('#editor .property').eq(0).addClass('focus');
  return d.promise();
}

function check (property) {
  return complete.css(property) == present.css(property);
}

// function alt () {
//   alert('右クリックさせないよ');
// }