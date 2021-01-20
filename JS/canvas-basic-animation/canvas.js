let canvas = document.querySelector("canvas");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

function Circle(x, y, radius, dx, dy) {
  this.x = x;
  this.y = y;
  this.radius = radius;
  this.dx = dx;
  this.dy = dy;

  this.draw = function () {
    c.beginPath();
    c.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    c.strokeStyle = "red";
    c.stroke();
  };

  this.bounce = function () {
    if (this.x + this.radius > innerWidth || this.x - this.radius < 0) {
      this.dx = -this.dx;
    }

    if (this.y + this.radius > innerHeight || this.y - this.radius < 0) {
      this.dx = this.dx;
    }

    this.x += this.dx;
    this.y += this.dx;

    this.draw();
  };
}

let c = canvas.getContext("2d");

let circles = [];
for (let i = 0; i < 100; i++) {
  let radius = 30;
  let randomX = Math.random() * (innerWidth - radius * 2) + radius;
  let randomY = Math.random() * (innerHeight - radius * 2) + radius;
  let randomDx = (Math.random() - 0.5) * 5;
  let randomDy = (Math.random() - 0.5) * 5;

  let circle = new Circle(randomX, randomY, 30, randomDx, randomDy);

  circles.push(circle);
}

function animate() {
  requestAnimationFrame(animate);
  c.clearRect(0, 0, innerWidth, innerHeight);

  for (let i = 0; i < circles.length; i++) {
    circles[i].bounce();
  }
}

animate();
