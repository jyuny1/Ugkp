selectClass="";
selectMember="";

UgkpRaid_RarityTable = {
  ["ff9d9d9d"] = 0,
  ["ffffffff"] = 1,
  ["ff1eff00"] = 2,
  ["ff0070dd"] = 3,
  ["ffa335ee"] = 4,
  ["ffff8000"] = 5,
};

function Ugkp_UpdateItem()

  totalItems=0;
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
    totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  else
    for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
      getglobal("UgkpItemFrameListButton"..i):Hide();
    end
    FauxScrollFrame_Update(UgkpItemListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
    return;
  end

  offset=0;
  local offset = FauxScrollFrame_GetOffset(UgkpItemListScrollFrame);
  --Ugkp_Debug("offset",offset);

  for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
    k = offset + i;
    if ( k > totalItems ) then
      getglobal("UgkpItemFrameListButton"..i):Hide();
    else
      getglobal("UgkpItemFrameListButton"..i):Show();
      item = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][k];

      if ( getglobal("UgkpItemFrameListButton" .. i) ) then

	getglobal("UgkpItemFrameListButton" .. i .. "itemid"):SetText(item["itemid"]);
	getglobal("UgkpItemFrameListButton" .. i .. "Name"):SetText("|c" .. item["c"]..item["name"]);
	c=item["c"];
	getglobal("UgkpItemFrameListButton" .. i .. "Rare"):SetText(string.sub(item["time"],10));
	--getglobal("UgkpItemFrameListButton" .. i .. "Sdkp"):SetText(item["pcost"]);
	if(item["count"]) then
	  getglobal("UgkpItemFrameListButton" .. i .. "Sdkp"):SetText(item["count"]);
	else
	  getglobal("UgkpItemFrameListButton" .. i .. "Sdkp"):SetText(1);
	end
	getglobal("UgkpItemFrameListButton" .. i .. "ToMember"):SetText(item["player"]);
	getglobal("UgkpItemFrameListButton" .. i .. "ItemDkp"):SetText(item["cost"]);
	if(item["selected"]==1) then
	  getglobal("UgkpItemFrameListButton" .. i .. "Check"):SetChecked(1);
	else
	  getglobal("UgkpItemFrameListButton" .. i .. "Check"):SetChecked(0);
	end
	--	if ( item["type"] and UgkpRaid_lang_ItemTextures[item["type"]] ) then
	--	getglobal("UgkpItemFrameListButton" .. i .. "ItemIcon"):SetTexture("Interface\\Icons\\"..UgkpRaid_lang_ItemTextures[item["type"]]);
	--	else
	--		getglobal("UgkpItemFrameListButton" .. i .. "ItemIcon"):SetTexture("Interface\\Icons\\"..UgkpRaid_lang_ItemTextures["Other"]);
	--	end
      end
    end
  end
  local c0=0;
  local c1=0;
  local c2=0;
  local c3=0;
  local c4=0;
  local c5=0;
  for i=1, totalItems  do

    c=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["c"];
    if(c=="ff9d9d9d") then
      c0=c0+1;
    elseif(c=="ffffffff") then
      c1=c1+1;
    elseif(c=="ff1eff00") then
      c2=c2+1;
    elseif(c=="ff0070dd") then
      c3=c3+1;
    elseif(c=="ffa335ee") then
      c4=c4+1;
    elseif(c=="ffff8000") then
      c5=c5+1;
    end
  end
  FauxScrollFrame_Update(UgkpItemListScrollFrame,totalItems ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
  --getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_ITEM.."|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].."|r(|cffffffff"..totalItems.."|r:|cff9d9d9d"..c0.."|r/|cffffffff"..c1.."|r/|cff1eff00"..c2.."|r/|cff0070dd"..c3.."|r/|cffa335ee"..c4.."|r/|cffff8000"..c5.."|r)");
  getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_ITEM.."(|cffffffff"..totalItems.."|r:|cff9d9d9d"..c0.."|r/|cffffffff"..c1.."|r/|cff1eff00"..c2.."|r/|cff0070dd"..c3.."|r/|cffa335ee"..c4.."|r/|cffff8000"..c5.."|r)    |cffff0000"..UGKP_TITLE_ITEM_DES.."|r");
end

function Ugkp_SetHyperlink()
  GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
  local itemid = getglobal(this:GetName() .. "itemid"):GetText();
  lootid=1;
  itemnumber=getn(UGKP_PARTY_STUFF[1]["Items"]);
  for i=1,itemnumber,1 do
    if(itemid==UGKP_PARTY_STUFF[1]["Items"][i]["itemid"]) then
      lootid=i;
    end
  end
  if ( UGKP_PARTY_STUFF[1] and UGKP_PARTY_STUFF[1]["Items"][lootid] ) then
    local item = UGKP_PARTY_STUFF[1]["Items"][lootid];
    --Uasit_Debug(itemid,item["id"]);
    if (GetItemInfo("item:" .. item["id"])) then
      GameTooltip:SetHyperlink("item:" .. item["id"]);
      --Uasit_Debug("GameTooltip:NumLines()",GameTooltip:NumLines());
    else
      rl, gl, bl = UgkpColorToRGB(item["c"]);
      GameTooltip:AddLine(item["name"], rl, gl, bl);
      GameTooltip:AddLine("This item is not in your cache, you can try to get the information by rightclicking the item (This may result in a disconnect!)", 1, 1, 1);
    end
  end
  GameTooltip:Show();
end

function UgkpDeleteItembyItemid(itemid)

  if(itemid=="") then
    return;
  end


  itemnumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  membernumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
  eventnumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
  for i=1,itemnumber,1 do
    if(itemid==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["itemid"]) then
      if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]["cost"]==0) then
	table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"],i)
	--				Ugkp_UpdateItem();
      else
	for j=1,eventnumber,1 do
	  if(itemid==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["itemid"]) then
	    table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"],j);
	    break;
	  end
	end
	for j=1,membernumber,1 do
	  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]) then
	    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["dkp"] +UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]
	    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["ldkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["ldkp"] +UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]
	    break;
	  end
	end
	table.remove(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"],i)
	Ugkp_UpdateItem();
	--			Ugkp_UpdateMember();
	--		Ugkp_UpdateEvent();
      end
      break;
    end
  end

end

function UgkpChangeItemDkp(itemid)

  itemid=getglobal("currentitemid"):GetText();
  newitemdkp=getglobal("UgkpChangeItemPoint"):GetNumber();
  getglobal("UgkpChangeItemPoint"):SetText("");
  if(itemid=="") then
    return;
  end
  itemnumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  membernumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
  if(membernumber<1) then
    UgkpRaidMessageBox(UGKP_MESSAGE_NO_MEMBER);
    return;
  end
  eventnumber=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
  for i=1,itemnumber,1 do
    if(itemid==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["itemid"]) then

      if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]==0 and newitemdkp==0) then
	return;
      end

      if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]==0) then

	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]=0+newitemdkp;
	item=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]
	table.insert(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"],1,
	{
	  ["eventid"] = UgkpGenId(),
	  ["itemid"] = itemid,
	  ["itemname"] = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["name"],
	  ["reason"] = "|c"..item["c"].."|Hitem:"..item["id"].."|h["..item["name"].."]|h|r",--UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["name"],
	  ["type"] = 3,
	  ["eventtime"] = Ugkp_Date(),
	  ["dkp"] =0 - newitemdkp,
	  ["players"]={UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["player"]}
	}
	);
	for j=1,membernumber,1 do
	  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]) then
	    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["dkp"] - newitemdkp

	    break;
	  end
	end
	Ugkp_UpdateItem();
	--				Ugkp_UpdateMember();
	--				Ugkp_UpdateEvent();
      else
	for j=1,eventnumber,1 do
	  if(itemid==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["itemid"]) then
	    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["dkp"]=0 - newitemdkp
	    break;
	  end
	end
	for j=1,membernumber,1 do
	  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]) then
	    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["dkp"] +UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"] - newitemdkp
	    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["ldkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["ldkp"] +UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]- newitemdkp
	    break;
	  end
	end
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["cost"]=newitemdkp;
	Ugkp_UpdateItem();
	--				Ugkp_UpdateMember();
	--				Ugkp_UpdateEvent();
      end
      break;
    end
  end

end

function UgkpChangeItemMember()

  itemid=getglobal("currentitemid"):GetText();
  if(itemid=="") then
    return;
  end
  totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
  if(totalraidmembers<1) then
    UgkpRaidMessageBox(UGKP_MESSAGE_NO_MEMBER);
    return;
  end
  totalevents=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
  for i =1 ,totalItems,1 do
    item=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i];
    if(item["itemid"]==itemid) then
      for j=1,60,1 do

	if(getglobal("UgkpItemMemberList"..j.."Check"):GetChecked()) then
	  for k=1,totalraidmembers,1 do
	    if(item["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["player"]) then
	      UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]+item["cost"];

	    end
	    if(getglobal("UgkpItemMemberList"..j.."ButtonName"):GetText()==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["player"]) then
	      UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][k]["dkp"]-item["cost"];

	    end
	  end

	  for k=1,totalevents,1 do
	    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][k]["itemid"]==itemid) then
	      UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][k]["players"][1]=getglobal("UgkpItemMemberList"..j.."ButtonName"):GetText();
	    end
	  end

	  item["player"]=getglobal("UgkpItemMemberList"..j.."ButtonName"):GetText();
	  break;
	end
      end

      break;
    end
  end
  UgkpChangeItemMemberFrame:Hide();
  --	Ugkp_UpdateMember();
  --	Ugkp_UpdateEvent();
  Ugkp_UpdateItem();

end

function UgkpChangeItemMemberFrame_OnMouseUp()

  if ( UgkpChangeItemMemberFrame.isMoving ) then
    UgkpChangeItemMemberFrame:StopMovingOrSizing();
    UgkpChangeItemMemberFrame.isMoving = false;
  end
end

function UgkpChangeItemMemberFrame_OnMouseDown(button)
  if ( ( ( not UgkpChangeItemMemberFrame.isLocked ) or ( UgkpChangeItemMemberFrame.isLocked == 0 ) ) and ( arg1 == "LeftButton" ) ) then
    UgkpChangeItemMemberFrame:StartMoving();
    UgkpChangeItemMemberFrame.isMoving = true;
  end
end



function UgkpChangeItemMemberFrame_OnHide()
  if ( UgkpChangeItemMemberFrame.isMoving ) then
    UgkpChangeItemMemberFrame:StopMovingOrSizing();
    UgkpChangeItemMemberFrame.isMoving = false;
  end
end

function UgkpChangeItemMemberFrame_OnShow()
  itemid=getglobal("currentitemid"):GetText();
  if(itemid=="") then
    return;
  end

  totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  totalraidmembers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
  --Ugkp_Debug(totalItems,totalraidmembers);
  for i =1 ,totalItems,1 do
    item=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i];
    if(item["itemid"]==itemid) then

      for j=1,60,1 do
	if(j>totalraidmembers) then
	  getglobal("UgkpItemMemberList"..j):Hide();
	  getglobal("UgkpItemMemberList"..j.."Check"):SetChecked(false);
	else
	  getglobal("UgkpItemMemberList"..j):Show();
	  if(item["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]) then
	    getglobal("UgkpItemMemberList"..j.."Check"):SetChecked(true);
	  else
	    getglobal("UgkpItemMemberList"..j.."Check"):SetChecked(false);
	  end

	  getglobal("UgkpItemMemberList"..j.."ButtonName"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][j]["player"]);
	end
      end
      break;
    end
  end
end

function UgkpItemMemberListTemplate_OnClick(index)
  for i=1,60,1 do
    if(index~=i) then
      getglobal("UgkpItemMemberList"..i.."Check"):SetChecked(false);
    else
      getglobal("UgkpItemMemberList"..i.."Check"):SetChecked(true);
    end
  end
end

function Ugkp_CompareItems(a1, a2)

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


function Ugkp_SortItem(maps)

  table.sort(
  maps,
  Ugkp_CompareItems
  );

end

function UgkpSortOptions_ToggleItem(method)

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
  Ugkp_SortItem(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  Ugkp_UpdateItem();
end

function UgkpColorToRGB(str)
  --Ugkp_Debug("colorToRGB", str);
  str = strlower(strsub(str, 3));
  local tbl = { };
  tbl[1], tbl[2], tbl[3], tbl[4], tbl[5], tbl[6] = strsub(str, 1, 1), strsub(str, 2, 2), strsub(str, 3, 3), strsub(str, 4, 4), strsub(str, 5, 5), strsub(str, 6, 6);

  local highvals = { ["a"] = 10, ["b"] = 11, ["c"] = 12, ["d"] = 13, ["e"] = 14, ["f"] = 15 };
  for k, v in tbl do
    if ( highvals[v] ) then
      tbl[k] = highvals[v];
    elseif ( tonumber(v) ) then
      tbl[k] = tonumber(v);
    end
  end
  local r, g, b = (tbl[1]*16+tbl[2])/255, (tbl[3]*16+tbl[4])/255, (tbl[5]*16+tbl[6])/255;
  if ( not r or r > 1 or r < 0 ) then
    r = 1;
  end
  if ( not g or g > 1 or g < 0 ) then
    g = 1;
  end
  if ( not b or b > 1 or b < 0 ) then
    b = 1;
  end
  return r, g, b;
end

function UgkpGetColorString(str)
  local playerClass = select(2,UnitClass("player"));
  local playerLevel = UnitLevel("player");
  local classArmor = UgkpRaid_lang_classArmor;

  if(not str) then
    return 0, 1, 0;
  end

  -- Equip:
  if ( string.find(str, "^"..UgkpRaid_lang_Equip..": ") ) then
    return 0, 1, 0;

    -- Use:
  elseif ( string.find(str, "^"..UgkpRaid_lang_Use..": ") ) then
    return 0, 1, 0;

    -- Chance on hit:
  elseif ( string.find(str, "^"..UgkpRaid_lang_Chanceonhit..":") ) then
    return 0, 1, 0;

    -- Sets
  elseif ( string.find(str, "^.+ %(%d+/%d+%)$") ) then
    return 1, 0.82, 0, 1;

    -- Durability 0/X
  elseif ( string.find(str, "^"..UgkpRaid_lang_Durability.." 0 / %d+$") ) then
    return 1, 0.15, 0.15;

    -- Wrong class
  elseif ( string.find(str, "^"..UgkpRaid_lang_Classes..": ") and not string.find(str, "^"..UgkpRaid_lang_Classes..": .*" .. playerClass) ) then
    return 1, 0.15, 0.15;

    -- Made by
  elseif ( string.find(str, "^<"..UgkpRaid_lang_Madeby.." .+>$") ) then
    return 0, 1, 0;
  end



  -- Armor type
  --Ugkp_Debug(classArmor[playerClass][str],playerLevel);
  if ( classArmor[playerClass][str] and classArmor[playerClass][str] > playerLevel ) then
    return 1, 0.15, 0.15;
  end

  -- Low level
  --local iStart, iEnd, level = string.find(str, "^Requires Level (%d+)$");
  local iStart, iEnd, level = string.find(str, "^"..UgkpRaid_lang_RequiresLevel.." (%d+)$");
  if ( level and tonumber(level) > playerLevel ) then
    return 1, 0.15, 0.15;
  end
  return 1, 1, 1;
end

function UgkpDeleteitem()
  if(getglobal("UGKP_AcceptDeleteFrametype"):GetText()=="1") then
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_MEMBER_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(UGKP_MESSAGE_MEMBER_DELETE);
  elseif(getglobal("UGKP_AcceptDeleteFrametype"):GetText()=="2") then
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_ITEM_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(UGKP_MESSAGE_ITEM_DELETE);
  elseif(getglobal("UGKP_AcceptDeleteFrametype"):GetText()=="3") then
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_EVENT_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(UGKP_MESSAGE_EVENT_DELETE);
  elseif(getglobal("UGKP_AcceptDeleteFrametype"):GetText()=="4") then
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_RAID_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(UGKP_MESSAGE_RAID_DELETE);
  elseif(getglobal("UGKP_AcceptDeleteFrametype"):GetText()=="5") then
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_MEMBER_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(UGKP_MESSAGE_MEMBER_DELETE);
  elseif(getglobal("UGKP_AcceptDeleteFrametype"):GetText()=="6") then
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_MEMBER_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(UGKP_MESSAGE_MEMBER_DELETE);
  end
end

function UgkpChangeClass()
  UIDropDownMenu_SetSelectedValue(Ugkp_AddItemClassDropDown,this.value);
  selectClass=this.value;
  --Ugkp_Debug(this.value)
  Ugkp_AddItemMember_OnLoad();
end

function Ugkp_Class_Init()
  for k,instance in pairs(UgkpRaid_Class) do
    local info = { };
    info.text = instance;
    info.value = instance;
    info.func = UgkpChangeClass;
    UIDropDownMenu_AddButton(info);
  end
end
function Ugkp_AddItemClass_OnLoad()
  UIDropDownMenu_Initialize(Ugkp_AddItemClassDropDown, Ugkp_Class_Init);
  --UIDropDownMenu_SetText("", Ugkp_AddItemClassDropDown);
  --[[if(Ugkp_AddItemClassDropDown:GetText()=="") then
  UIDropDownMenu_SetSelectedID(Ugkp_AddItemClassDropDown, 1);
  --Ugkp_AddItemClassDropDown:SetText(UIDropDownMenu_GetSelectedValue(Ugkp_AddItemClassDropDown));
  else
  UIDropDownMenu_SetSelectedValue(Ugkp_AddItemClassDropDown,Ugkp_AddItemClassDropDown:GetText());
  end]]
end

function Ugkp_AddItemMember_OnLoad()
  UIDropDownMenu_Initialize(Ugkp_AddItemMemberDropDown, Ugkp_Member_Init);
  --UIDropDownMenu_SetText("", Ugkp_AddItemMemberDropDown);
  --[[if(Ugkp_AddItemMemberDropDown:GetText()=="") then
  UIDropDownMenu_SetSelectedID(Ugkp_AddItemMemberDropDown, 1);
  --Ugkp_AddItemMemberDropDown:SetText(UIDropDownMenu_GetSelectedValue(Ugkp_AddItemMemberDropDown));
  else
  UIDropDownMenu_SetSelectedValue(Ugkp_AddItemMemberDropDown,Ugkp_AddItemMemberDropDown:GetText());
  end]]
end

function Ugkp_Member_Init()
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then

    raidMemberCount = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
    for i=1,raidMemberCount,1 do

      if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["class"]==selectClass) then

	local info = { };
	info.text = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"];
	info.value = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["player"];
	info.func = UgkpChangeMember;
	UIDropDownMenu_AddButton(info);
      end
    end
  end
end


function UgkpChangeMember()
  UIDropDownMenu_SetSelectedValue(Ugkp_AddItemMemberDropDown,this.value);
  selectMember=this.value;
  --Ugkp_Debug(this.value)
end


function Ugkp_ChatFrame_OnHyperlinkShow(self, link, text, button)
  Ugkp_SetItemRef(link, text, button)
end;


function Ugkp_SetItemRef(link, text, button)
  if ( link and strsub(link, 1, 6) == "player" ) then
    local name = strsub(link, 8);
    if ( name and (strlen(name) > 0) ) then
      name = gsub(name, "([^%s]*)%s+([^%s]*)", "%2");
      if ( IsShiftKeyDown() ) then
	local staticPopup = StaticPopup_Visible("ADD_IGNORE");
	if ( staticPopup ) then
	  -- If add ignore dialog is up then enter the name into the editbox
	  getglobal(staticPopup.."EditBox"):SetText(name);
	else
	  SendWho("n-"..name);
	end

      elseif ( button == "RightButton" ) then
	FriendsFrame_ShowDropdown(name, 1, lineid);
      else
	ChatFrame_SendTell(name);
      end
    end
    return;
  end

  if ( IsShiftKeyDown() ) then
    if ( ChatFrameEditBox:IsVisible() ) then
      ChatFrameEditBox:Insert(text);
    elseif( UgkpAddItemFrame:IsVisible()) then
      getglobal("UgkpAddItemNameText"):SetText(text);
    end
  else
    ShowUIPanel(ItemRefTooltip);
    --if ( not ItemRefTooltip:IsVisible() ) then
    if ( not ItemRefTooltip:IsShown() ) then
      ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
    end
    ItemRefTooltip:SetHyperlink(text);

  end

end

function Ugkp_ManAddItem()
  sPlayer=selectMember;
  sLink=getglobal("UgkpAddItemNameText"):GetText();
  --Ugkp_Debug("sLink","aa"..sLink.."bb"..sPlayer.."cc");
  if(sLink=="" or sLink==nil) then
    UgkpRaidMessageBox(UGKP_NO_ADD_ITEM);
    --				UgkpRaidMessageBox("stghsgf");
    return;
  end

  if(sPlayer=="" or sPlayer==nil) then
    UgkpRaidMessageBox(UGKP_NO_ITEM_LOOTER);
    return;
  end

  if ( sLink and sPlayer ) then
    local sColor, sItem, sName, sTooltip = Ugkp_GetItemInfo(sLink);
    --Ugkp_Debug(sColor, sItem, sName);
    if ( sColor and sItem and sName  ) then

      local nameGIF, linkGIF, qualityGIF, iLevelGIF, minLevelGIF, classGIF, subclassGIF, maxStackGIF, invtypeGIV, iconGIF = GetItemInfo("item:"..sItem);
      _, _, iconGIF = string.find(iconGIF, "^.*\\(.*)$");
      -- Insert into table
      local tt = date("*t");
      table.insert(UGKP_PARTY_STUFF[1]["Items"],1,
      {
	["tooltip"] = sTooltip,
	["player"] = sPlayer,
	["c"] = sColor,
	["itemid"] =  UgkpGenId(),
	["name"] = sName,
	["cost"] = 0,
	["type"] = iconGIF,
	["time"] = Ugkp_Date(),
	["id"]=sItem,
	["count"]=1,
	["pcost"]=getUgkpItemGKP(sName),
	["selected"]=0
      }
      );
      UGKP_Tooltip:Hide();

    end

    Ugkp_UpdateItem();
  end
  UgkpAddItemFrame:Hide()
end


function Ugkp_CheckedItem(itemid)
  totalItems=0;
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
    totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  end
  for i=1,totalItems,1 do
    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["itemid"]==itemid) then
      if(this:GetChecked()) then
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["selected"]=1;
      else
	UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["selected"]=0;
      end
      break;
    end
  end
end


function Ugkp_DeleteSelectItemOK()
  totalItems=0;
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
    totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  end
  selectitem=0;
  for i=1,totalItems,1 do
    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["selected"]==1) then
      selectitem=selectitem+1;
    end
  end
  if(selectitem==0) then
    UgkpRaidMessageBox(UGKP_NO_ITEM_DELETE);
  else
    deletemessage=UGKP_ITEM_DELETE_CONFIRM1..selectitem..UGKP_ITEM_DELETE_CONFIRM2;
    getglobal("UGKP_AcceptDeleteFrameHeaderText"):SetText(UGKP_BUTTON_ITEM_DELETE);
    getglobal("UGKP_AcceptDeleteFrameInfo"):SetText(deletemessage);
    getglobal("UGKP_AcceptDeleteFrametype"):SetText("7");
    UGKP_AcceptDeleteFrame:Show();
  end

  --UgkpDeleteItembyItemid(itemid)

end

function Ugkp_DeleteSelectItem()
  totalItems=0;
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
    totalItems = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"]);
  end

  for i=totalItems,1,-1 do

    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["selected"]==1) then

      UgkpDeleteItembyItemid(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Items"][i]["itemid"]);
    end
  end
  --UgkpItem_CompInfo = {DU_NIU}
end


function Ugkp_ItemColorDropDown_OnLoad()
  UIDropDownMenu_Initialize(this, Ugkp_ItemColorDropDown_Initialize);
  --UIDropDownMenu_SetWidth(50, Ugkp_ItemColorDropDown);
  UIDropDownMenu_SetWidth(Ugkp_ItemColorDropDown, 50);
end


function Ugkp_ItemColorDropDown_Initialize()
  info = {};
  info.text = ALL;
  info.value = -1;
  info.func = Ugkp_ItemColorDropDown_OnClick;
  UIDropDownMenu_AddButton(info);
  for i=0, getn(ITEM_QUALITY_COLORS)  do
    info = {};
    info.text = getglobal("ITEM_QUALITY"..i.."_DESC");
    info.value = i;
    info.func = Ugkp_ItemColorDropDown_OnClick;
    UIDropDownMenu_AddButton(info);
  end

end

function Ugkp_ItemColorDropDown_OnClick()
  UIDropDownMenu_SetSelectedValue(Ugkp_ItemColorDropDown, this.value);

end
