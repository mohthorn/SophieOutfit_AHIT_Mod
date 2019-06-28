class AtelierSophieOutfit extends Hat_Collectible_Skin;
defaultproperties
{
	HUDIcon = Texture2D'AtelierSophieOutfit.SophieOutfitIcon'
	ItemName = "SophieOutfitName"
	ItemDescription(0) = "Sophie_Outfit"
	ItemQuality = class'Hat_ItemQuality_Legendary'
	SupportsRoulette=false
	SkinBodyMesh = SkeletalMesh'AtelierSophieOutfit.SophieOutfit'
	SkinLegsMesh = SkeletalMesh'AtelierSophieOutfit.SophieLegs'
	SkinBodyMeshBowKid = SkeletalMesh'AtelierSophieOutfit.SophieOutfitBow'

	SkinColor[SkinColor_Hair] = (R=123, G=57, B=69)
	SkinColor[SkinColor_Hat] = (R=255, G=248, B=212)
	SkinColor[SkinColor_HatAlt] = (R=197, G=145, B=85)
	SkinColor[SkinColor_Cape] = (R=45, G=78, B=97)
	SkinColor[SkinColor_Dress] = (R=244, G=222, B=211)
	SkinColor[SkinColor_Pants] = (R=167, G=36, B=41)
	SkinColor[SkinColor_Zipper] = (R=125, G=85, B=69)
}

static function Apply(Actor a)
{
	SetCostume(a, true);
	Super.Apply(a);
	if (CheckPlayerClass(a, class'Hat_Player_CoPartner', true))
	{
	SetHeadMaterial(a, 0, MaterialInstanceTimeVarying'HatInTime_Characters_Coop.Expressions.Material.BowKid_Eyes_Animated');	
	SetHeadMaterial(a, 1, MaterialInstanceTimeVarying'HatInTime_Characters_Coop.Expressions.Material.Expression_BowKid_Animated');	
	SetHeadMaterial(a, 2, Material'AtelierSophieOutfit.Materials.CoopCharacter_Diffuse_NoShadow');		
	SetExpressionComponent(a, class'Hat_ExpressionComponent_BowKid');
	}	
}

static function Removed(Actor a)
{
	SetCostume(a, false);
	SetHeadMaterial(a);
	SetExpressionComponent(a);
}


static function SetCostume(Actor a, bool b)
{
	local bool IsBowKid;
	local Hat_GhostPartyPlayer gp;	
	
	`if(`isdefined(WITH_GHOSTPARTY))
	if (a.IsA('Hat_GhostPartyPlayer'))
	{
		gp = Hat_GhostPartyPlayer(a);
		if (b)
		{
			if (gp.SkeletalMeshComponent.SkeletalMesh == gp.default.OneMeshBowKid)
			{
				gp.SkeletalMeshComponent.SetSkeletalMesh(SkeletalMesh'AtelierSophieOutfit.SophieBKGP');
				gp.SkeletalMeshComponent.SetMaterial(0, Material'HatInTime_Characters_Coop.Materials.CoopCharacter_Hair');
				gp.SkeletalMeshComponent.SetMaterial(1, Material'AtelierSophieOutfit.Materials.CoopCharacter_Diffuse_NoShadow');
				gp.SkeletalMeshComponent.SetMaterial(2, MaterialInstanceTimeVarying'HatInTime_Characters_Coop.Expressions.Material.Expression_BowKid_Animated');
				gp.SkeletalMeshComponent.SetMaterial(3, MaterialInstanceTimeVarying'HatInTime_Characters_Coop.Expressions.Material.BowKid_Eyes_Animated');
				gp.SkeletalMeshComponent.SetMaterial(4, Material'HatInTime_Costumes2.Materials.VanessaOutfit_Diffuse');
				gp.SkeletalMeshComponent.SetMaterial(5, Material'AtelierSophieOutfit.Materials.Boots_Diffuse');
				gp.SkeletalMeshComponent.SetMaterial(6, Material'HatInTime_Characters_HatKid.Materials.HatKid_Costume_Hands');
				gp.SkeletalMeshComponent.SetMaterial(7, Material'AtelierSophieOutfit.Materials.BowKidMain');
				gp.SkeletalMeshComponent.SetMaterial(8, Material'AtelierSophieOutfit.Materials.Skirt_Inner');
            }
            else
            {
				gp.SkeletalMeshComponent.SetSkeletalMesh(SkeletalMesh'AtelierSophieOutfit.SophieHKGP');
				gp.SkeletalMeshComponent.SetMaterial(0, Material'HatInTime_Costumes2.Materials.VanessaOutfit_Diffuse');
				gp.SkeletalMeshComponent.SetMaterial(1, Material'AtelierSophieOutfit.Materials.Boots_Diffuse');
				gp.SkeletalMeshComponent.SetMaterial(2, Material'HatInTime_Characters_HatKid.Materials.HatKid_Costume_Hands');
				gp.SkeletalMeshComponent.SetMaterial(3, Material'AtelierSophieOutfit.Materials.HatkidMain');
				gp.SkeletalMeshComponent.SetMaterial(4, Material'AtelierSophieOutfit.Materials.Skirt_Inner');
				gp.SkeletalMeshComponent.SetMaterial(5, MaterialInstanceTimeVarying'HatInTime_Characters_HatKid.Expressions.Material.Expression_HatKid_Animated');
				gp.SkeletalMeshComponent.SetMaterial(6, Material'HatInTime_Characters_HatKid.Materials.HatKidBody');
				gp.SkeletalMeshComponent.SetMaterial(7, Material'HatInTime_Characters_HatKid.Materials.HatKidHair');
				gp.SkeletalMeshComponent.SetMaterial(8, Material'HatInTime_Characters_HatKid.Materials.HatKidHair');
				gp.SkeletalMeshComponent.SetMaterial(9, MaterialInstanceTimeVarying'HatInTime_Characters_HatKid.Expressions.Material.HatKid_Eyes_Animated');

            }
		}
		else
		{
			gp.SetPlayerVisual();
		}
		return;
	}
	`endif

	IsBowKid = CheckPlayerClass(a, class'Hat_Player_CoPartner');

	if (!IsBowKid && !CheckPlayerClass(a, class'Hat_Player_HatKid', true))
		return;
}