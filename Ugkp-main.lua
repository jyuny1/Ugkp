UgkpOptions = {["UgkpButtonPosition"]=200, ["UgkpButtonShown"] = true, ["ItemQuality"] = 2,["CoinLevel"] = 1,["ChannelLevel"]="RAID",["Ruler1"]=""..UGKP_EDIT_MESSAGE_RULER1};
Ugkp_SortOptions = {["method"]="", ["itemway"]=""};

Ugkp_DebugFlag=false;


function UgkpButton_OnClick()
	ugkp_dkp_show();
end

ugkp_dkp_show=function() 
	if(UGkpMainFrame:IsVisible()) then
		HideUIPanel(UGkpMainFrame);
	else
		ShowUIPanel(UGkpMainFrame);
	end;
end;



function UgkpButton_UpdatePosition()
	UGkpButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (78 * cos(UgkpOptions.UgkpButtonPosition)),
		(78 * sin(UgkpOptions.UgkpButtonPosition)) - 55
	);
end

local firstShow = true;

function UGKPMain_SelectTab(tab)
	PanelTemplates_SetTab(UGkpMainFrame, tab);
	local TabFrames = {
			[1] = "Ugkp_RaidMainFrame",
			[2] = "Ugkp_Set"
			
		};
		for id, name in pairs(TabFrames) do
			if (id == tab) then
				getglobal(name):Show();
			else
				getglobal(name):Hide();
			end
		end
	
end

function UGKPMain_OnMouseUp()
	if ( UGkpMainFrame.isMoving ) then
		UGkpMainFrame:StopMovingOrSizing();
		UGkpMainFrame.isMoving = false;
	end
end

function UGKPMain_OnMouseDown(button)
	if ( ( ( not UGkpMainFrame.isLocked ) or ( UGkpMainFrame.isLocked == 0 ) ) and ( arg1 == "LeftButton" ) ) then
		UGkpMainFrame:StartMoving();
		UGkpMainFrame.isMoving = true;
	end
end

function UGKPMain_OnHide()
	if ( UGkpMainFrame.isMoving ) then
		UGkpMainFrame:StopMovingOrSizing();
		UGkpMainFrame.isMoving = false;
	end
end

function UGKPMain_OnShow()
	if (firstShow) then
		UGKPMain_SelectTab(1);
		firstShow = false;
	end;
	getglobal("UGkpMainFrameTitle"):SetText(UGKP_TITLE.."V"..DkpVersion)
	
end

function UGKPMain_OnLoad()
	tinsert(UISpecialFrames,"UGkpMainFrame");
	--tinsert(UISpecialFrames,"Ugkp_ItemFrame");
	PanelTemplates_SetNumTabs(UGkpMainFrame, 2);
	--UGKPMain_SelectTab(1);
	PanelTemplates_SetTab(UGkpMainFrame, 1);
	
	
end

function UGKP_Toggle(page)
  if (UGkpMainFrame:IsVisible()) then
    UGkpMainFrame:Hide();
  else
    if(page)
    then
      firstShow = false;
      UGKPMain_SelectTab(page);
    end
    UGkpMainFrame:Show();
  end
end


-------- HELP ------
function UGKP_Help_SetTooltip()
	local uiX, uiY = UIParent:GetCenter();
	local thisX, thisY = this:GetCenter();

	local anchor = "";
	if ( thisY > uiY ) then
		anchor = "BOTTOM";
	else
		anchor = "TOP";
	end
	
	if ( thisX < uiX  ) then
		if ( anchor == "TOP" ) then
			anchor = "TOPLEFT";
		else
			anchor = "BOTTOMRIGHT";
		end
	else
		if ( anchor == "TOP" ) then
			anchor = "TOPRIGHT";
		else
			anchor = "BOTTOMLEFT";
		end
	end
	GameTooltip:SetOwner(this, "ANCHOR_" .. anchor);
end

function UGKP_Help_LoadText()
 local texts = {
    GEM_HELP_EVENTS_TAB_EVENTS,
    GEM_HELP_PLAYERS_TAB_MEMBERS,
    GEM_HELP_NEW_TAB_TEMPLATES,
    GEM_HELP_NEW_TAB_SORTING,
    GEM_HELP_NEW_TAB_CONFIG,
  };

  this.text = texts[this:GetID()];
end

function Ugkp_Debug(...)
	if ( Ugkp_DebugFlag ) then
		local sDebug = "#";
		for i = 1, select("#", ...), 1 do
			if ( select(i, ...) ) then
				sDebug = sDebug .. select(i, ...) .. "#";
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage(sDebug, 1, 0.5, 0);
	end
end

dkp_initialize = function()
		SlashCmdList["SHOW_GKP"] = ugkp_dkp_show;
		SLASH_SHOW_GKP1 = "/ugkp";
end;



function Ugkp_FixZero(num)
	if ( num < 10 ) then
		return "0" .. num;
	else
		return num;
	end
end

function Ugkp_Date()
	local t = date("*t");

	return strsub(t.year, 3).."-" ..Ugkp_FixZero(t.month) .. "-" .. Ugkp_FixZero(t.day) ..   " " .. Ugkp_FixZero(t.hour) .. ":" .. Ugkp_FixZero(t.min) .. ":" .. Ugkp_FixZero(t.sec);
end

function Ugkp_setButtonWidth(width,ele)
	ele:SetWidth(width);
	getglobal(ele:GetName().."Middle"):SetWidth(width - 4 - 4);
end