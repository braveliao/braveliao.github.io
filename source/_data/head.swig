<script>
document.addEventListener('DOMContentLoaded', () => {
    // 创建canvas元素
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    let particles = [];
    
    // 设置canvas样式
    canvas.style.position = 'fixed';
    canvas.style.pointerEvents = 'none';
    canvas.style.top = '0';
    canvas.style.left = '0';
    canvas.style.zIndex = '999999';
    document.body.appendChild(canvas);

    // 调整canvas大小
    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    // 粒子类
    class Particle {
        constructor(x, y) {
            this.x = x;
            this.y = y;
            this.size = Math.random() * 3 + 1;
            this.speedX = Math.random() * 2 - 1;
            this.speedY = Math.random() * 2 - 1;
            this.life = 20;
        }

        update() {
            this.x += this.speedX;
            this.y += this.speedY;
            this.life--;
        }

        draw() {
            ctx.fillStyle = `rgba(0, 115, 170, ${this.life/20})`;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    // 鼠标移动时创建粒子
    let mouseX = 0;
    let mouseY = 0;
    let frame = 0;
    
    document.addEventListener('mousemove', (e) => {
        mouseX = e.clientX;
        mouseY = e.clientY;
        
        // 每3帧创建一个粒子
        if(frame % 3 === 0) {
            particles.push(new Particle(mouseX, mouseY));
        }
    });

    // 动画循环
    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        frame++;
        
        // 更新和绘制粒子
        for(let i = particles.length - 1; i >= 0; i--) {
            particles[i].update();
            particles[i].draw();
            
            if(particles[i].life <= 0) {
                particles.splice(i, 1);
            }
        }
        
        requestAnimationFrame(animate);
    }
    animate();
});
</script>
