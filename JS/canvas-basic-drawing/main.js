let canvas = document.querySelector("canvas");

canvas.width = innerWidth;
canvas.height = innerHeight;

let c = canvas.getContext("2d");

c.fillStyle = "rgba(255,0,0,0.5)";
c.fillRect(100, 100, 100, 100);
c.fillStyle = "rgba(0,255,0,0.5)";
c.fillRect(400, 100, 100, 100);
c.fillStyle = "rgba(0,0,255,0.5)";
c.fillRect(300, 300, 100, 100);

// Line
c.beginPath();
c.moveTo(50, 300);
c.lineTo(300, 100);
c.lineTo(400, 300);
c.strokeStyle = "#fa34a3";
c.stroke();

// Arc / Circle
c.beginPath();
c.arc(300, 300, 30, 0, Math.PI * 2, false);
c.strokeStyle = "blue";
c.stroke();

for (let i = 0; i < 100; i++) {
  let color = ["red", "blue", "green"];
  let index = Math.floor(Math.random() * Math.floor(color.length)); 
  let x = Math.random() * innerWidth;
  let y = Math.random() * innerHeight;
  c.beginPath();
  c.arc(x, y, 30, 0, Math.PI * 2, false);
  c.strokeStyle = color[index];
  c.stroke();
}
