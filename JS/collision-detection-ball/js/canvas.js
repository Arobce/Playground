const canvas = document.querySelector("canvas");
const c = canvas.getContext("2d");

class Circle {
  constructor(x, y, radius, color) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.color = color;
  }

  draw() {
    c.beginPath();
    c.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    c.fillStyle = this.color;
    c.fill();
    c.closePath();
  }

  update() {
    this.draw();
  }
}

// Implementation
let circle1, circle2;
function init() {
  circle1 = new Circle(300, 300, 100, "black");
  circle2 = new Circle(undefined, undefined, 30, "red");
}
