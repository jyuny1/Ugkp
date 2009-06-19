
ugkp_item_selet_tab=1;
function UgkpOptions_OnLoad()
	UIPanelWindows['UgkpOptionsFrame'] = {area = 'center', pushable = 0};
end

function UgkpOptions_Init()
	UgkpOptionsFrameToggleButton:SetChecked(UgkpOptions.UgkpButtonShown);
	UgkpButtonPos:SetValue(UgkpOptions.UgkpButtonPosition);
end


function UgkpButton_OnClick()
	ugkp_dkp_show();
end

function UgkpButton_Init()
	if(UgkpOptions.UgkpButtonShown) then
		UgkpButtonFrame:Show();
	else
		UgkpButtonFrame:Hide();
	end
end

function UgkpButton_Toggle()
	if(UgkpButtonFrame:IsVisible()) then
		UgkpButtonFrame:Hide();
		UgkpOptions.UgkpButtonShown = false;
	else
		UgkpButtonFrame:Show();
		UgkpOptions.UgkpButtonShown = true;
	end
	UgkpOptions_Init();
end

function UgkpButton_UpdatePosition()
	UgkpButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (78 * cos(UgkpOptions.UgkpButtonPosition)),
		(78 * sin(UgkpOptions.UgkpButtonPosition)) - 55
	);
end


function Ugkp_BrowseDropDown_OnLoad()
	UIDropDownMenu_Initialize(this, Ugkp_BrowseDropDown_Initialize);
	if(UgkpOptions.ItemQuality) then
		UIDropDownMenu_SetSelectedValue(Ugkp_BrowseDropDown, UgkpOptions.ItemQuality);
	end
end


function Ugkp_BrowseDropDown_Initialize()
	info = {};
	info.text = ALL;
	info.value = -1;
	info.func = Ugkp_BrowseDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	for i=0, getn(ITEM_QUALITY_COLORS)  do
		info = {};
		info.text = getglobal("ITEM_QUALITY"..i.."_DESC");
		info.value = i;
		info.func = Ugkp_BrowseDropDown_OnClick;
		UIDropDownMenu_AddButton(info);
	end

end

function Ugkp_BrowseDropDown_OnClick()
	UIDropDownMenu_SetSelectedValue(Ugkp_BrowseDropDown, this.value);
	UgkpOptions.ItemQuality = this.value;
end

function Ugkp_CoinDropDown_OnLoad()
 	UIDropDownMenu_Initialize(this, Ugkp_Coin_Init);
	if(UgkpOptions.CoinLevel) then
		UIDropDownMenu_SetSelectedValue(this, UgkpOptions.CoinLevel);
	end
end

function Ugkp_Coin_Init()
	info = {};
	info.text = UGKP_MESSAGE_GOLD;
	info.value = 1;
	info.func = Ugkp_CoinDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = UGKP_MESSAGE_SILVER;
	info.value = 2;
	info.func = Ugkp_CoinDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
end

function Ugkp_CoinDropDown_OnClick()
	UIDropDownMenu_SetSelectedValue(Ugkp_CoinDropDown, this.value);
	UgkpOptions.CoinLevel = this.value;
end


function Ugkp_ChannelDropDown_OnLoad()
 	UIDropDownMenu_Initialize(this, Ugkp_Channel_Init);
	if(UgkpOptions.ChannelLevel) then
		UIDropDownMenu_SetSelectedValue(this, UgkpOptions.ChannelLevel);
	end
end

function Ugkp_Channel_Init()
	info = {};
	info.text = UGKP_MESSAGE_CHANNEL_RAID;
	info.value = "RAID";
	info.func = Ugkp_ChannelDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = UGKP_MESSAGE_CHANNEL_PARTY;
	info.value = "PARTY";
	info.func = Ugkp_ChannelDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = UGKP_MESSAGE_CHANNEL_GUILD;
	info.value = "GUILD";
	info.func = Ugkp_ChannelDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = UGKP_MESSAGE_CHANNEL_SAY;
	info.value = "SAY";
	info.func = Ugkp_ChannelDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
end

function Ugkp_ChannelDropDown_OnClick()
	UIDropDownMenu_SetSelectedValue(Ugkp_ChannelDropDown, this.value);
	UgkpOptions.ChannelLevel = this.value;
end

function UgkpSaveRuler()
	UgkpOptions.Ruler1=ugkp_rulerBodyEditBox:GetText();
end

function ugkpSendRuler()
	s=ugkp_rulerBodyEditBox:GetText();
	pos=0;
	pos1=0;
	i=0;
	while(string.find(s,"\n",pos1)~=nil) do
		pos=string.find(s,"\n",pos1);
		s1=string.sub(s,pos1,pos-2)
		--Ugkp_Debug(s1);
		--Ugkp_Debug("------------------");
		--SendChatMessage(s1, UgkpOptions.ChannelLevel,this.language, nil);
		sendMessge(s1);
		pos1=pos+1
		i=i+1;
		if(i>20) then break; end
	end
		Ugkp_Debug(string.sub(s,pos1));
		sendMessge(string.sub(s,pos1));
		
	--SendChatMessage(ugkp_rulerBodyEditBox:GetText(), UgkpOptions.ChannelLevel,this.language, nil);
	--SendChatMessage(""..UGKP_MESSAGE_DUNIU, UgkpOptions.ChannelLevel,this.language, nil);
end

function sendMessge(s)
	if(string.len(s)>254) then
		len=string.len(s);
		i=0;
		while(i<len) do
			SendChatMessage(string.sub(s,i,i+254), UgkpOptions.ChannelLevel,this.language, nil);
			i=i+254;
		end
	else
		SendChatMessage(s, UgkpOptions.ChannelLevel,this.language, nil);
	end
end

function Ugkp_Set_Onload()
	ugkp_rulerBodyEditBox:SetText(UgkpOptions.Ruler1);
	
	PanelTemplates_SetNumTabs(UgkpItemSetBorderFrame, 7);
	PanelTemplates_SetTab(UgkpItemSetBorderFrame, 1);
	
	
	
end

function Ugkp_Set_OnShow()
	UgkpItemSet_SelectTab(1);
end

function UgkpItemSet_SelectTab(tab)
	PanelTemplates_SetTab(UgkpItemSetBorderFrame, tab);
	local TabFrames = {
			[1] = "Ugkp_SetItemFrame",
			[2] = "Ugkp_SetItemFrame",
			[3] = "Ugkp_SetItemFrame",
			[4] = "Ugkp_SetItemFrame",
			[5] = "Ugkp_SetItemFrame",
			[6] = "Ugkp_SetItemFrame",
			[7] = "Ugkp_SetItemFrame",
		};
		ugkp_item_selet_tab=tab;
		
		getglobal("Ugkp_SetItemFrame"):Show();
		
		itemcount=getn(Ugkp_item_auction[tab]["itemnames"]);
		for cout=1,33,1 do
			getglobal("Ugkp_SetItemFrameItemNameButton"..cout):Hide();
		end
		for j=1,itemcount,1 do
			getglobal("Ugkp_SetItemFrameItemNameButton"..j.."Text"):SetText(Ugkp_item_auction[tab]["itemnames"][j]["itemname"]);
		
			getglobal("Ugkp_SetItemFrameItemNameButton"..j):SetChecked(Ugkp_item_auction[tab]["itemnames"][j]["checked"])
		
			getglobal("Ugkp_SetItemFrameItemNameButton"..j):Show();
		end

	
end