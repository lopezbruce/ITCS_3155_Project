//= require jquery
//= require jquery_ujs
//import Rails from 'rails.ujs';
//Rails.start();

var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
var ballRadius = 10;
var x = canvas.width/2;
var y = canvas.height-30;
var dx = 2;
var dy = -2;
var paddleHeight = 10;
var paddleWidth = 75;
var paddleX = (canvas.width-paddleWidth)/2;
var rightPressed = false;
var leftPressed = false;
var blockWidth = Math.floor(Math.random() * 75) + 50;
var blockHeight = 20;
var blockPadding = 5;
var blockOffsetTop = 10;
var blockOffsetLeft = 10;
var blockRowCount = 5;
var blockColumnCount = Math.ceil((canvas.width - 100)/blockWidth);
var score = 0;
var won = 0;
var myVar;
var repeat = true;

//document.getElementById("postButton").disabled = true;
ctx.font = "24px Arial";
ctx.fillStyle = "#0095DD";
ctx.fillText("BREAKOUT! EASY", 200, 200);

var blocks = [];
for(c=0; c<blockColumnCount; c++) {
    blocks[c] = [];
    for(r=0; r<blockRowCount; r++) {
        blocks[c][r] = { x: 0, y: 0, active: 1, health: 100, color: "#0095DD"};
    }
}

function postHandler(){
    alert("Yeah you cliked me congrats");
    $.ajax({
    url: '/controllers/game_controller',
    type: 'post',
    data: {data_value: JSON.stringify(score)}
  });
    
    alert("Sent " + posts.length + " posts");
}

function clickHandler(){
    document.getElementById("startButton").disabled = true;
    ctx.clearRect(0,0,canvas.width,canvas.height);
    myVar = setInterval(draw,10);
}
function keyDownHandler(k){
    if(k.keyCode == 39)  {
        rightPressed = true;
    }else if(k.keyCode == 37){
        leftPressed = true;
    }else if(k.keyCode == 87){
        for(c in blocks){
            c.health = 0;
            score = (blockRowCount * blockColumnCount);
        }
        repeat = true;
    }
}
function keyUpHandler(k){
    if(k.keyCode == 39){
        rightPressed = false;
    }else if(k.keyCode == 37){
        leftPressed = false;
    }
}


function drawPaddle(){
    ctx.beginPath();
    ctx.rect(paddleX, canvas.height-paddleHeight-10, paddleWidth, paddleHeight); 
    ctx.fillStyle  = "#0095DD";
    ctx.fill();
    ctx.closePath();
}

function drawBall(){
    ctx.beginPath();
    ctx.arc(x,y,ballRadius,0, Math.PI*2);
    ctx.fillStyle = "#0095DD";
    ctx.fill();
    ctx.closePath();
}
function drawBlocks() {
    for(c=0; c<blockColumnCount; c++) {
        for(r=0; r<blockRowCount; r++) {
            if(blocks[c][r].active == 1){
                var blockX = (c*(blockWidth+blockPadding))+blockOffsetLeft;
                var blockY = (r*(blockHeight+blockPadding))+blockOffsetTop;
                blocks[c][r].x = blockX;
                blocks[c][r].y = blockY;
                ctx.beginPath();
                ctx.rect(blockX, blockY, blockWidth, blockHeight);
                ctx.fillStyle = blocks[c][r].color;
                ctx.fill();
                ctx.closePath();
            }
        }
    }
}

function RectCircleColliding(circle,rect){
    var distX = Math.abs(circle.x - rect.x-rect.w/2);
    var distY = Math.abs(circle.y - rect.y-rect.h/2);

    if (distX > (rect.w/2 + circle.r)) { return false; }
    if (distY > (rect.h/2 + circle.r)) { return false; }

    if (distX <= (rect.w/2)) { return true; } 
    if (distY <= (rect.h/2)) { return true; }

    var dx=distX-rect.w/2;
    var dy=distY-rect.h/2;
    return (dx*dx+dy*dy<=(circle.r*circle.r));
}

function blockCollision(){
    for(c = 0; c < blockColumnCount; c++){
        for(r = 0; r < blockRowCount; r++){		
            var brick = blocks[c][r];
            var circle={x:x,y:y,r:10};

            if(brick.active == 1){
                var rect={x:brick.x,y:brick.y,w:blockWidth,h:blockHeight};
                if (RectCircleColliding(circle, rect)){
               /*if(x > brick.x && x < brick.x+blockWidth && y > brick.y && y < brick.y+blockHeight){ changed to better collision detection*/
                    if (y>=brick.y && y<=brick.y+blockHeight)
                    {
                        dx=-dx;
                    }
                    else{
                        dy=-dy;
                    }
                    brick.health -= 100;
                    if(brick.health <= 100 && brick.health > 66 ){
                        brick.color = "#dd0024";
                    }else if(brick.health <= 66 && brick.health > 33){
                        brick.color = "#00bc16";
                    }else if (brick.health <= 33){ 
                        brick.active = 0;
                        score++;
                    }
                    
                }if(score >= (blockColumnCount * blockRowCount)){
                    //document.getElementById("postButton").disabled = false;
                    if(repeat == true){
                        clearInterval(myVar);
                        repeat = popupHandler("You Won!", true, score);
                        canvas.clearRect(0,0,canvas.height, canvas.width);
                    }else{
                        alert("An unexpected error was encountered");
                    }
                }
            }
        }
    }
}
function drawScore(){
    ctx.font = "16px Arial";
    ctx.fillStyle = "#0095DD";
    ctx.fillText("Score: "+score, 8, 200);
}
function popupHandler(a, r,s){
    if(r == false){
        alert("Error");
        return true;
    }else{
        alert(a.toString());
        alert("Score: " + s.toString());
        jQuery.ajax({
                    type: "post",
                    url: "/users/save_score",
                    dataType: "text",
                    data: {newScore: s.toString()},
                    success: function(exception){alert("Score successfully went through!");}, 
                    error: function(exception){alert("Score encountered error");}
                    });
        return false;
    }
}
function draw(){
    ctx.clearRect(0,0, canvas.width, canvas.height);
    drawBall();
    drawPaddle();
    blockCollision();
    drawBlocks();
    drawScore();
    if(x + dx > canvas.width-ballRadius || x + dx < ballRadius) {
        dx = -dx;
    }if(y + dy < ballRadius) {
        dy = -dy;
    } else if(y + dy > canvas.height-ballRadius-10) {
        if(x > paddleX && x < paddleX + paddleWidth && !(y + dy > canvas.height - 10)) {
            dy = -dy;
        }
        else if(y + dy > canvas.height){
            if(repeat == true){
                repeat = popupHandler("Game Over", repeat, score);;
                document.location.reload();
            }
        }
    }
    if(rightPressed && paddleX < canvas.width-paddleWidth){
        paddleX += 7;
    }else if (leftPressed && paddleX > 0){
        paddleX -= 7;
    }
    x += dx;
    y += dy;

}




document.addEventListener("keydown", keyDownHandler, false);
document.addEventListener("keyup", keyUpHandler, false);

document.getElementById("startButton").addEventListener("click", clickHandler,false);
document.getElementById("postButton").addEventListener("click", postHandler, false);
