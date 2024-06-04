$fn = 128;
/* difference() {
    cylinder(d=18.85+2, h=5, center=true);
    #cylinder(d=18.85, h=12, center=true);
    cylinder(d=19, h=12, center=true);

}
 */
translate([0,0,0]) difference(){
    cylinder(r=25, h=5, center=true);
    cylinder(r=22.5, h=15, center=true);

    }