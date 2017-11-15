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
var time = 0;


ctx.font = "24px Arial";
ctx.fillStyle = "#0095DD";
ctx.fillText("BREAKOUT!", 200, 200);

var blocks = [];
for(c=0; c<blockColumnCount; c++) {
    blocks[c] = [];
    for(r=0; r<blockRowCount; r++) {
        blocks[c][r] = { x: 0, y: 0, active: 1, health: 100, color: "#0095DD"};
    }
}

function clickHandler(){
    document.getElementById("startButton").disabled = true;
    ctx.clearRect(0,0,canvas.width,canvas.height);
    setInterval(draw,10);
}
function keyDownHandler(k){
    if(k.keyCode == 39)  {
        rightPressed = true;
    }else if(k.keyCode == 37){
        leftPressed = true;
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
function blockCollision(){
    for(c = 0; c < blockColumnCount; c++){
        for(r = 0; r < blockRowCount; r++){		
            var brick = blocks[c][r];
            if(brick.active == 1){
                if(x > brick.x && x < brick.x+blockWidth && y > brick.y && y < brick.y+blockHeight){
                    dy=-dy;
                    brick.health -= 33;
                    if(brick.health <= 100 && brick.health > 66 ){
                        brick.color = "#dd0024";
                        break;
                    }else if(brick.health <= 66 && brick.health > 33){
                        brick.color = "#00bc16";
                        break;
                    }else{ 
                        brick.active = 0;
                        score++;
                        break;
                    } 
                    
                }if(score >= (blockColumnCount * blockRowCount)){
                    alert("YOU WON!");
                    document.location.reload();
                    return;
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
function draw(){
    time++;
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
        if(x > paddleX && x < paddleX + paddleWidth) {
            dy = -dy;
        }
        else if(y + dy > canvas.height){
            document.location.reload();
            alert("GAME OVER");
            
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