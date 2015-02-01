$(function(){

  canvas = document.getElementById('canvas')
  ctx = canvas.getContext('2d');

  canvasWidth = canvas.width;
  canvasHeight = canvas.height;

  init();
});

function init() {
  createCircles();
  draw();
}

function draw() {
  requestAnimationFrame(draw);
  render();
}

function createCircles(){
  circles = [];
  for(i=0;i<6;i++){
    circles.push(createCircle(Math.random()*canvasWidth,Math.random()*canvasHeight));
  }
}

function createCircle(x,y){
  var hasline = ( ( Math.random() * 100 ) > 0) ? true : false;
  var blur = ( ( Math.random() * 100 ) > 50) ? 0 : 0;
  return {'x': x,
          'y': y,
          'dx': .5 - Math.random()*1,
          'dy': .5 - Math.random()*1,
          'hasline': hasline,
          'blur': blur,
          'point1': Math.floor(Math.random()*circles.length),
          'point2': Math.floor(Math.random()*circles.length),
          'point3': Math.floor(Math.random()*circles.length)
         }
}

function drawCircles(){
  circles.forEach(function(c, index) {
    ctx.beginPath();
    ctx.arc(c.x, c.y, 4, 0, 360, false);
    ctx.fillStyle = '#fff';
    ctx.shadowBlur = c.blur;
    ctx.shadowColor = 'rgb(0, 216, 255)';
    drawCircleLine();
    checkReflection(c)
    c.x += c.dx;
    c.y += c.dy;
  });
}
function drawCircleLine(){
  ctx.beginPath();
  var hue = Math.sin(Date.now()/100000)*180+180
  ctx.fillStyle = 'hsla('+hue+', 100%, 50%, 0.03)';
  ctx.strokeStyle = 'hsla('+hue+', 100%, 50%, 0.1)';
  circles.forEach(function(c, index) {
    ctx.moveTo(c.x,c.y);
    var num = Math.floor(Math.random()*circles.length);
    ctx.lineTo(circles[c.point1].x,circles[c.point1].y)
    ctx.lineTo(circles[c.point2].x,circles[c.point2].y)
    ctx.lineTo(circles[c.point3].x,circles[c.point3].y)
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
    ctx.beginPath();
  })
}

function checkReflection(circle){
  if(circle.x > canvasWidth || circle.x < 0) circle.dx *= -1;
  if(circle.y > canvasHeight || circle.y < 0) circle.dy *= -1;
}

function render() {
  ctx.clearRect(0,0,canvasWidth,canvasHeight);
  drawCircles();
}
