class AtelierSophieOutfitMod extends GameMod
	config(Mods);

event OnModLoaded()
{
  HookActorSpawn(class'Hat_Player', 'Hat_Player');
  GiveItem(true);
}

event OnHookedActorSpawn(Object NewActor, Name Identifier)
{
  if (Identifier == 'Hat_Player')
  {
    GiveItem(true);
  }
}


event OnModUnloaded()
{
  GiveItem(false);
}

function GiveItem(bool b)
{
	if (b)
	{
    Hat_PlayerController(GetALocalPlayerController()).GetLoadout().AddBackpack(class'Hat_Loadout'.static.MakeLoadoutItem(class'AtelierSophieOutfit'), false);
  }
	else
	{
    Hat_PlayerController(GetALocalPlayerController()).GetLoadout().RemoveBackpack(class'Hat_Loadout'.static.MakeLoadoutItem(class'AtelierSophieOutfit', class'Hat_CosmeticItemQualityInfo_SearchAny')); 
  }
}