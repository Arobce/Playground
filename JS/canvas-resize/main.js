let canvas = document.querySelector("canvas");

canvas.width = innerWidth;
canvas.height = innerHeight;

let c = canvas.getContext("2d");

c.fillRect(100, 100, 100, 100);
c.fillRect(400,100,100,100);