// Created by Crowbar 0.71

$modelname "w_mike32.mdl"

$bodygroup "receiver"
{
	studio "w_mike32.smd"
}

$surfaceprop "weapon"

$contents "solid"

$illumposition 0 0 0

$mostlyopaque

$cdmaterials "zeron\weapons\mgl\"
$cdmaterials "viper\MW\attachments\"

$attachment "muzzle" "tag_flash" 0 0 0 rotate 0 0 0
$attachment "right_hand" "ValveBiped.Bip01_R_Hand" 0 0 0 rotate 0 0 0
$attachment "shell_eject" "tag_brass" 0 0 0 rotate -20 0 0
$attachment "reflex" "tag_reflex" 0 0 0 rotate 0 0 0
$attachment "holo" "tag_holo" 0 0 0 rotate 0 0 0
$attachment "scope" "tag_scope" 0 0 0 rotate 0 0 0
$attachment "acog" "tag_acog_2" 0 0 0 rotate 0 0 0
$attachment "thermal" "tag_thermal" 0 0 0 rotate 0 0 0
$attachment "hybrid" "tag_hybrid" 0 0 0 rotate 0 0 0
$attachment "align" "tag_align_gun" 0 0 0 rotate 0 0 0
$attachment "laser" "tag_laser_attach" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -5.748 -4.755 -11.269 0 3.351 25.514

$definebone "ValveBiped.Bip01_R_Hand" "" 0 0 0 0 0 0 0 0 0 0 90 90
$definebone "tag_sling" "ValveBiped.Bip01_R_Hand" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "tag_thermal" "tag_sling" 1.449 0.576 1.778 0 0 0 2.04 0.00 1.87 0 0 0
$definebone "ValveBiped.Anim_Attachment_RH" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "tag_acog_2" "tag_sling" 1.449 0.576 1.778 0 0 0 2.04 0.00 1.87 0 0 0
$definebone "tag_align_gun" "tag_sling" 0.58 0.576 2.105 0 0 0 0 0 0 0 0 0
$definebone "tag_barrel_attach" "tag_sling" 3.998 0.576 0.883 0 0 0 0 0 0 0 0 0
$definebone "tag_flash" "tag_barrel_attach" 18.690998 0 0.049 0 0 0 0 0 0 0 0 0
$definebone "tag_laser_show" "tag_barrel_attach" 11.498997 0 -0.722 0 0 0 0 0 0 0 0 0
$definebone "tag_laser_attach" "tag_laser_show" -0.052998 -1.34 0.042 0 0 0 -4.15 1.340 2.0 0 0 0
$definebone "tag_brass" "tag_sling" 2.432 0.204 0.979 0 -89.999982 0 0 0 0 0 0 0
$definebone "tag_holo" "tag_sling" 1.449 0.576 1.778 0 0 0 2.04 0.00 1.87 0 0 0
$definebone "tag_hybrid" "tag_sling" 1.449 0.576 1.778 0 0 0 2.04 0.00 1.87 0 0 0
$definebone "tag_ik_loc_le" "tag_sling" 7.122 2.145 -1.617 1.746032 -26.647409 -121.67452 0 0 0 0 0 0
$definebone "tag_ik_loc_ri" "tag_sling" -5.116 -1.445 -0.98 23.98854 16.005063 -98.375659 0 0 0 0 0 0
$definebone "tag_mag_attach" "tag_sling" 5.373001 0.576 -1.515 0 0 0 0 0 0 0 0 0
$definebone "j_mag1" "tag_mag_attach" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "j_mag2" "tag_mag_attach" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "tag_rack_attach" "tag_sling" -9.321999 0.576 -2.262 0 0 0 0 0 0 0 0 0
$definebone "tag_reflex" "tag_sling" 1.449 0.576 1.778 0 0 0 2.04 0.00 1.87 0 0 0
$definebone "tag_scope" "tag_sling" 1.449 0.576 1.778 0 0 0 2.04 0.00 1.87 0 0 0
$definebone "tag_stock_attach" "tag_sling" -1.293 0.576 -0.344 0 0 0 0 0 0 0 0 0
$definebone "j_hoop" "tag_sling" 0.155 1.328 1.066 0 -89.996485 89.999982 0 0 0 0 0 0
$definebone "j_gun" "" 0 0 0 0 0 0 0 0 0 0 0 0

$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "tag_sling"
$bonemerge "tag_acog_2"
$bonemerge "tag_barrel_attach"
$bonemerge "tag_laser_show"
$bonemerge "tag_laser_attach"
$bonemerge "tag_holo"
$bonemerge "tag_hybrid"
$bonemerge "tag_ik_loc_le"
$bonemerge "tag_ik_loc_ri"
$bonemerge "tag_mag_attach"
$bonemerge "j_mag1"
$bonemerge "j_mag2"
$bonemerge "tag_rack_attach"
$bonemerge "tag_reflex"
$bonemerge "tag_scope"
$bonemerge "tag_stock_attach"

$jigglebone "j_hoop"
{
	is_flexible
	{
		length 0.75
		tip_mass 5
		pitch_stiffness 10
		pitch_damping 5
		yaw_stiffness 10
		yaw_damping 5
		along_stiffness 10
		along_damping 10
		pitch_constraint -90.000003 90.000003
		pitch_friction 0
		pitch_bounce 50
		yaw_constraint -90.000003 90.000003
		yaw_friction 0
		yaw_bounce 50
		angle_constraint 25
	}
}

$sequence "reference" {
	"w_sbeta_anims\reference.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_sbeta_physics.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
