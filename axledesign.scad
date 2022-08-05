/*Created by Doug Wolfe of wolfescience.com 2022
This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

//A 2mm drive axle works great with an axleOffset=15 and a axlediameter of 2.2
//A 3mm brake axle works great with an axleOffset = 2 and an axlediameter of 3.6

//diameter of axle in mm, maximum diameter = 14 mm
axleDiameter = 3.6; //diameter of axle increase to allow axle to move.  
//A 2.2 diameter works for a 2mm axle on some 3d printers.
axleOffset = 2; //axle length from base
baseLength = 10; //length of base
baseThickness = 2;
axleWidth = 80; //the width of the axle and base
cutWidth = 50;
axleSupportThickness = 4.4;


//Do not change below here
axleHolder=axleDiameter+axleSupportThickness;
$fn=180; // number of fragments in 360 degrees

difference()
{
	outer();
	cut();
}

//cylinder(h=4,d=50,center=true);

module outer()
{
	
cube([baseThickness,baseLength+axleOffset+axleHolder,axleWidth]);
	hull(){
translate([0,baseLength-3,0])
cube([baseThickness,1,axleWidth]);
translate([baseThickness,baseLength+axleOffset,0])
cube([axleHolder,axleHolder,axleWidth]);
	}
}

module cut()
{
	//cut offset
	translate([-.01,baseLength-.01,axleHolder])
cube([baseThickness+axleHolder+.02,axleOffset+.02,axleWidth-axleHolder*2]);
	//cut under axle
translate([-.01,baseLength+axleOffset-.01,axleHolder])
cube([baseThickness+axleHolder+.02,axleHolder+.02,axleWidth-axleHolder*2]);
	//cut axle hole
translate([baseThickness+axleHolder/2,baseLength+axleOffset+axleHolder/2,-.01])
cylinder(h=axleWidth+1,d=axleDiameter);
}
 echo("Version:",version());
