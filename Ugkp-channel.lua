function Ugkp_ChannelFrame_OnLoad()
	getglobal("UgkpClassListButton1ButtonName"):SetText(UgkpRaid_Class["WARRIOR"]);
	getglobal("UgkpClassListButton2ButtonName"):SetText(UgkpRaid_Class["PALADIN"]);
	getglobal("UgkpClassListButton3ButtonName"):SetText(UgkpRaid_Class["SHAMAN"]);
	getglobal("UgkpClassListButton4ButtonName"):SetText(UgkpRaid_Class["HUNTER"]);
	getglobal("UgkpClassListButton5ButtonName"):SetText(UgkpRaid_Class["ROGUE"]);
	getglobal("UgkpClassListButton6ButtonName"):SetText(UgkpRaid_Class["DRUID"]);
	getglobal("UgkpClassListButton7ButtonName"):SetText(UgkpRaid_Class["WARLOCK"]);
	getglobal("UgkpClassListButton8ButtonName"):SetText(UgkpRaid_Class["MAGE"]);
	getglobal("UgkpClassListButton9ButtonName"):SetText(UgkpRaid_Class["PRIEST"]);
end

function Ugkp_sendAllDkp()
	if(Gkp_CurrentRaidId==0) then return; end
	local totalMembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for i=1 ,totalMembers,1 do
		SendChatMessage(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]..WHO_GKP_Change_MESSAGE.." "..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"],"RAID", this.language, nil);
	end
	SendChatMessage("------------------------------","RAID", this.language, nil);
	SendChatMessage(UGKP_MESSAGE_DUNIU,"RAID", this.language, nil);
end

function Ugkp_sendClassDkp()
	if(Gkp_CurrentRaidId==0) then return; end
	local totalMembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	local Message="";
	local isSendClass=false;
	for i=1 ,totalMembers,1 do
		for j=1,9,1 do
			if(getglobal("UgkpClassListButton"..j.."ButtonName"):GetText()==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["class"] and getglobal("UgkpClassListButton"..j.."Check"):GetChecked()) then
				
				
				SendChatMessage(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]..WHO_GKP_MESSAGE.." "..(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["pdkp"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]),"RAID", this.language, nil);
				break;
			end
		end
	end
	SendChatMessage("------------------------------","RAID", this.language, nil);
	SendChatMessage(UGKP_MESSAGE_DUNIU,"RAID", this.language, nil);
	
end

