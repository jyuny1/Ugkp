
function Ugkp_UpdateEvent()
	totalEvents=0;
	if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
		totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	else
		for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
			getglobal("UgkpEventFrameListButton"..i):Hide();
		end
		FauxScrollFrame_Update(UgkpListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
		return;
	end
	FauxScrollFrame_Update(UgkpListScrollFrame,totalEvents ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
	
	local offset = FauxScrollFrame_GetOffset(UgkpListScrollFrame);
	for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
		k = offset + i;
		if ( k > totalEvents ) then
			getglobal("UgkpEventFrameListButton"..i):Hide();
		else
			getglobal("UgkpEventFrameListButton"..i):Show();
			v = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][k];

			if ( getglobal("UgkpEventFrameListButton" .. i) ) then
				getglobal("UgkpEventFrameListButton" .. i .. "eventid"):SetText(v["eventid"]);
				getglobal("UgkpEventFrameListButton" .. i .. "EventName"):SetText(v["reason"]);
				
				if(v["itemname"]~="") then
					totalItems=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
					for j=1,totalItems,1 do
						if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["name"]==v["itemname"]) then
							getglobal("UgkpEventFrameListButton" .. i .. "EventItem"):SetText("|c"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["c"]..v["itemname"].."|r");
						end
					end
				else
					getglobal("UgkpEventFrameListButton" .. i .. "EventItem"):SetText("");
				end
					getglobal("UgkpEventFrameListButton" .. i .. "EventDkp"):SetText(v["dkp"]);
				if(v["dkp"]<0) then
					getglobal("UgkpEventFrameListButton" .. i .. "EventIn"):SetText("|cff1eff00"..v["dkp"]*(-1).."|r");
					getglobal("UgkpEventFrameListButton" .. i .. "EventOut"):SetText("");
				else
					getglobal("UgkpEventFrameListButton" .. i .. "EventIn"):SetText("");
					getglobal("UgkpEventFrameListButton" .. i .. "EventOut"):SetText("|cffff0000"..v["dkp"].."|r");
				end
				if(v["type"]==1) then
					getglobal("UgkpEventFrameListButton" .. i .. "EventMember"):SetText(getn(v["players"]));
					getglobal("UgkpEventFrameListButton" .. i .. "MemberList"):Show();
				else
					getglobal("UgkpEventFrameListButton" .. i .. "EventMember"):SetText(v["players"][1]);
					getglobal("UgkpEventFrameListButton" .. i .. "MemberList"):Hide();
					
				end
				
				
			end
		end
	end
	incoin=0;
	outcoin=0;
	for i=1,totalEvents do
		e = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e["dkp"]<0) then
			incoin=incoin+e["dkp"]*(-1);
		else
			outcoin=outcoin+e["dkp"];
		end
	end
	totalMember=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	
	l=0;
	for i=1,totalMember do
	
		if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
			l=l+1;
		end
	end
	if(UgkpOptions.CoinLevel==1) then
		--getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_EVENT..UGKP_MESSAGE_COIN_IN.."|cff1eff00"..incoin.."|r     "..UGKP_MESSAGE_COIN_OUT.."|cffff0000"..outcoin.."|r "..UGKP_MESSAGE_MEMBER_JOIN..": "..l.."    "..UGKP_HEAD_EVENT_TADV..": "..math.floor((incoin-outcoin)/l));
		--ugkp_say_message=ugkp_say_message..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/totalMember)..UGKP_MESSAGE_GOLD;
	else
		--getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_EVENT..UGKP_MESSAGE_COIN_IN.."|cff1eff00"..incoin.."|r     "..UGKP_MESSAGE_COIN_OUT.."|cffff0000"..outcoin.."|r "..UGKP_MESSAGE_MEMBER_JOIN..": "..l.."    "..UGKP_HEAD_EVENT_TADV..": "..math.floor((incoin-outcoin)/l*100)/100);
		--ugkp_say_message=ugkp_say_message..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/totalMember*100)/100 ..UGKP_MESSAGE_GOLD;
	end
	
	
end

function UgkpdeleteEvent()
	eventid=getglobal("ugkpcurrenteventid"):GetText();
	
	if(eventid=="") then
		return;
	end
	
	totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	for i =totalEvents ,1,-1 do
		e=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e.eventid==eventid) then
			totaleventPlayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);
			totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
			dkp=e.dkp;
			for j=totaleventPlayers,1,-1 do
				for k=totalraidmembers,1,-1 do
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["player"]) then
					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"] - dkp;
					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ldkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ldkp"] - dkp;
					break;
					end
				end
			end
			if(e.itemid~="") then
				totalitems=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
				for j=totalitems,1,-1 do
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["itemid"]==e.itemid) then
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["cost"]=0;

						break;
					end
				end
			end
			table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"],i);
--			Ugkp_UpdateMember();
			Ugkp_UpdateEvent();
			
			break;
		end
	end
end

function UgkpchangeEventDkp()

	eventid=getglobal("ugkpcurrenteventid"):GetText();
	newdkp=getglobal("UgkpChangeEventPoint"):GetNumber();
	Ugkp_Debug(".......................1");
	Ugkp_Debug(newdkp);
	if(eventid=="") then
		return;
	end
	if(newdkp==0) then
		UgkpRaidMessageBox(UGKP_MESSAGE_GKP_ISNULL) ;
		return;
	end
	
	totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	for i =totalEvents ,1,-1 do
		e=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e.eventid==eventid) then
			totaleventPlayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);
			totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
			dkp=e.dkp;
			for j=totaleventPlayers,1,-1 do
				for k=totalraidmembers,1,-1 do
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["player"]) then
					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"] - dkp + newdkp;
					UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ldkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["ldkp"] - dkp + newdkp;
					break;
					end
				end
			end
			if(e.itemid~="") then
				totalitems=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
				for j=totalitems,1,-1 do
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["itemid"]==e.itemid) then
						--UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["cost"]= (newdkp*-1);
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][j]["cost"]= newdkp;
						Ugkp_Debug(newdkp);
						break;
					end
				end
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["dkp"]=newdkp*(-1);
			else
				UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["dkp"]=newdkp;
			end
			
--			Ugkp_UpdateMember();
			Ugkp_UpdateEvent();
			
			break;
		end
	end
	
end

function UgkpchageEventMember()
	eventid=getglobal("ugkpcurrenteventid"):GetText();
	if(eventid=="") then
		return;
	end
	totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for i =1 ,totalEvents,1 do
		e=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e.eventid==eventid) then
			totaleventPlayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);
			totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
			dkp=e.dkp;
			for j=totaleventPlayers,1,-1 do
				for k=totalraidmembers,1,-1 do
					if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["player"]) then
						UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"] - dkp;
						
						break;
					end
				end
				table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"],j);
			end
			
			for j=1,60,1 do
				if(getglobal("UgkpMemberList"..j.."Check"):GetChecked()) then
					membername=getglobal("UgkpMemberList"..j.."ButtonName"):GetText();
					for k=totalraidmembers,1,-1 do
						if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["player"]==membername) then
							UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"] + dkp;
							
						end
					end
					table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"],1,membername);
				end
				
			end
		

			
			break;
		end
	end
--	Ugkp_UpdateMember();
	Ugkp_UpdateEvent();
	UgkpChangeEventMemberFrame:Hide();
end

function UgkpChangeEventMemberFrame_OnMouseUp()

	if ( UgkpChangeEventMemberFrame.isMoving ) then
		UgkpChangeEventMemberFrame:StopMovingOrSizing();
		UgkpChangeEventMemberFrame.isMoving = false;
	end
end

function UgkpChangeEventMemberFrame_OnMouseDown(button)
	if ( ( ( not UgkpChangeEventMemberFrame.isLocked ) or ( UgkpChangeEventMemberFrame.isLocked == 0 ) ) and ( arg1 == "LeftButton" ) ) then
		UgkpChangeEventMemberFrame:StartMoving();
		UgkpChangeEventMemberFrame.isMoving = true;
	end
end



function UgkpChangeEventMemberFrame_OnHide()
	if ( UgkpChangeEventMemberFrame.isMoving ) then
		UgkpChangeEventMemberFrame:StopMovingOrSizing();
		UgkpChangeEventMemberFrame.isMoving = false;
	end
end

function UgkpChangeEventMemberFrame_OnShow()
	eventid=getglobal("ugkpcurrenteventid"):GetText();
	if(eventid=="") then
		return;
	end
	totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
	totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	for i =1 ,totalEvents,1 do
		e=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e.eventid==eventid) then
			
			for j=1,60,1 do
				if(j>totalraidmembers) then
					getglobal("UgkpMemberList"..j):Hide();
					getglobal("UgkpMemberList"..j.."Check"):SetChecked(false);
				else
					getglobal("UgkpMemberList"..j):Show();
					getglobal("UgkpMemberList"..j.."Check"):SetChecked(false);
					getglobal("UgkpMemberList"..j.."ButtonName"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]);
				end
			end
			eventplayerNumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);
			
			for j=1,totalraidmembers,1 do
				if(j<=60) then
					for k=1,eventplayerNumber,1 do
						
						if(getglobal("UgkpMemberList"..j.."ButtonName"):GetText()==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][k]) then
							getglobal("UgkpMemberList"..j.."Check"):SetChecked(true);
						end
					end
				end
			end
			
			break;
		end
	end
end

function ugkpSendDetail()
	incoin=0;
	outcoin=0;
	for i=1,totalEvents do
		e = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e["dkp"]<0) then
			SendChatMessage(e["reason"]..UGKP_HEAD_EVENT_IN ..e["dkp"]*(-1)..UGKP_MESSAGE_GOLD,UgkpOptions.ChannelLevel, this.language, nil);
			incoin=incoin+e["dkp"]*(-1);
		end
	end
	SendChatMessage(UGKP_HEAD_EVENT_TIN ..incoin..UGKP_MESSAGE_GOLD,UgkpOptions.ChannelLevel, this.language, nil);
	for i=1,totalEvents do
		e = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e["dkp"]>0) then
			SendChatMessage(e["reason"]..UGKP_HEAD_EVENT_OUT ..e["dkp"] ..UGKP_MESSAGE_GOLD,UgkpOptions.ChannelLevel, this.language, nil);
			outcoin=outcoin+e["dkp"];
		end
	end
	totalMember = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	l=0;
	for i=1,totalMember do
	
		if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
			l=l+1;
		end
	end
	SendChatMessage(UGKP_HEAD_EVENT_TOUT ..outcoin..UGKP_MESSAGE_GOLD,UgkpOptions.ChannelLevel, this.language, nil);
	if(UgkpOptions.CoinLevel==1) then
		SendChatMessage(l..UGKP_MESSAGE_MEMBER_JOIN..","..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/l)..UGKP_MESSAGE_GOLD, UgkpOptions.ChannelLevel,this.language, nil);
	else
		SendChatMessage(l..UGKP_TAB_MEMBER..UGKP_MESSAGE_MEMBER_JOIN..","..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/l*100)/100 ..UGKP_MESSAGE_GOLD, UgkpOptions.ChannelLevel,this.language, nil);
	end
	
	SendChatMessage(UGKP_MESSAGE_DUNIU,UgkpOptions.ChannelLevel, this.language, nil);
end

function ugkpSendTotal()
	incoin=0;
	outcoin=0;
	for i=1,totalEvents do
		e = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
		if(e["dkp"]<0) then
			incoin=incoin+e["dkp"]*(-1);
		else
			outcoin=outcoin+e["dkp"];
		end
	end
	totalMember = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
	l=0
	for i=1,totalMember do
	
		if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
			l=l+1;
		end
	end
	ugkp_say_message =""..UGKP_HEAD_EVENT_TIN..incoin..UGKP_MESSAGE_GOLD..","..UGKP_HEAD_EVENT_TOUT ..outcoin..UGKP_MESSAGE_GOLD..","..l..UGKP_TAB_MEMBER..UGKP_MESSAGE_MEMBER_JOIN..",";
	
	if(UgkpOptions.CoinLevel==1) then
		ugkp_say_message=ugkp_say_message..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/l)..UGKP_MESSAGE_GOLD;
	else
		ugkp_say_message=ugkp_say_message..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/l*100)/100 ..UGKP_MESSAGE_GOLD;
	end
	SendChatMessage(ugkp_say_message, UgkpOptions.ChannelLevel,this.language, nil);
	
	totalitem=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
	
	for i=1,totalitem do
		e=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]
		--SendChatMessage("|c"..e["c"].."|Hitem:"..e["id"].."|h["..e["name"].."]|h|r", UgkpOptions.ChannelLevel,this.language, nil);
	end

end