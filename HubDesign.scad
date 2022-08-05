//diameter of axle in mm, maximum diameter = 14 mm
axleDiameter = 2;
hubInterface=axleDiameter+2.4;
$fn=180; // number of fragments in 360 degrees

difference()
{
outer();
 cylinder(h=50,d=axleDiameter,center=true);
}

//cylinder(h=4,d=50,center=true);

module outer()
{
translate([0,0,1])
cylinder(h=2,d1=22,d2=25,center=true);
translate([0,0,2.8])
cylinder(h=1.6, d=15.4, center=true);
translate([0,0,4])
cylinder(h=1, d=16, center=true);
translate([0,0,5.5])
cylinder(h=2,d1=16,d2=12,center=true);
translate([0,0,7.2])
cylinder(h=1.6, d=hubInterface, center=true);
}
 echo("Version:",version());
