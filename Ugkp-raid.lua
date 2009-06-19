function Ugkp_Raid_OnLoad()

	local totalRaids = 0;
	totalRaids=getn(UGKP_PARTY_STUFF);
	
	if(totalRaids>0) then
		
		--Uasit_Debug("delete...",totalRaids,UgkpRaid_GetCurrentRaid)
		if(UgkpRaid_GetCurrentRaid~=0) then
			UgkpRaid_GetCurrentRaid=UgkpGetCurentRaid();
			
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==-1) then
				getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_CREATE.."|r");
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==0) then
				getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_HAVECREATE.."|r");
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==1) then
				getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_ACTIVE.."|r");
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==2) then
				getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_CLOSED.."|r");
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==3) then
				getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_UPLOADED.."|r");
			end
			getglobal("UgkpRaidTime_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidTime"]);
			getglobal("Ugkp_RaidMap_Edit"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidMap"]);
			getglobal("UgkpRaidName_Edit"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"]);
			getglobal("UgkpRaidLeader_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidLeader"]);
			getglobal("UgkpRaidStart_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["StartTime"]);
			getglobal("UgkpRaidEnd_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["EndTime"]);		
			getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_RAID.."|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].." |r");
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Team"]~="") then
				UIDropDownMenu_SetSelectedValue(getglobal("Ugkp_TeamDropDown"), UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Team"]);
				Uasit_raidteamid=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Team"];
			end
		end
		
	else
		HideUgkp_RaidFrameElement();
		getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_RAID);
	end	
	UgkpUpdateRaidList();
--	Ugkp_UpdateMember();
--	Ugkp_UpdateEvent();
--	Ugkp_UpdateItem();
	UgkpChangeButtonStatus();
	
	
end

function Ugkp_UpdateRaid()
	if(totalRaids>0) then
		if(UgkpRaid_GetCurrentRaid~=0) then
			
			getglobal("UgkpRaidTime_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidTime"]);
			getglobal("Ugkp_RaidMap_Edit"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidMap"]);
			getglobal("UgkpRaidName_Edit"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"]);
			getglobal("UgkpRaidLeader_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidLeader"]);
			getglobal("UgkpRaidStart_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["StartTime"]);
			getglobal("UgkpRaidEnd_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["EndTime"]);
		end
	end
end

function HideUgkp_RaidFrameElement()

	getglobal("UgkpRaidFrameRaidTime"):Hide();
	getglobal("UgkpRaidFrameRaidMap"):Hide();
	getglobal("UgkpRaidFrameRaidNameTitle"):Hide();
	getglobal("UgkpRaidFrameRaidLeader"):Hide();
	getglobal("UgkpRaidFrameRaidTimeTitle"):Hide();
	getglobal("UgkpRaidFrameRaidEnd"):Hide();
	
	
	getglobal("UgkpRaidTime_Edit"):Hide();
	getglobal("Ugkp_RaidMap_Edit"):Hide();
	getglobal("UgkpRaidName_Edit"):Hide();
	getglobal("UgkpRaidLeader_Edit"):Hide();
	getglobal("UgkpRaidStart_Edit"):Hide();
	getglobal("UgkpRaidEnd_Edit"):Hide();
	
	getglobal("UgkpSaveRaid_Button"):Hide();
	getglobal("UgkpRaidStart_Button"):Hide();
	getglobal("UgkpRaidEnd_Button"):Hide();
	getglobal("Ugkp_MapDropDown"):Hide();
	
	getglobal("UgkpRaidFrameStatusTitle"):Hide();
	getglobal("UgkpRaidStatus_Edit"):Hide();
	
end


function ShowUgkp_RaidFrameElement()

	getglobal("UgkpRaidFrameRaidTime"):Show();
	getglobal("UgkpRaidFrameRaidMap"):Show();
	getglobal("UgkpRaidFrameRaidNameTitle"):Show();
	getglobal("UgkpRaidFrameRaidLeader"):Show();
	getglobal("UgkpRaidFrameRaidTimeTitle"):Show();
	getglobal("UgkpRaidFrameRaidEnd"):Show();
	
	
	getglobal("UgkpRaidTime_Edit"):Show();
	getglobal("Ugkp_RaidMap_Edit"):Show();
	getglobal("UgkpRaidName_Edit"):Show();
	getglobal("UgkpRaidLeader_Edit"):Show();
	getglobal("UgkpRaidStart_Edit"):Show();
	getglobal("UgkpRaidEnd_Edit"):Show();
	getglobal("Ugkp_MapDropDown"):Show();
	
	getglobal("UgkpSaveRaid_Button"):Show();
	getglobal("UgkpRaidStart_Button"):Show();
	getglobal("UgkpRaidEnd_Button"):Show();
	getglobal("UgkpRaidStart_Button"):Disable();
	getglobal("UgkpRaidEnd_Button"):Disable();
	
	getglobal("UgkpRaidFrameStatusTitle"):Show();
	getglobal("UgkpRaidStatus_Edit"):Show();
end

function UgkpSaveRaid()

	if(UgkpRaid_GetCurrentRaid~=0) then
			

			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidTime"]=getglobal("UgkpRaidTime_Edit".."Text"):GetText();
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidMap"]=getglobal("Ugkp_RaidMap_Edit"):GetText();
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"]=getglobal("UgkpRaidName_Edit"):GetText();
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidLeader"]=getglobal("UgkpRaidLeader_Edit".."Text"):GetText();
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["StartTime"]=getglobal("UgkpRaidStart_Edit".."Text"):GetText();
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["EndTime"]=getglobal("UgkpRaidEnd_Edit".."Text"):GetText();
	end
	if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==-1) then
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]=0;
	getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_HAVECREATE.."|r");
	end
	UgkpUpdateRaidList();
	UgkpChangeButtonStatus();
	
	UgkpSaveRuler();
	
	getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_RAID.."(|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].." |r)");
end


function UgkpStartRaid()
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["StartTime"]=Ugkp_Date();
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["IntStartTime"]=time();
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]=1;
	
	getglobal("UgkpRaidStart_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["StartTime"]);		
	getglobal("UgkpRaidStart_Button"):Disable();
	getglobal("UgkpRaidEnd_Button"):Enable();
	local t = date("*t");
	
	for i = 1, GetNumRaidMembers(), 1 do
		
		
		local sPlayer = UnitName("raid" .. i);
		local _, race = UnitRace("raid" .. i);
		
		
		if(sPlayer ~= UgkpRaid_lang_UnknownEntity) then
			local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
			
			
			if(rank==2) then
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["RaidLeader"]=name;
			end
			if ( online==1 ) then
				table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"],1,
					{
						["player"] = sPlayer,
						["race"] = UgkpRaid_Race[race],
						["class"] = UgkpRaid_Class[fileName],
						["level"] = level,
						["join"] = t.hour..":"..t.min,
						["totaltime"] = 0,
						["dkp"] = 0,
						["ldkp"] = 0,
						["pdkp"] = getUgkpPlayerGKPLeft(sPlayer),
						["zone"] = zone,
						["rank"] = rank,
						["online"] = 1,
						["leavetime"] = time();
					}
				);
				--UgkpRaid_Offline[name] = true;
			else
				table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"],1,
					{
						["player"] = sPlayer,
						["race"] = UgkpRaid_Race[race],
						["class"] = UgkpRaid_Class[fileName],
						["level"] = level,
						["join"] = t.hour..":"..t.min,
						["totaltime"] = 0,
						["dkp"] = 0,
						["ldkp"] = 0,
						["pdkp"] = getUgkpPlayerGKPLeft(sPlayer),
						["zone"] = zone,
						["rank"] = rank,
						["online"] = 0,
						["leavetime"] = 0
					}
				);
				

				--UgkpRaid_GatheredData_Temp[name] = true;
			end
			--UgkpRaid_Online[name] = true;
		end
--		Ugkp_UpdateMember();
	end
	Ugkp_Raid_OnLoad();
	getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_ACTIVE.."|r");
	
end

function UgkpEndRaid()
	Ugkp_Member_Compute();
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]=2;
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["EndTime"]=Ugkp_Date();
	getglobal("UgkpRaidEnd_Edit".."Text"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["EndTime"]);
	getglobal("UgkpRaidStart_Button"):Disable();
	getglobal("UgkpRaidEnd_Button"):Disable();
	getglobal("Ugkp_AddRaid_Button"):Enable();
	UgkpUpdateRaidList();
	getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_CLOSED.."|r");
	
end

function UgkpChangeMap()
  Ugkp_RaidMap_Edit:SetText(this.value);
  local t=date("*t");
  UgkpRaidName_Edit:SetText(t.month.."-"..t.day..this.value);
  UIDropDownMenu_SetSelectedValue(Ugkp_MapDropDown,this.value);
end

function Ugkp_Map_Init()
  for k,instance in pairs(UGKP_MAP) do
    local info = { };
    info.text = instance;
    info.value = instance;
    info.func = UgkpChangeMap;
    UIDropDownMenu_AddButton(info);
  end
end

function Ugkp_MapDropDown_OnShow()
  UIDropDownMenu_Initialize(Ugkp_MapDropDown, Ugkp_Map_Init);
  --UIDropDownMenu_SetText("", Ugkp_MapDropDown);
  --UIDropDownMenu_SetWidth(80, Ugkp_MapDropDown);
  if(Ugkp_RaidMap_Edit:GetText()=="") then
 		UIDropDownMenu_SetSelectedID(Ugkp_MapDropDown, 1);
 	 	Ugkp_RaidMap_Edit:SetText(UIDropDownMenu_GetSelectedValue(Ugkp_MapDropDown));
 else
 		UIDropDownMenu_SetSelectedValue(Ugkp_MapDropDown,Ugkp_RaidMap_Edit:GetText());
 end
  
end

function UgkpChangeButtonStatus()

	totalRaids=getn(UGKP_PARTY_STUFF);
	if(totalRaids>0) then
			getglobal("Ugkp_RaidDelete_Button"):Enable();
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==-1) then

				getglobal("UgkpSaveRaid_Button"):Enable();
				getglobal("Ugkp_AddRaid_Button"):Disable();
				getglobal("UgkpRaidStart_Button"):Disable();
				getglobal("UgkpRaidEnd_Button"):Disable();
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==0) then
				getglobal("UgkpSaveRaid_Button"):Enable();
				getglobal("Ugkp_AddRaid_Button"):Disable();
				getglobal("UgkpRaidStart_Button"):Enable();
				getglobal("UgkpRaidEnd_Button"):Disable();
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==1) then
				getglobal("UgkpSaveRaid_Button"):Enable();
				getglobal("Ugkp_AddRaid_Button"):Disable();
				getglobal("UgkpRaidStart_Button"):Disable();
				getglobal("UgkpRaidEnd_Button"):Enable();
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==2) then
				getglobal("UgkpSaveRaid_Button"):Enable();
				getglobal("Ugkp_AddRaid_Button"):Enable();
				getglobal("UgkpRaidStart_Button"):Disable();
				getglobal("UgkpRaidEnd_Button"):Disable();
			elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==3) then
				getglobal("UgkpSaveRaid_Button"):Enable();
				getglobal("Ugkp_AddRaid_Button"):Disable();
				getglobal("UgkpRaidStart_Button"):Disable();
				getglobal("UgkpRaidEnd_Button"):Disable();
			end
		else
			getglobal("Ugkp_RaidDelete_Button"):Disable();
			getglobal("Ugkp_AddRaid_Button"):Enable();
		end
end