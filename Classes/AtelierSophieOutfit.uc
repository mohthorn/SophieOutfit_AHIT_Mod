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

	`if(`isdefined(WITH_GHOSTPARTY))
	if (a.IsA('Hat_GhostPartyPlayer'))
	{
		if (b)
		{
			if (Hat_GhostPartyPlayer(a).PlayerState.SubID > 0)
			{
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetSkeletalMesh(SkeletalMesh'AtelierSophieOutfit.SophieBKGP');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(0, Material'HatInTime_Characters_Coop.Materials.CoopCharacter_Hair');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(1, Material'AtelierSophieOutfit.Materials.CoopCharacter_Diffuse_NoShadow');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(2, MaterialInstanceTimeVarying'HatInTime_Characters_Coop.Expressions.Material.Expression_BowKid_Animated');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(3, MaterialInstanceTimeVarying'HatInTime_Characters_Coop.Expressions.Material.BowKid_Eyes_Animated');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(4, Material'HatInTime_Costumes2.Materials.VanessaOutfit_Diffuse');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(5, Material'AtelierSophieOutfit.Materials.Boots_Diffuse');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(6, Material'HatInTime_Characters_HatKid.Materials.HatKid_Costume_Hands');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(7, Material'AtelierSophieOutfit.Materials.BowKidMain');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(8, Material'AtelierSophieOutfit.Materials.Skirt_Inner');
            }
            else
            {
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetSkeletalMesh(SkeletalMesh'AtelierSophieOutfit.SophieHKGP');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(0, Material'HatInTime_Costumes2.Materials.VanessaOutfit_Diffuse');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(1, Material'AtelierSophieOutfit.Materials.Boots_Diffuse');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(2, Material'HatInTime_Characters_HatKid.Materials.HatKid_Costume_Hands');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(3, Material'AtelierSophieOutfit.Materials.HatkidMain');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(4, Material'AtelierSophieOutfit.Materials.Skirt_Inner');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(5, MaterialInstanceTimeVarying'HatInTime_Characters_HatKid.Expressions.Material.Expression_HatKid_Animated');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(6, Material'HatInTime_Characters_HatKid.Materials.HatKidBody');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(7, Material'HatInTime_Characters_HatKid.Materials.HatKidHair');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(8, Material'HatInTime_Characters_HatKid.Materials.HatKidHair');
				Hat_GhostPartyPlayer(a).SkeletalMeshComponent.SetMaterial(9, MaterialInstanceTimeVarying'HatInTime_Characters_HatKid.Expressions.Material.HatKid_Eyes_Animated');

            }
		}
		else
		{
			Hat_GhostPartyPlayer(a).SetPlayerVisual();
		}
		return;
	}
	`endif

	IsBowKid = CheckPlayerClass(a, class'Hat_Player_CoPartner');

	if (!IsBowKid && !CheckPlayerClass(a, class'Hat_Player_HatKid', true))
		return;
}