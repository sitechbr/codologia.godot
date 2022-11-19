// Particles Module
PointJS.Module = function (pjs) {
	'use strict';

	const ctx = pjs.system.getContext();
	const M = pjs.math;
	const particles = [];
	var limit = 1000;
	const updateParticles = function () {
		let i = particles.length - 1;
		for(; i>=0; i--) {
			particles[i].draw();
			if (particles[i].alpha <= 0 || particles[i].radius < 1) {
				particles.splice(i, 1);
			}
		}
	};

	class Particle {

		constructor (w, h, type, x, y, clr, size, speed, step) {
			speed *= 100;
			this.dx = M.random(-speed, speed, true) / 100;
			this.dy = M.random(-speed, speed, true) / 100;
			this.startX = this.x = x + M.random(-w, w);
			this.startY = this.y = y + M.random(-h, h);
			this.speed = speed / 100;
			this.color = clr;
			this.radius = size;
			this.step = step;
			this.alpha = 1;

			this.type = {
				'circle' : 0,
				'gravity' : 1,
				'fire' : 2,
				'smoke' : 3
			}[type];


			if (this.type === 3) // smoke
				this.alpha = 0.8;
		}

		getDist () {
			return Math.sqrt(Math.pow(this.startX - this.x, 2) + Math.pow(this.startY - this.y, 2));
		}

		draw () {

			if (this.type === 1) { // gravity
				this.dy += this.speed / 10;
			} else if (this.type === 2) { // fire
				if (this.radius > 1) this.radius -= this.speed / 10;
				if (this.dy > 0) this.dy = 0;
				this.dy -= this.speed / 20;
				if (this.radius > 0) this.radius -= this.speed / 10;
			} else if (this.type === 3) { // smoke
				if (this.dy > 0) this.dy = -0.5;
				this.dy -= this.speed / 100;
			}

			if (this.dx <= 0) this.dx += this.speed / 20;
			if (this.dx >= 0) this.dx -= this.speed / 20;

			this.x += this.dx * pjs.game.getDT(10);
			this.y += this.dy * pjs.game.getDT(10);

			this.alpha -= this.step;
			if (this.alpha < 0) return;
			var old = ctx.globalAlpha;
			ctx.globalAlpha = this.alpha;
			pjs.brush.drawRect({
				x : this.x - this.radius, y : this.y - this.radius,
				w : this.radius,
				h : this.radius,
				fillColor : this.color
			});
			ctx.globalAlpha = old;
		}

	}

	pjs.particles = {};

	pjs.particles.setLimit = function (lim) {
		limit = lim;
	};

	pjs.particles.add = function (obj) {
		if (obj.density) {
			let i = obj.density;
			for (; i>=0; i--) {
				particles.push(new Particle(obj.width || 1, obj.height || 1, obj.type || 'gravity', obj.position.x || 0, obj.position.y || 0, obj.fillColor, obj.size, obj.speed || 10, obj.step || 0.01));
			}
		} else
			particles.push(new Particle(obj.width || 1, obj.height || 1, obj.type || 'gravity', obj.position.x || 0, obj.position.y || 0, obj.fillColor, obj.size, obj.speed || 10, obj.step || 0.01));
	};



	pjs.system.addEvent('postLoop', 'updateParticles', function () {
		updateParticles();
	});

};