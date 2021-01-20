let canvas = document.querySelector("canvas");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let mouse = {
  x: undefined,
  y: undefined,
};

let maxRadius = 60;
let minRadius = 2;
let gravity = 1;
let friction = 0.8;
let colorArray = ["#D96E24", "#E09D48", "#E6D89D", "#89C2B5", "#00083E"];

window.addEventListener("click",function(e){
  init();
});

window.addEventListener("mousemove", function (e) {
  mouse.x = e.x;
  mouse.y = e.y;
});

window.addEventListener("resize", function () {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  init();
});

function Ball(x, y, radius, dx, dy) {
  this.x = x;
  this.y = y;
  this.radius = radius;
  this.dx = dx;
  this.dy = dy;
  this.minRadius = radius;
  let color = colorArray[Math.floor(Math.random() * colorArray.length) - 1];
  
  this.draw = function () {
    c.beginPath();
    c.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    c.fillStyle = color;
    c.fill();
  };

  this.bounce = function () {
    if(this.y + this.radius > canvas.height){
      this.dy = -this.dy * friction;
    }else{
      this.dy += gravity;
    }
    this.y += this.dy;
    this.draw();
  };
}

let c = canvas.getContext("2d");
let balls = [];
function init() {
  balls = [];
  for (let i = 0; i < 800; i++) {
    let radius = Math.random() * 20 + 1;
    let randomX = Math.random() * (innerWidth - radius * 2) + radius;
    let randomY = Math.random() * (innerHeight - radius * 2) + radius;
    let randomDx = (Math.random() - 0.5) * 5;
    let randomDy = (Math.random()) * 5;

    let ball = new Ball(randomX, randomY, radius, randomDx, randomDy);

    balls.push(ball);
  }
}

function animate() {
  requestAnimationFrame(animate);
  c.clearRect(0, 0, innerWidth, innerHeight);

  for (let i = 0; i < balls.length; i++) {
    balls[i].bounce();
  }
}

init();
animate();
