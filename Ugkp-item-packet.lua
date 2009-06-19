function ugkp_item_filter_check()
	Ugkp_UpdatePacketItem();
end

local TempItems;

function Ugkp_UpdatePacketItem()
	Ugkp_Debug("packetshow");
	totalItems=0;
	if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
		totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
	else
		for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
			getglobal("Ugkp_ItemPacketFrameListButton"..i):Hide();
		end
		FauxScrollFrame_Update(Ugkp_ItemPacketFrameListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
		return;
	end

	local tempcount=0;
	TempItems={};
	for it=1,totalItems,1 do
		tempitem=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][it];
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][it]["cost"]==0 and ugkp_isInSelectedItem(tempitem["name"])) then
			table.insert(TempItems,1,
					{
						["type"] = tempitem["type"],
						["c"] = tempitem["c"],
						["cost"] = tempitem["cost"],
						["id"] = tempitem["id"],
						["pcost"] = tempitem["pcost"],
						["player"] = tempitem["player"],
						["name"] = tempitem["name"],
						["time"] = tempitem["time"],
						["itemid"] = tempitem["itemid"],
						["selected"] = true,
						["count"] = tempitem["count"],
					}
				)
			tempcount=tempcount+1;
		end
	end
	
	offset=0;
	local offset = FauxScrollFrame_GetOffset(Ugkp_ItemPacketFrameListScrollFrame);
	
	
	for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
		k = offset + i;
		if ( k > tempcount ) then
			getglobal("Ugkp_ItemPacketFrameListButton"..i):Hide();
		else
			getglobal("Ugkp_ItemPacketFrameListButton"..i):Show();
			item = TempItems[k];

			if ( getglobal("Ugkp_ItemPacketFrameListButton" .. i) ) then

				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "itemid"):SetText(item["itemid"]);
				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Name"):SetText("|c" .. item["c"]..item["name"]);
				c=item["c"];
				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Rare"):SetText(string.sub(item["time"],10));
				--getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Sdkp"):SetText(item["pcost"]);
				if(item["count"]) then
					getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Sdkp"):SetText(item["count"]);
				else
					getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Sdkp"):SetText(1);
				end
				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "ToMember"):SetText(item["player"]);
				--if(item["selected"]==1) then
				--	getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Check"):SetChecked(1);
				--else
				--	getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Check"):SetChecked(1);
				--end
			--	if ( item["type"] and UgkpRaid_lang_ItemTextures[item["type"]] ) then
			--	getglobal("UgkpItemFrameListButton" .. i .. "ItemIcon"):SetTexture("Interface\\Icons\\"..UgkpRaid_lang_ItemTextures[item["type"]]);
			--	else
				--	getglobal("UgkpItemFrameListButton" .. i .. "ItemIcon"):SetTexture("Interface\\Icons\\"..UgkpRaid_lang_ItemTextures["Other"]);
			--	end
			end
		end
	end

	local c1=0;
	local c2=0;
	local c3=0;
	local c4=0;
	local c5=0;
	local c6=0;
	for i=1, tempcount  do
				
				itemname=TempItems[i]["name"]
				if(ugkp_isThisTypeItem(1,itemname)) then
					c1=c1+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(2,itemname)) then
					c2=c2+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(3,itemname)) then
					c3=c3+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(4,itemname)) then
					c4=c4+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(5,itemname)) then
					c5=c5+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(6,itemname)) then
					c6=c6+TempItems[i]["count"];					
				end
	end
	
	
	local headtext="";
	if(c1~=0) then
		headtext=headtext..Ugkp_item_auction[1]["typename"]..","..c1.." "
	end
	if(c2~=0) then
		headtext=headtext..Ugkp_item_auction[2]["typename"]..","..c2.." "
	end
	if(c3~=0) then
		headtext=headtext..Ugkp_item_auction[3]["typename"]..","..c3.." "
	end
	if(c4~=0) then
		headtext=headtext..Ugkp_item_auction[4]["typename"]..","..c4.." "
	end
	if(c5~=0) then
		headtext=headtext..Ugkp_item_auction[5]["typename"]..","..c5.." "
	end
	if(c6~=0) then
		headtext=headtext..Ugkp_item_auction[6]["typename"]..","..c6.." "
	end	
	FauxScrollFrame_Update(Ugkp_ItemPacketFrameListScrollFrame,tempcount ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
	getglobal("UgkpRaidHeaderString"):SetText(headtext);
	--getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_ITEM.."|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].."|r(|cffffffff"..totalItems.."|r:|cff9d9d9d"..c0.."|r/|cffffffff"..c1.."|r/|cff1eff00"..c2.."|r/|cff0070dd"..c3.."|r/|cffa335ee"..c4.."|r/|cffff8000"..c5.."|r)");
	--getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_ITEM.."(|cffffffff"..totalItems.."|r:|cff9d9d9d"..c0.."|r/|cffffffff"..c1.."|r/|cff1eff00"..c2.."|r/|cff0070dd"..c3.."|r/|cffa335ee"..c4.."|r/|cffff8000"..c5.."|r)    |cffff0000"..UGKP_TITLE_ITEM_DES.."|r");
	
end

function Ugkp_ScrollPacketItem()
	Ugkp_UpdatePacketItem();

end

function Ugkp_ItemPacketOnload()

	itemtypecount = getn(Ugkp_item_auction);
	for i=1,itemtypecount,1 do
		getglobal("Ugkp_ItemPacketFrameItemNameButton"..i.."Text"):SetText(Ugkp_item_auction[i]["typename"]);
		getglobal("Ugkp_ItemPacketFrameItemNameButton"..i):SetChecked(true);
		
	end

end

function ugkp_isInSelectedItem(sName)

	for i=1,6,1 do
		if(getglobal("Ugkp_ItemPacketFrameItemNameButton"..i):GetChecked()) then
			itemcount=getn(Ugkp_item_auction[i]["itemnames"]);
			for j=1,itemcount,1 do
				if(Ugkp_item_auction[i]["itemnames"][j]["itemname"]==sName) then
					return true;
				end
			end
		else
			itemcount=getn(Ugkp_item_auction[i]["itemnames"]);
			for j=1,itemcount,1 do
				if(Ugkp_item_auction[i]["itemnames"][j]["itemname"]==sName) then
					return false;
				end
			end
		end
		
	end
	
	if(getglobal("Ugkp_ItemPacketFrameItemNameButton"..6):GetChecked()) then
		return true;
	else
		return false;
	end

end

function ugkp_isThisTypeItem(itemtype,itemname)
	
	itemcount=getn(Ugkp_item_auction[itemtype]["itemnames"]);
	for j=1,itemcount,1 do
		if(Ugkp_item_auction[itemtype]["itemnames"][j]["itemname"]==itemname) then
			return true;
		end
	end
	return false;
end

function ugkp_send_item_packet()
	
	local c1=0;
	local c2=0;
	local c3=0;
	local c4=0;
	local c5=0;
	local c6=0;
	local tmpItemArray={};
	tempcount=getn(TempItems);
	for i=1, tempcount  do
				
		itemname=TempItems[i]["name"]
		if(ugkp_isThisTypeItem(1,itemname)) then
			c1=c1+TempItems[i]["count"];
		elseif(ugkp_isThisTypeItem(2,itemname)) then
			c2=c2+TempItems[i]["count"];
		elseif(ugkp_isThisTypeItem(3,itemname)) then
			c3=c3+TempItems[i]["count"];
		elseif(ugkp_isThisTypeItem(4,itemname)) then
			c4=c4+TempItems[i]["count"];
		elseif(ugkp_isThisTypeItem(5,itemname)) then
			c5=c5+TempItems[i]["count"];
		elseif(ugkp_isThisTypeItem(6,itemname)) then
			c6=c6+TempItems[i]["count"];			
		else
			local newItem = getn(tmpItemArray);
			isinitem=false;
			for j=1,newItem,1 do
				if(tmpItemArray[j]["name"]==itemname) then
					tmpItemArray[j]["count"]=tmpItemArray[j]["count"]+TempItems[i]["count"];
					isinitem=true;
				
				end
			end
			if(not isinitem) then
			
					table.insert(tmpItemArray,1,
						{
							["name"] = itemname,
							["count"] = TempItems[i]["count"],
						}
					)
			end
		end
	end
	local headtext="";
	if(c1~=0) then
		headtext=headtext..Ugkp_item_auction[1]["typename"]..","..c1.." "
	end
	if(c2~=0) then
		headtext=headtext..Ugkp_item_auction[2]["typename"]..","..c2.." "
	end
	if(c3~=0) then
		headtext=headtext..Ugkp_item_auction[3]["typename"]..","..c3.." "
	end
	if(c4~=0) then
		headtext=headtext..Ugkp_item_auction[4]["typename"]..","..c4.." "
	end
	if(c5~=0) then
		headtext=headtext..Ugkp_item_auction[5]["typename"]..","..c5.." "
	end
	if(c6~=0) then
		headtext=headtext..Ugkp_item_auction[6]["typename"]..","..c6.." "
	end
	SendChatMessage(headtext, UgkpOptions.ChannelLevel,this.language, nil);
	
	local newItem = getn(tmpItemArray);
	for j=1,newItem,1 do
		headtext=tmpItemArray[j]["name"]..","..tmpItemArray[j]["count"]
		SendChatMessage(headtext, UgkpOptions.ChannelLevel,this.language, nil);
	end
end
function ugkp_send_item_packet_all()

	local tmpItemArray={};
	tempcount=getn(TempItems);
	for i=1, tempcount  do
		local newItem = getn(tmpItemArray);
		isinitem=false;
		itemname=TempItems[i]["name"]
		for j=1,newItem,1 do
			if(tmpItemArray[j]["name"]==itemname) then
				tmpItemArray[j]["count"]=tmpItemArray[j]["count"]+TempItems[i]["count"];
				isinitem=true;
			
			end
		end
		if(not isinitem) then
		
			table.insert(tmpItemArray,1,
				{
					["name"] = itemname,
					["count"] = TempItems[i]["count"],
				}
			)
		end
	end
	local newItem = getn(tmpItemArray);
	for j=1,newItem,1 do
		headtext=tmpItemArray[j]["name"]..","..tmpItemArray[j]["count"]
		SendChatMessage(headtext, UgkpOptions.ChannelLevel,this.language, nil);
	end

end


function Ugkp_CompareItemsPacket(a1, a2)

	local  method, way = Ugkp_SortOptions["method"], Ugkp_SortOptions["itemway"];

	if ( method == "player" ) then
		local c1, c2 = a1["player"], a2["player"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "rare" ) then
		local c1, c2 = UgkpRaid_RarityTable[a1["c"]], UgkpRaid_RarityTable[a2["c"]];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "name" ) then
		local c1, c2 = a1["c"], a2["c"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "time" ) then
		local c1, c2 = a1["name"], a2["time"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "cost" ) then
		local c1, c2 = a1["cost"], a2["cost"];
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	end
end


function Ugkp_SortItemPacket(maps)

		table.sort(
			maps,
			Ugkp_CompareItemsPacket
		);

end

function UgkpSortOptions_ToggleItemPacket(method)

	if ( Ugkp_SortOptions.method and Ugkp_SortOptions.method == method ) then
		if ( Ugkp_SortOptions.itemway and Ugkp_SortOptions.itemway == "asc" ) then
			Ugkp_SortOptions.itempacketway = "desc";
		else
			Ugkp_SortOptions.itempacketway = "asc";
		end
	else
		Ugkp_SortOptions.method = method;
		Ugkp_SortOptions.itemway = "asc";
	end
	Ugkp_SortItem(TempItems);
	Ugkp_UpdatePacketItem1();
end



function Ugkp_UpdatePacketItem1()

	totalItems=0;
	if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
		totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
	else
		for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
			getglobal("Ugkp_ItemPacketFrameListButton"..i):Hide();
		end
		FauxScrollFrame_Update(Ugkp_ItemPacketFrameListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
		return;
	end

	local tempcount=getn(TempItems);
	
	
	offset=0;
	local offset = FauxScrollFrame_GetOffset(Ugkp_ItemPacketFrameListScrollFrame);
	
	
	for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
		k = offset + i;
		if ( k > tempcount ) then
			getglobal("Ugkp_ItemPacketFrameListButton"..i):Hide();
		else
			getglobal("Ugkp_ItemPacketFrameListButton"..i):Show();
			item = TempItems[k];

			if ( getglobal("Ugkp_ItemPacketFrameListButton" .. i) ) then

				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "itemid"):SetText(item["itemid"]);
				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Name"):SetText("|c" .. item["c"]..item["name"]);
				c=item["c"];
				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Rare"):SetText(string.sub(item["time"],10));
				--getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Sdkp"):SetText(item["pcost"]);
				if(item["count"]) then
					getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Sdkp"):SetText(item["count"]);
				else
					getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Sdkp"):SetText(1);
				end
				getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "ToMember"):SetText(item["player"]);
				--if(item["selected"]==1) then
				--	getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Check"):SetChecked(1);
				--else
				--	getglobal("Ugkp_ItemPacketFrameListButton" .. i .. "Check"):SetChecked(1);
				--end
			--	if ( item["type"] and UgkpRaid_lang_ItemTextures[item["type"]] ) then
			--	getglobal("UgkpItemFrameListButton" .. i .. "ItemIcon"):SetTexture("Interface\\Icons\\"..UgkpRaid_lang_ItemTextures[item["type"]]);
			--	else
				--	getglobal("UgkpItemFrameListButton" .. i .. "ItemIcon"):SetTexture("Interface\\Icons\\"..UgkpRaid_lang_ItemTextures["Other"]);
			--	end
			end
		end
	end

	local c1=0;
	local c2=0;
	local c3=0;
	local c4=0;
	local c5=0;
	local c6=0;
	for i=1, tempcount  do
				
				itemname=TempItems[i]["name"]
				if(ugkp_isThisTypeItem(1,itemname)) then
					c1=c1+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(2,itemname)) then
					c2=c2+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(3,itemname)) then
					c3=c3+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(4,itemname)) then
					c4=c4+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(5,itemname)) then
					c5=c5+TempItems[i]["count"];
				elseif(ugkp_isThisTypeItem(6,itemname)) then
					c6=c6+TempItems[i]["count"];					
				end
	end
	
	
	local headtext="";
	if(c1~=0) then
		headtext=headtext..Ugkp_item_auction[1]["typename"]..","..c1.." "
	end
	if(c2~=0) then
		headtext=headtext..Ugkp_item_auction[2]["typename"]..","..c2.." "
	end
	if(c3~=0) then
		headtext=headtext..Ugkp_item_auction[3]["typename"]..","..c3.." "
	end
	if(c4~=0) then
		headtext=headtext..Ugkp_item_auction[4]["typename"]..","..c4.." "
	end
	if(c5~=0) then
		headtext=headtext..Ugkp_item_auction[5]["typename"]..","..c5.." "
	end
	if(c6~=0) then
		headtext=headtext..Ugkp_item_auction[6]["typename"]..","..c6.." "
	end	
	FauxScrollFrame_Update(Ugkp_ItemPacketFrameListScrollFrame,tempcount ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
	getglobal("UgkpRaidHeaderString"):SetText(headtext);
	--getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_ITEM.."|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].."|r(|cffffffff"..totalItems.."|r:|cff9d9d9d"..c0.."|r/|cffffffff"..c1.."|r/|cff1eff00"..c2.."|r/|cff0070dd"..c3.."|r/|cffa335ee"..c4.."|r/|cffff8000"..c5.."|r)");
	--getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_ITEM.."(|cffffffff"..totalItems.."|r:|cff9d9d9d"..c0.."|r/|cffffffff"..c1.."|r/|cff1eff00"..c2.."|r/|cff0070dd"..c3.."|r/|cffa335ee"..c4.."|r/|cffff8000"..c5.."|r)    |cffff0000"..UGKP_TITLE_ITEM_DES.."|r");
	
end