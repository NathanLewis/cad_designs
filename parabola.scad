// octave
// x = -2:0.1:2;
// [xx,yy] = meshgrid(x,x);
// z = xx.^2+yy.^2;
// save("parabola.dat", "z");

difference() {
	surface(file = "parabola.dat", center = true);
	cylinder(r=1.5, h=35, center=true,$fn=200);
}
