local Gkp_raimainfirstShow = true;
UGKP_BUTTON_HEIGHT = 37;
UGKP_NUM_BIDS_TO_DISPLAY = 10;

Gkp_CurrentRaidId = 0;

UGKP_PARTY_STUFF = { };

function Ugkp_RaidMain_OnShow()
  if (Gkp_raimainfirstShow) then
    UgkpRaidMain_SelectTab(1);
    Gkp_raimainfirstShow = false;
  end;
end


function UgkpRaidMain_SelectTab(tab)
  PanelTemplates_SetTab(UgkpRaidBorderFrame, tab);
  local TabFrames = {
    [1] = "Ugkp_RaidFrame",
    [2] = "Ugkp_MemberFrame",
    [3] = "Ugkp_ItemFrame",
    [4] = "Ugkp_ItemPacketFrame",
    [5] = "Ugkp_ReportFrame",
    [6] = "Ugkp_DistributeFrame",
    [7] = "Ugkp_DkpFrame"

  };
  for id, name in pairs(TabFrames) do
    if (id == tab) then
      getglobal(name):Show();
    else
      getglobal(name):Hide();
    end
  end

end

function Ugkp_RaidMain_OnLoad()
  this:RegisterEvent("VARIABLES_LOADED");
  this:RegisterEvent("CHAT_MSG_LOOT");
  this:RegisterEvent("CHAT_MSG_SYSTEM");
  this:RegisterEvent("CHAT_MSG_WHISPER");
  this:RegisterEvent("RAID_ROSTER_UPDATE");
  this:RegisterEvent("PLAYER_ENTERING_WORLD");
  this:RegisterEvent("OnEscapePressed");
  Ugkp_Debug(" register " , "load");
  PanelTemplates_SetNumTabs(UgkpRaidBorderFrame, 7);
  PanelTemplates_SetTab(UgkpRaidBorderFrame, 1);
  --init_raid();

  --UgkpRaidMain_SelectTab(tab)
end

function Ugkp_RaidMain_OnEvent(event)
  Ugkp_Debug("events", event);
  local t = date("*t");
  Ugkp_Debug("Gkp_CurrentRaidId",Gkp_CurrentRaidId);

  if ((event == "RAID_ROSTER_UPDATE" or event == "PLAYER_ENTERING_WORLD") and Gkp_CurrentRaidId~=0 ) then
    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==1) then
      Ugkp_Member_Compute();
    end
  elseif ((event == "CHAT_MSG_SYSTEM" or event == "RAID_ROSTER_UPDATE") and UnitName("player") and UnitName("player") ~= UgkpRaid_lang_UnknownEntity and Gkp_CurrentRaidId~=0) then
    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==1) then
      Ugkp_Member_Compute();
    end
  elseif ( event == "CHAT_MSG_LOOT" and Gkp_CurrentRaidId~=0) then
    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==1) then
      local sPlayer, sLink, sPlayerName, sItem, iCount;
      if(string.find(arg1, UgkpRaid_lang_ReceivesLoot1)) then
	iStart, iEnd, sPlayerName, sItem = string.find(arg1, UgkpRaid_lang_ReceivesLoot1);
	iCount = 1;
	--UgkpRaid_Debug("itemdropped1", "format", 1, sPlayerName, sItem, iCount);
      elseif(string.find(arg1, UgkpRaid_lang_ReceivesLoot2)) then
	iStart, iEnd, sItem = string.find(arg1, UgkpRaid_lang_ReceivesLoot2);
	iCount = 1;
	sPlayerName = UgkpRaid_lang_ReceivesLootYou;
	--UgkpRaid_Debug("itemdropped2", "format", 2, sPlayerName, sItem, iCount);
      elseif(string.find(arg1, UgkpRaid_lang_ReceivesLoot3)) then
	iStart, iEnd, sPlayerName, sItem, iCount = string.find(arg1, UgkpRaid_lang_ReceivesLoot3);
	--UgkpRaid_Debug("itemdropped3", "format", 3, sPlayerName, sItem, iCount);
      elseif(string.find(arg1, UgkpRaid_lang_ReceivesLoot4)) then
	iStart, iEnd, sItem, iCount = string.find(arg1, UgkpRaid_lang_ReceivesLoot4);
	sPlayerName = UgkpRaid_lang_ReceivesLootYou;
	--UgkpRaid_Debug("itemdropped4", "format", 4, sPlayerName, sItem, iCount);
      end

      itemcount=iCount;

      if (sPlayerName) then
	if(sPlayerName == UgkpRaid_lang_ReceivesLootYou) then
	  sPlayer = UnitName("player");
	else
	  sPlayer = sPlayerName;
	end
	sLink = sItem;
      end

      if ( sLink and sPlayer) then
	local sColor, sItem, sName, sTooltip = Ugkp_GetItemInfo(sLink);
	--Ugkp_Debug("are link",sColor, sItem, sName);
	if ( sColor and sItem and sName  ) then
	  if ( (UgkpOptions.ItemQuality and UgkpRaid_RarityTable[sColor] >= UgkpOptions.ItemQuality and not isIgnoreItem(sName) ) or isSetItem(sName) ) then
	    -- Insert into table
	    local tt = date("*t");
	    local nameGIF, linkGIF, qualityGIF, iLevelGIF, minLevelGIF, classGIF, subclassGIF, maxStackGIF, invtypeGIV, iconGIF = GetItemInfo("item:"..sItem);
	    _, _, iconGIF = string.find(iconGIF, "^.*\\(.*)$");
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
	      ["count"]=itemcount,
	      ["pcost"]=getUgkpItemGKP(sName),
	      ["selected"]=0
	    }
	    );
	    UGKP_Tooltip:Hide();
	    Ugkp_UpdateItem();
	  end
	end
      end
    end
  elseif ( event == "CHAT_MSG_WHISPER" ) then
    Ugkp_Debug(arg1);
    if( string.lower(arg1) == SYSTEM_QUERY_GKP) then
      --UgkpAnswerDkp(arg2);
    end
  elseif ( event == "VARIABLES_LOADED" ) then
    dkp_initialize();

    Ugkp_Raid_OnLoad();
    if(UgkpOptions.Ruler1==nil) then
      UgkpOptions.Ruler1=""..UGKP_EDIT_MESSAGE_RULER1;
      ugkp_rulerBodyEditBox:SetText(UgkpOptions.Ruler1);
    else
      ugkp_rulerBodyEditBox:SetText(UgkpOptions.Ruler1);
    end
    UgkpButtonPos:SetValue(UgkpOptions.UgkpButtonPosition);
  end

end

function ugkp_CreateNewRaid()
  --UgkpRaid_Online = { };
  --UgkpRaid_Offline = { };
  --UgkpRaid_GatheredData_Temp = { };
  --UgkpRaid_CompInfo = { DU_NI_U}
  --UgkpRaid_HaveRaid = true;

  --Ugkp_Debug("UgkpRaid_GetCurrentRaid",UgkpRaid_GetCurrentRaid);
  local t=date("*t");

  --local sDate = t.year.."年"..t.month.."月"..t.day.."日 "..t.hour.."时"..t.min.."分";
  local sDate=Ugkp_Date();

  totalRaids=getn(UGKP_PARTY_STUFF);
  if(totalRaids>4) then
    UgkpRaidMessageBox(UGKP_MESSAGE_MAX_RAID);
    return;
  else
    Gkp_CurrentRaidId=UgkpGenId();
  end

  table.insert(UGKP_PARTY_STUFF,1, {
    ["Id"]=Gkp_CurrentRaidId,
    ["Members"] = { },
    ["Items"] = { },
    ["Events"] = { },
    ["Notes"] = t.year.."-"..t.month,
    ["RaidTime"] = Ugkp_Date(),
    ["StartTime"] = "",
    ["IntStartTime"] = time(),
    ["EndTime"] = "",
    ["RaidLeader"] = "",
    ["Status"] = -1,
    ["RaidMap"] = "",
    ["Team"] = "",
    ["packet1"]=0,
    ["packet2"]=0,
    ["packet3"]=0,
    ["packet4"]=0

  });

  UgkpRaid_GetCurrentRaid=UgkpGetCurentRaid();

  ShowUgkp_RaidFrameElement();
  --	Ugkp_UpdateRaid();
  UgkpUpdateRaidList();
  --	Ugkp_UpdateEvent();
  --Ugkp_UpdateMemberDkp();
  --Ugkp_UpdateMember();
  --Ugkp_UpdateItem();
  UgkpRaidMain_SelectTab(1);
  Ugkp_Raid_OnLoad();
  getglobal("UgkpRaidStatus_Edit".."Text"):SetText("|cff0070dd"..UGKP_MESSAGE_STATUS_CREATE.."|r");
  getglobal("Ugkp_RaidMap_Edit"):SetFocus();
end


--因为不知道arg出了什么问题，暂时更改了这部分多参数处理，好在本插件中没有多参数的探出窗口
--[[function UgkpRaidMessageBox(...)
local sDebug = "#";
for i = 1, arg.n, 1 do
if ( arg[i] ) then
sDebug = sDebug .. arg[i] ;
end
end
DEFAULT_CHAT_FRAME:AddMessage(sDebug, 1, 0, 0);
end]]
function UgkpRaidMessageBox(arg1)
  local sDebug = "#";
  sDebug = sDebug .. arg1 ;

  DEFAULT_CHAT_FRAME:AddMessage(sDebug, 1, 0, 0);
end
function UgkpUpdateRaidList()

  local totalRaids = 0;
  for i=1,5 do
    getglobal("UgkpRaidFrameListButton"..i):Hide();
  end
  totalRaids=getn(UGKP_PARTY_STUFF);

  if( totalRaids> 0) then

    for i=1,totalRaids do
      getglobal("UgkpRaidFrameListButton"..i.."CheckId"):SetText(UGKP_PARTY_STUFF[i]["Id"]);
      getglobal("UgkpRaidFrameListButton"..i.."ButtonId"):SetText(UGKP_PARTY_STUFF[i]["Id"]);
      getglobal("UgkpRaidFrameListButton"..i.."ButtonName"):SetText(UGKP_PARTY_STUFF[i]["Notes"]);
      getglobal("UgkpRaidFrameListButton"..i):Show();
      Ugkp_Debug("UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]status"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]);
      if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==2 or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Status"]==3) then
	Ugkp_Debug("enable");
	getglobal("UgkpRaidFrameListButton"..i.."Button"):Enable();
	getglobal("UgkpRaidFrameListButton"..i.."ButtonName"):SetTextColor(84,80,81);
      else
	getglobal("UgkpRaidFrameListButton"..i.."Button"):Disable();
	getglobal("UgkpRaidFrameListButton"..i.."ButtonName"):SetTextColor(84,255,81);
	--getglobal("UgkpRaidFrameListButton"..i.."Name"):SetTextColor(84,80,81);
      end
      if(UGKP_PARTY_STUFF[i]["Id"]==Gkp_CurrentRaidId) then
	getglobal("UgkpRaidFrameListButton"..i.."ButtonName"):SetTextColor(0,255,0);
      end
    end
  end
end

function UgkpGenId()
  local tt=date("*t");
  local id=tt.month..tt.day..tt.hour..tt.min..tt.sec..GetTime();
  return id;
end

function UgkpGetCurentRaid()
  totalRaids=getn(UGKP_PARTY_STUFF);

  for i = 1, totalRaids  do
    if(UGKP_PARTY_STUFF[i]["Id"]==Gkp_CurrentRaidId) then
      return i;
    end
  end
  if(totalRaids>0) then
    return 1;
  else
    return 0
  end
end

function UgkpChangeRaid()

  RaidId= getglobal("UgkpRaidFrameListButton"..this:GetParent():GetID().."ButtonId"):GetText();
  Ugkp_Debug("RaidId"..RaidId.."Gkp_CurrentRaidId"..Gkp_CurrentRaidId);
  if(RaidId==Gkp_CurrentRaidId) then
    return;
  else
    Gkp_CurrentRaidId=RaidId;
    UgkpRaid_GetCurrentRaid=UgkpGetCurentRaid();
    UgkpUpdateRaidList();
  end
  Ugkp_Raid_OnLoad();
  UgkpUpdateRaidList();
  Ugkp_UpdateMember();
  Ugkp_UpdateEvent();
  Ugkp_UpdateItem();
  UgkpChangeButtonStatus();
  UgkpRaidMain_SelectTab(1);
  getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_RAID.."|cff1eff00"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Notes"].." |r");
end

function UgkpDeleteRaid()
  totalRaids=getn(UGKP_PARTY_STUFF);
  FlagDeleteCurrentRaid=false;
  if( totalRaids> 0) then
    for i=5,1 ,-1 do
      CheckRaid=getglobal("UgkpRaidFrameListButton"..i.."Check");

      if(CheckRaid:GetChecked()) then
	CheckId=getglobal("UgkpRaidFrameListButton"..i.."CheckId"):GetText();
	CheckRaid:SetChecked(false);
	for j=getn(UGKP_PARTY_STUFF),1,-1 do

	  if(CheckId==UGKP_PARTY_STUFF[j]["Id"]) then
	    table.remove(UGKP_PARTY_STUFF,j);
	  end
	end


	if(CheckId==Gkp_CurrentRaidId) then
	  FlagDeleteCurrentRaid=true;
	end
      end
    end
    if(FlagDeleteCurrentRaid and getn(UGKP_PARTY_STUFF)>0) then
      Gkp_CurrentRaidId=UGKP_PARTY_STUFF[1]["Id"];
      UgkpRaid_GetCurrentRaid=UgkpGetCurentRaid()
    elseif(getn(UGKP_PARTY_STUFF)<1) then
      Gkp_CurrentRaidId=0;
      UgkpRaid_GetCurrentRaid=0;
    end
  end

  UgkpUpdateRaidList();
  Ugkp_Raid_OnLoad();
end


function UgkpAnswerDkp(member)
  if(Gkp_CurrentRaidId~=0) then
    totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
    for k, v in UGKP_PARTY_STUFF[1]["Members"] do
      if( v["player"] == member ) then
	SendChatMessage(UGKP_IF_QUERY_DATA.." "..(v["dkp"]+getUgkpPlayerGKPLeft(v["player"])),"WHISPER", this.language, member);

	for i=totalEvents, 1,-1  do
	  totalplayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"]);

	  for j=totalplayers,1,-1 do

	    if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["players"][j]==member) then
	      SendChatMessage(SEND_GKP_MESSGE_EVENT..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["reason"]..SEND_GKP_MESSGE_EVENT_CHANGE..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i]["dkp"],"WHISPER", this.language, member);

	    end

	  end
	end
	SendChatMessage("------------------------------","WHISPER", this.language, member);
	--SendChatMessage(UGKP_MESSAGE_DUNIU,"WHISPER", this.language, member);
	return;
      end
    end
    SendChatMessage(UGKP_NOT_QUERY_DATA,"WHISPER", this.language, member);
    SendChatMessage("------------------------------","WHISPER", this.language, member);
    --SendChatMessage(UGKP_MESSAGE_DUNIU,"WHISPER", this.language, member);
  end
  return;
end


function Ugkp_GetItemInfo(sItem)
  --local iStart, iEnd, sColor, sItemName, sName = string.find(sItem, "|c(%x+)|Hitem:(%d+:%d+:%d+:%d+)|h%[(.-)%]|h|r");
  local _, _, sColor, sItemName, sName = string.find(sItem, "|c(%x+)|Hitem:([-%d:]+)|h%[(.-)%]|h|r");

  if ( sItemName ) then
    local tTooltip = { };

    UGKP_Tooltip:ClearLines()
    UGKP_Tooltip:SetHyperlink("item:" .. sItemName);
    UGKP_Tooltip:Show();
    UGKP_Tooltip.id = sItemName;
    --		Uasit_Debug("UGKP_Tooltip:NumLines()",UGKP_Tooltip:NumLines(),sItemName);
    for i = 1, UGKP_Tooltip:NumLines(), 1 do
      local tl, tr;
      tl = getglobal("UGKP_TooltipTextLeft" .. i):GetText();
      tr = getglobal("UGKP_TooltipTextRight" .. i):GetText();
      tinsert(tTooltip, { ["left"] = tl, ["right"] = tr });
    end

    return sColor, sItemName, sName, tTooltip;

  end
end

function Ugkp_GetItemType(link)
  local Ugkptypes = UgkpRaid_lang_types;

  local special = UgkpRaid_lang_special;
  for i = 1, 30, 1 do
    getglobal("UGKP_TooltipTextLeft" .. i):SetText("");
    getglobal("UGKP_TooltipTextLeft" .. i):Hide();
    getglobal("UGKP_TooltipTextRight" .. i):SetText("");
    getglobal("UGKP_TooltipTextRight" .. i):Hide();
  end

  UGKP_Tooltip:SetOwner(Ugkp_ItemFrame,"ANCHOR_NONE");
  UGKP_Tooltip:SetHyperlink(link);
  --UGKP_Tooltip:Hide();
  for i = 2, min(UGKP_Tooltip:NumLines(), 5), 1 do
    local textleft = getglobal("UGKP_TooltipTextLeft" .. i);
    local textright = getglobal("UGKP_TooltipTextRight" .. i);


    if ( textleft and ugkptypes[textleft:GetText()] ) then
      if ( ( textleft:GetText() == UgkpRaid_lang_OffHand or textleft:GetText() == UgkpRaid_lang_MainHand or textleft:GetText() == UgkpRaid_lang_OneHand or textleft:GetText() == UgkpRaid_lang_TwoHand ) and strlen(textright:GetText()) > 0 ) then
	if ( special[textright:GetText()] ) then
	  if ( textleft:GetText() == UgkpRaid_lang_TwoHand ) then
	    return UgkpRaid_lang_TwoHand.."-" .. textright:GetText();
	  else

	    return "Special-" .. textright:GetText();
	  end
	else

	  return textleft:GetText().."-Other";
	end
      else

	return textleft:GetText();
      end
    elseif ( textright and ugkptypes[textright:GetText()] ) then

      return textright:GetText();
    end
  end

  return "Other";
end



--[[function Ugkp_SetItemRef(link, text, button)
if ( strsub(link, 1, 6) == "player" ) then
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
FriendsFrame_ShowDropdown(name, 1);
else
ChatFrame_SendTell(name);
end
end
return;
end

if ( IsShiftKeyDown() ) then
if ( ChatFrameEditBox:IsVisible() ) then
ChatFrameEditBox:Insert(text);
elseif( UgkpAddDkpFrame:IsVisible()) then
getglobal("UgkpAddDkpFrameDes"):SetText(text);
end
else
ShowUIPanel(ItemRefTooltip);
if ( not ItemRefTooltip:IsVisible() ) then
ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
end
ItemRefTooltip:SetHyperlink(link);
end

end
]]--
function getUgkpItemGKP(sItem)
  if(itemlist) then
    if(itemlist[sItem]) then
      return itemlist[sItem];
    end
  end
  return 0;
end

function isSetItem(sName)
  typecount=getn(Ugkp_item_auction)
  for tab = 1, typecount,1 do
    itemcount=getn(Ugkp_item_auction[tab]["itemnames"]);
    for j=1,itemcount,1 do
      if(Ugkp_item_auction[tab]["itemnames"][j]["itemname"]==sName and Ugkp_item_auction[tab]["itemnames"][j]["checked"] == 1) then
	return true;
      end
    end
  end
  return false;
end

function isIgnoreItem(sName)
  typecount=getn(Ugkp_item_ignore)
  for tab = 1, typecount,1 do
    itemcount=getn(Ugkp_item_ignore[tab]["itemnames"]);
    for j=1,itemcount,1 do
      if(Ugkp_item_ignore[tab]["itemnames"][j]["itemname"]==sName and Ugkp_item_ignore[tab]["itemnames"][j]["checked"] == 1) then
	return true;
      end
    end
  end
  return false;
end

function ugkp_mod(t,j)
  local m=math.floor(t/j);
  return t - j*m;
end
