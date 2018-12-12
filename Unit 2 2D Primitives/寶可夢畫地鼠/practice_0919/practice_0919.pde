size(400,600);
background(240);

translate(0,-10);

//ball
fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(200, 500, 95, 95); //黑色中心環
fill(#BE101E);
arc(200, 497, 100, 95, PI, TWO_PI, CHORD); //紅色上半球
fill(230);
arc(200, 503, 100, 95, 0, PI, CHORD); //白色下半球
strokeWeight(5); 
ellipse(200, 500, 25, 25); //白色外環按鈕
strokeWeight(1); 
ellipse(200, 500, 15, 15); //白色內圈按鈕

translate(0,35);

//diglett soil
fill(#948453);
stroke(50);
ellipse(200, 275, 300 , 100);

//diglett body
fill(#8F6133);
noStroke();
rect(125, 150, 150, 126); //身體中段長方形
stroke(#2E2615);
strokeWeight(2); 
arc(200, 150, 150, 150, PI, TWO_PI, OPEN); //身體上段圓弧
arc(200, 275, 150, 50, 0, PI, OPEN);  //身體下段圓弧
line(125, 150, 125, 275); //身體中段邊框-左
line(275, 150, 275, 275); //身體中段邊框-右

//diglett nose
fill(#AA363D);
stroke(#772921);
ellipse(200, 170, 55, 35);

//diglett eyes
fill(0);
noStroke();
rectMode(CENTER);
ellipse(175, 130, 9, 32); //左眼
ellipse(225, 130, 9, 32); //右眼

//diglett reflection
fill(210);
ellipse(175, 121, 6, 10); //左青光眼
ellipse(225, 121, 6, 10); //右青光眼
ellipse(190, 163, 20, 15); //油鼻頭