
function Ugkp_UpdateMember()
	local onlinemember=0;
	local offlinemember=0;
	if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
		totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	else
		for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
			getglobal("UgkpMemberFrameListButton"..i):Hide();
		end
		FauxScrollFrame_Update(UgkpMemberListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
		return;
	end
	FauxScrollFrame_Update(UgkpMemberListScrollFrame,totalMembers ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
	
	local offset = FauxScrollFrame_GetOffset(UgkpMemberListScrollFrame);
	for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
		k = offset + i;
		if ( k > totalMembers ) then
			getglobal("UgkpMemberFrameListButton"..i):Hide();
		else
			v = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k];
			local hour = string.format("%d", v["totaltime"]/3600);
			local minute = string.format("%d", (v["totaltime"] - hour * 3600) / 60 );
			getglobal("UgkpMemberFrameListButton"..i):Show();
			
			if(v["zone"]) then
			
			else
				v["zone"]=UGKP_MESSAGE_OFFLINE;
			end
			--in order for old version is not error
			if(not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ischeck"]) then
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ischeck"]="1";
			end
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ischeck"]=="1") then
				getglobal("UgkpMemberFrameListButton" .. i .."Check"):SetChecked(true);
			else
				getglobal("UgkpMemberFrameListButton" .. i .."Check"):SetChecked(false);
			end
			if ( getglobal("UgkpMemberFrameListButton" .. i) ) then
			
				if(v["precent"]==nil) then
					v["precent"]=100;
					
				end
				
				if(v["bro"]==nil) then
					v["bro"]=0;
				end
			
				Ugkp_Debug("ture",v["precent"]);
				Ugkp_Debug("ture",v["bro"]);
				
				if(v["online"]==1) then
					
					getglobal("UgkpMemberFrameListButton" .. i .. "Name1"):SetText(v["player"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Name"):SetText(v["player"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Precent"):SetText(v["precent"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Bro"):SetText(v["bro"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Class"):SetText(v["class"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Level"):SetText(v["level"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Cdkp"):SetText(v["dkp"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Ldkp"):SetText(v["pdkp"]+v["dkp"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Pdkp"):SetText(v["pdkp"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Map"):SetText(v["zone"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "JoinTime"):SetText(v["join"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "TotalTime"):SetText(hour..UGKP_MESSAGE_HOUR..minute..UGKP_MESSAGE_MINUTE);
				else
					
					getglobal("UgkpMemberFrameListButton" .. i .. "Name1"):SetText(v["player"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Name"):SetText("|cff9d9d9d"..v["player"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Precent"):SetText(v["precent"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Bro"):SetText(v["bro"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Class"):SetText("|cff9d9d9d"..v["class"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Level"):SetText("|cff9d9d9d"..v["level"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Cdkp"):SetText("|cff9d9d9d"..v["dkp"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Ldkp"):SetText("|cff9d9d9d"..(v["pdkp"]+v["dkp"]));
					getglobal("UgkpMemberFrameListButton" .. i .. "Pdkp"):SetText("|cff9d9d9d"..v["pdkp"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "Map"):SetText("|cff9d9d9d"..v["zone"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "JoinTime"):SetText("|cff9d9d9d"..v["join"]);
					getglobal("UgkpMemberFrameListButton" .. i .. "TotalTime"):SetText("|cff9d9d9d"..hour..UGKP_MESSAGE_HOUR..minute..UGKP_MESSAGE_MINUTE);
				end
			end
		end
	end
	
	for i=1, totalMembers  do
		v = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]
		if((not v["ischeck"]) or v["ischeck"]=="1") then
			onlinemember=onlinemember+1;
		else
			offlinemember=offlinemember+1;
		end
	end
	getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_MEMBER.."|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].." |r".."(|cffffffff"..totalMembers.."|r:".."|cff1eff00"..onlinemember.."|r/|cff9d9d9d"..offlinemember.."|r)");
	
end

function Ugkp_Member_Compute()
	
	

	if( Gkp_CurrentRaidId==0 or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]~=1) then
		
		Ugkp_UpdateMember();
		return;
	end
	
	Ugkp_Debug("GetNumRaidMembers()",GetNumRaidMembers())
			
	for i = 1, GetNumRaidMembers(), 1 do
		local sPlayer = UnitName("raid" .. i);
		local _, race = UnitRace("raid" .. i);
		
		if(sPlayer and sPlayer ~= UgkpRaid_lang_UnknownEntity) then
			local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
			
			local flagHaveinRaid=false;
			totalmember=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
			for j=1,totalmember,1 do
				Ugkp_Debug("sPlayer"..sPlayer,name,UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]);
				if(sPlayer==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]) then
					
					if((not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"] ) and online) then
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["zone"]=zone;	
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["totaltime"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["totaltime"]+time()-UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"];
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"]=0;
					end
					if((not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"] ) and (not online)) then
						
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["totaltime"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["totaltime"]+time()-UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"];
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"]=time();
					end
					
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]  and (not online)) then		
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"]=time();
					end
					
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]  and  online) then		
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["zone"]=zone;	
					end

					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]=online;
					flagHaveinRaid=true;
				end	
			end
			local t = date("*t");
			
			if (not flagHaveinRaid) then
				
				if ( not online ) then
					table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"],1,
						{
							["player"] = sPlayer,
							["race"] = UgkpRaid_Race_Cn[race],
							["class"] = UgkpRaid_Class_Cn[fileName],
							["level"] = level,
							["join"] = t.hour..":"..t.min,
							["totaltime"] = time()-UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["IntStartTime"],
							["dkp"] = 0,
							["ldkp"] = 0,
							["pdkp"] = getUgkpPlayerGKPLeft(sPlayer),
							["zone"] = zone,
							["rank"] = rank,
							["online"] = online,
							["leavetime"] = time(),
							["precent"] = 100,
							["bro"] = 0
							
						}
					);
					--UgkpRaid_Offline[name] = true;
				else
					table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"],1,
						{
							["player"] = sPlayer,
							["race"] = UgkpRaid_Race_Cn[race],
							["class"] = UgkpRaid_Class_Cn[fileName],
							["level"] = level,
							["join"] = t.hour..":"..t.min,
							["totaltime"] = time()-UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["IntStartTime"],
							["dkp"] = 0,
							["ldkp"] = 0,
							["pdkp"] = getUgkpPlayerGKPLeft(sPlayer),
							["zone"] = zone,
							["rank"] = rank,
							["online"] = online,
							["leavetime"] = 0,
							["precent"] = 100,
							["bro"] = 0
						}
					);
				end
			end
			
		end
	end
	totalmember=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for j=1,totalmember,1 do
		memberInRaid=false;
		for i = 1, GetNumRaidMembers(), 1 do
			local sPlayer = UnitName("raid" .. i);
			
			if(sPlayer==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]) then
				memberInRaid=true;
				break;
			end
		end
		if(memberInRaid==false) then
		
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]==1) then
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"]=time();
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]=0;
			else
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["totaltime"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["totaltime"]+time()-UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"];
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["leavetime"]=time();
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]=0;
			end
		end
		
	end
	Ugkp_UpdateMember();

end

function UgkpAddDkp()
	if(Gkp_CurrentRaidId==0) then return; end
	player=getglobal("UgkpAddMember"):GetText();
	dkpDesc=getglobal("UgkpAddDkpFrameDes"):GetText();
	dkppoint=getglobal("UgkpAddDkpFramePoint"):GetNumber();
	
	Ugkp_Debug(dkppoint,player,dkpDesc);
	
	--if(dkppoint>=0) then
	--UgkpRaidMessageBox(UGKP_MESSAGE_GKP_SUBMONEY) ;
	--return;
	--end
	if(dkpDesc=="") then 
	dkpDesc=UGKP_STRING_GKP_NODES;
	end
	totalMembers=0;
	if(getn(UGKP_PARTY_STUFF) > 0) then
			totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
			
			if(totalMembers<1) then
				UgkpRaidMessageBox(UGKP_MESSAGE_GKP_NOMEMBER);
				return;
			end
	else
		return;
	end
	eventid=UgkpGenId();
	local Ugkptype=2;
	if(player=="0" or player=="1") then
		Ugkptype=1
	end
	table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"],1,
					{
						["eventid"] = eventid,
						["itemid"] = "",
						["itemname"] = "",
						["reason"] = dkpDesc,
						["type"] = Ugkptype,
						["eventtime"] = Ugkp_Date(),
						["dkp"] = dkppoint,
						["players"]={}
					}
				);
	
	if(player=="0") then --add online
		for i=1, totalMembers  do
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["online"]==1) then
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]+dkppoint;
				table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][1]["players"],1,UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]);	
			end
		end
		
	elseif(player=="1") then --add all
		for i=1, totalMembers  do
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]+dkppoint;
				table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][1]["players"],1,UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]);	
		end
		
	else --add one member
		for i=1, totalMembers  do
			if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]==player) then
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["dkp"]+dkppoint;
				table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][1]["players"],1,player);
			end	
		end
		
	end
	Ugkp_UpdateMember();
--	Ugkp_UpdateEvent();
	
end

function UgkpdeleteMember()
	--delete membe
	deleteMemberName=getglobal("UgkpAddMember"):GetText();
	
	UgkpDeleteMemberByName(deleteMemberName);

	Ugkp_UpdateMember();
--	Ugkp_UpdateEvent();

end

function UgkpDeleteMemberByName(membername)
	deleteMemberName=membername;
	totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for i=totalMembers, 1,-1  do	
		
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]==deleteMemberName) then
		Ugkp_Debug(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"],deleteMemberName);
			table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"],i);
		end
	end
	--delete event about this person
	totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	
	for i=totalEvents, 1,-1  do
		totalplayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);
		flag=false;
		for j=totalplayers,1,-1 do
			--event is for one member

			if( not flag) then
				if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==deleteMemberName and totalplayers==1) then
					table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"],i);
					flag=true;
				elseif(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==deleteMemberName) then
					table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"],j);
				end
			end
		end
	end
	--delete item
	local totalitem=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
	for i=totalitem, 1,-1  do
		
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["player"]==deleteMemberName) then
			table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"],i)
		end
		
	end

end
--删除离开raid的成员
function UgkpdeleteLeftMember()
	if( Gkp_CurrentRaidId==0 or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]~=1) then
		
		Ugkp_UpdateMember();
		return;
	end
	
	
	totalmember=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for j=totalmember,1,-1 do
		local flagHaveinRaid=false;
		for i = 1, GetNumRaidMembers(), 1 do
			local sPlayer = UnitName("raid" .. i);
			local _, race = UnitRace("raid" .. i);
			Ugkp_Debug("....",UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"],sPlayer)
			if(sPlayer and sPlayer ~= UgkpRaid_lang_UnknownEntity) then
				local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
				if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]==sPlayer) then
					flagHaveinRaid=true;
				end
			end
		end
		if(not flagHaveinRaid) then
			UgkpDeleteMemberByName(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]);
			break;
		end
	end
	Ugkp_UpdateMember();
end
--删除离线成员
function UgkpDeleteOfflineMember()
	totalmember=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for j=totalmember,1,-1 do
--		Ugkp_Debug("sPlayer",UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"])
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["online"]~=1) then
			Ugkp_Debug("sPlayer",UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"])
			UgkpDeleteMemberByName(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]);
		end
	end
	Ugkp_UpdateMember();
end


function UgkpMemberEventListFrame_OnMouseUp()

	if ( UgkpMemberEventListFrame.isMoving ) then
		UgkpMemberEventListFrame:StopMovingOrSizing();
		UgkpMemberEventListFrame.isMoving = false;
	end
end

function UgkpMemberEventListFrame_OnMouseDown(button)
	if ( ( ( not UgkpMemberEventListFrame.isLocked ) or ( UgkpMemberEventListFrame.isLocked == 0 ) ) and ( arg1 == "LeftButton" ) ) then
		UgkpMemberEventListFrame:StartMoving();
		UgkpMemberEventListFrame.isMoving = true;
	end
end



function UgkpMemberEventListFrame_OnHide()
	if ( UgkpMemberEventListFrame.isMoving ) then
		UgkpMemberEventListFrame:StopMovingOrSizing();
		UgkpMemberEventListFrame.isMoving = false;
	end
end

function UgkpMemberEventListFrame_OnShow()
	
	player=getglobal("UgkpAddMember"):GetText();
	Ugkp_Debug(player);
	if(player=="") then return end
	local totalevents=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	local memberevents=0;
	for i=1,UGKP_NUM_BIDS_TO_DISPLAY,1 do
		getglobal("UgkpMemberEventFrameListButton"..i):Hide();
	end
	
	if(totalevents>0) then
		for i=1,totalevents,1 do
			
			totalplayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);
	
			for j=1,totalplayers, 1 do

				if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==player) then
					memberevents=memberevents+1;
					local offset = FauxScrollFrame_GetOffset(UgkpMemberEventListScrollFrame);
					if(memberevents>offset) then
						if(UGKP_NUM_BIDS_TO_DISPLAY>=(memberevents - offset)) then
							--k=j+offset;
							getglobal("UgkpMemberEventFrameListButton" .. (memberevents -offset) .. "EventName"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["reason"]);
							getglobal("UgkpMemberEventFrameListButton" .. (memberevents -offset) .. "EventItem"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["itemname"]);
							getglobal("UgkpMemberEventFrameListButton" .. (memberevents -offset) .. "EventDkp"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["dkp"]);
							getglobal("UgkpMemberEventFrameListButton" .. (memberevents -offset) .. "EventMember"):SetText(player);
							
							getglobal("UgkpMemberEventFrameListButton"..(memberevents -offset)):Show();
						end
					end
					
					break;
				end
			end
		end
		FauxScrollFrame_Update(UgkpMemberEventListScrollFrame,memberevents ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
	
	
	end
end


function Ugkp_CompareDkps(a1, a2)

	local  method, way = Ugkp_SortOptions["method"], Ugkp_SortOptions["itemway"];

	if ( method == "name" ) then
		local c1, c2 = a1["player"], a2["player"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "class" ) then
		local c1, c2 = a1["class"], a2["class"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "dkp" ) then
		local c1, c2 = a1["dkp"], a2["dkp"] ;
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "pdkp" ) then
		local c1, c2 = a1["pdkp"], a2["pdkp"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "ldkp" ) then
		local c1, c2 = a1["dkp"]+a1["pdkp"], a2["dkp"]+a2["pdkp"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "jointime" ) then
		local c1, c2 = a1["join"], a2["join"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "totaltime" ) then
		local c1, c2 = a1["totaltime"], a2["totaltime"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "zone" ) then
		local c1, c2 = a1["zone"], a2["zone"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "level" ) then
		local c1, c2 = a1["level"], a2["level"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "online" ) then
		local c1, c2 = a1["level"], a2["level"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	
	end
end


function Ugkp_SortDkp()

		table.sort(
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"],
			Ugkp_CompareDkps
		);

end

function UgkpSortOptions_ToggleDkp(method)

	if ( Ugkp_SortOptions.method and Ugkp_SortOptions.method == method ) then
		if ( Ugkp_SortOptions.itemway and Ugkp_SortOptions.itemway == "asc" ) then
			Ugkp_SortOptions.itemway = "desc";
		else
			Ugkp_SortOptions.itemway = "asc";
		end
	else
		Ugkp_SortOptions.method = method;
		Ugkp_SortOptions.itemway = "asc";
	end
	Ugkp_SortDkp();
	Ugkp_UpdateMember();
end



function getUgkpPlayerGKPLeft(sPlayer)
	if(dkplist) then
		if(dkplist[sPlayer]) then
			return dkplist[sPlayer];
		end
	end
	return "0";
end

function selectDistribute()
	
	if(this:GetChecked()) then
		totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
		name=getglobal("UgkpMemberFrameListButton" .. this:GetParent():GetID() .. "Name1"):GetText();
		for i=1,totalMembers do
			if(name==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]) then
					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]="1";
			end
		end
	else
		totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
		name=getglobal("UgkpMemberFrameListButton" .. this:GetParent():GetID() .. "Name1"):GetText();
		for i=1,totalMembers do
			if(name==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]) then
					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]="0";
			end
		end
	end
	Ugkp_UpdateMember();
end

ugkp_point=0;
ugkp_f=nil;
ugkp_change_id="";
function ugkp_changeNumber(ugkp_id,ugkp_title,ugkp_label,ugkp_fun)
	ugkp_change_id=ugkp_id;
	getglobal("UgkpChangeNumberFrameTitle"):SetText(ugkp_title);
	getglobal("UgkpChangeNumberFramePointLabel"):SetText(ugkp_label);
	getglobal("UgkpChangeNumberFrame"):Show();
	ugkp_f=ugkp_fun;
end


function ugkp_change_precent()
	if(ugkp_point<1) then
	
		UgkpRaidMessageBox(UGKP_ERROR_PRECENT_TITLE);
		return;
	end
	totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for i=1,totalMembers,1 do
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]==ugkp_change_id)then
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["precent"]=ugkp_point;
			break;
		end
	end
	Ugkp_UpdateMember();
end

function ugkp_change_bro()
	if(ugkp_point<0) then
	
		UgkpRaidMessageBox(UGKP_ERROR_BRO_TITLE);
		return;
	end
	totalMembers = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for i=1,totalMembers,1 do
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"]==ugkp_change_id)then
			UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["bro"]=ugkp_point;
			break;
		end
	end
	Ugkp_UpdateMember();
end

function ugkp_changeNumber_ok()
	ugkp_point=getglobal("UgkpChangeNumberFramePoint"):GetNumber();
	getglobal("UgkpChangeNumberFrame"):Hide();
	ugkp_f();
end