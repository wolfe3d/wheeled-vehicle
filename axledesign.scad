/*Created by Doug Wolfe of wolfescience.com 2022
This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

//A 2mm drive axle works great with an axleOffset=15 and a axlediameter of 2.2
//A 3mm brake axle works great with an axleOffset = 2 and an axlediameter of 3.6

//diameter of axle in mm, maximum diameter = 14 mm
axleDiameter = 3.6; 
/*diameter of axle increase to allow axle to move.
A 2.2 diameter works for a 2mm axle on some 3d printers.
*/
//axle length from base
axleOffset = 2;
//length of base
baseLength = 10;
//thickness of base
baseThickness = 2;
//the width of the axle and base
axleWidth = 80;
//cut out of base width
cutWidth = 50;
//support axle thickness
axleSupportThickness = 4.4;
//mount holes
mounts = true;
//mount hole diameter
mountHoleDiameter = 3.4;
//mount holes distance across
mountWidth = 60;
//mount holes distance across
mountHoleNumber = 1;

// number of fragments in 360 degrees
$fn=180; 
//Do not change below here
axleHolder=axleDiameter+axleSupportThickness;

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
	//cut mount holes
	if  (mounts)
	{
		mountSpaceTotal = baseLength - 4; //minimum distance from edge is 2
		mountSpace = mountSpaceTotal/mountHoleNumber;
		echo ("Mountspace", mountSpace);
		position = 2 + mountSpace/2;
		echo ("position", position);
		for (a =[position:mountSpace:baseLength-4])
		{
		translate([-.01,a,axleWidth/2-mountWidth/2])
		rotate([0,90,0])
		cylinder(h=axleHolder+1,d=mountHoleDiameter);
		
		translate([-.01,a,axleWidth/2+mountWidth/2])
		rotate([0,90,0])
		cylinder(h=axleHolder+1,d=mountHoleDiameter);
		}
	}
}
 echo("Version:",version());
