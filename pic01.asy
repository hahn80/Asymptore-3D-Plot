settings.outformat="pdf";
settings.prc=false;
settings.render=10;
/*settings.gray=true;*/
settings.tex="pdflatex";

import graph3;
import palette;
import three;
import smoothcontour3;
size(1cm,0);
size(4cm,0);
currentprojection = orthographic(0.5,1,0.5);

real fn(real x, real y, real z) {
	return x**2 + 2*y**3 + 3**z**3-4;
}

triple f(pair P) {
	real x = (P.x)*cos(P.y);
	real y = (P.x)*sin(P.y)/sqrt(3);
	return (x, y, x^2+3*y^2);
	}

triple g(pair P) {
	real x = (P.x)*cos(P.y);
	real y = (P.x)*sin(P.y);
	return (x, y, 4-x^2-y^2);
	}
	
triple r(real t) {
	real x = sqrt(2)*cos(t);
	real y = sin(t);
	return (x, y, x^2+3*y^2);
}

real alpha = 2*pi;

surface s1 = surface(f, (0,0),(2,alpha), Spline);
surface s2 = surface(g, (0,0),(2,alpha), Spline);
path3 c = graph(r, 0, alpha);
//surface s = implicitsurface(fn, (-2,-2,-2), (2, 2, 2), overlapedges=true, nx=20, nz=5);

draw(-1X -- 2.5X,arrow=Arrow3(TeXHead2), L=Label("$x$",position=EndPoint, align=W));
draw(-1.5Y -- 2.5Y,arrow=Arrow3(TeXHead2), L=Label("$y$",position=EndPoint));
draw(-1Z -- 4.5Z, arrow=Arrow3(TeXHead2), L=Label("$z$",position=EndPoint));

draw(s1, blue+opacity(0.2));
draw(s2, green+opacity(0.3));
draw(c, yellow);
//draw(s, red+opacity(0.4));
