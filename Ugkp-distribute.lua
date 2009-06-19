function Ugkp_UpdateDistribute()
  totalEvents=0;
  totalMember=0;
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
    totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
    totalMember = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
    for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
      getglobal("UgkpEventFrameListButton"..i):Hide();
    end
    for i=1,52 do
      getglobal("UgkpMemberCoinButton"..i.."Check"):Hide();
      getglobal("UgkpMemberCoinButton"..i.."Button"):Hide();
    end
  else
    for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
      getglobal("UgkpEventFrameListButton"..i):Hide();
    end

    for i=1,52 do
      getglobal("UgkpMemberCoinButton"..i.."Check"):Hide();
      getglobal("UgkpMemberCoinButton"..i.."Button"):Hide();
    end

    FauxScrollFrame_Update(UgkpListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
    return;
  end
  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]==nil) then
    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]=0;
  end
  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]==nil) then
    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]=0;
  end
  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]==nil) then
    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]=0;
  end
  if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]==nil) then
    UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]=0;
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
  dmember=0
  for i=1,totalMember do

    if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
      dmember=dmember+1;
    end
  end
  incoin=incoin+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"];
  local totalprecent=0
  for i=1,totalMember do
    mem=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i];
    if(mem["precent"]==nil) then
      mem["precent"]=100;
    end
    if(mem["bro"]==nil) then
      mem["bro"]=0;
    end
    if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
      totalprecent=totalprecent+mem["precent"]
    end
  end
  --if(UgkpOptions.CoinLevel==1) then
  --	everycoin=math.floor((incoin-outcoin)/totalprecent);
  --else
  --	everycoin=math.floor((incoin-outcoin)/totalprecent*100)/100;
  --end

  l=0;

  for i=1,totalMember do

    if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
      l=l+1;
      eventcoin=0;
      mem=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i];
      for j=1,totalEvents do
	totaleventPlayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["players"]);
	for k=totaleventPlayers,1,-1 do
	  if(mem["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["players"][k] and UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["itemid"]=="")then
	    eventcoin=eventcoin+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["dkp"];
	    break;
	  end
	end
      end
      if(l>52) then break;end
      getglobal("UgkpMemberCoinButton"..l.."Check"):Show();
      getglobal("UgkpMemberCoinButton"..l.."Button"):Show();

      --if(eventcoin~=0) then
      --	getglobal("UgkpMemberCoinButton"..l.."ButtonName"):SetText("|cffff0000"..mem["player"].."|r");
      --	getglobal("UgkpMemberCoinButton"..l.."ButtonCoin"):SetText("|cffff0000"..everycoin+eventcoin.."|r");
      --else
      if(UgkpOptions.CoinLevel==1) then
	everycoin=math.floor((incoin-outcoin)*mem["precent"]/totalprecent);
	getglobal("UgkpMemberCoinButton"..l.."ButtonName"):SetText(mem["player"]);
	getglobal("UgkpMemberCoinButton"..l.."ButtonCoin"):SetText(everycoin+eventcoin-mem["bro"]);
      else
	everycoin=math.floor((incoin-outcoin)*mem["precent"]/totalprecent*100)/100;
	getglobal("UgkpMemberCoinButton"..l.."ButtonName"):SetText(mem["player"]);
	getglobal("UgkpMemberCoinButton"..l.."ButtonCoin"):SetText(everycoin+eventcoin-mem["bro"]);
      end

      --end

    end
  end


  if(UgkpOptions.CoinLevel==1) then
    getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_EVENT..UGKP_MESSAGE_COIN_IN.."|cff1eff00"..incoin.."|r     "..UGKP_MESSAGE_COIN_OUT.."|cffff0000"..outcoin.."|r "..UGKP_MESSAGE_MEMBER_JOIN..": ".. l .."    "..UGKP_HEAD_EVENT_TADV..": "..math.floor((incoin-outcoin)/l));
    --ugkp_say_message=ugkp_say_message..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/totalMember)..UGKP_MESSAGE_GOLD;
  else
    getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_EVENT..UGKP_MESSAGE_COIN_IN.."|cff1eff00"..incoin.."|r     "..UGKP_MESSAGE_COIN_OUT.."|cffff0000"..outcoin.."|r "..UGKP_MESSAGE_MEMBER_JOIN..": ".. l .."    "..UGKP_HEAD_EVENT_TADV..": "..math.floor((incoin-outcoin)/l*100)/100);
    --ugkp_say_message=ugkp_say_message..UGKP_HEAD_EVENT_TADV ..math.floor((incoin-outcoin)/totalMember*100)/100 ..UGKP_MESSAGE_GOLD;
  end

  --getglobal("UgkpRaidHeaderString"):SetText(UGKP_MESSAGE_EVENT..UGKP_MESSAGE_COIN_IN.."|cff1eff00"..incoin.."|r     "..UGKP_MESSAGE_COIN_OUT.."|cffff0000"..outcoin.."|r");
end

function Ugkp_Send_Member_Money()

  totalEvents=0;
  totalMember=0;
  if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
    totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
    totalMember = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"]);
    for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
      getglobal("UgkpEventFrameListButton"..i):Hide();
    end
    for i=1,52 do
      getglobal("UgkpMemberCoinButton"..i.."Check"):Hide();
      getglobal("UgkpMemberCoinButton"..i.."Button"):Hide();
    end
  else
    for i=1, UGKP_NUM_BIDS_TO_DISPLAY  do
      getglobal("UgkpEventFrameListButton"..i):Hide();
    end

    for i=1,52 do
      getglobal("UgkpMemberCoinButton"..i.."Check"):Hide();
      getglobal("UgkpMemberCoinButton"..i.."Button"):Hide();
    end

    FauxScrollFrame_Update(UgkpListScrollFrame,0 ,UGKP_NUM_BIDS_TO_DISPLAY,UGKP_BUTTON_HEIGHT);
    return;
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
  dmember=0
  for i=1,totalMember do

    if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
      dmember=dmember+1;
    end
  end
  incoin=incoin+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"];
  local totalprecent=0
  for i=1,totalMember do
    mem=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i];
    if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
      totalprecent=totalprecent+mem["precent"];
    end
  end
  --if(UgkpOptions.CoinLevel==1) then
  --	everycoin=math.floor((incoin-outcoin)/totalprecent);
  --else
  --	everycoin=math.floor((incoin-outcoin)/totalprecent*100)/100;
  --end

  l=0;
  sendmessage="";
  for i=1,totalMember do

    if( (not UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]) or UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i]["ischeck"]=="1") then
      l=l+1;
      eventcoin=0;
      mem=UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Members"][i];
      for j=1,totalEvents do
	totaleventPlayers=getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["players"]);
	for k=totaleventPlayers,1,-1 do
	  if(mem["player"]==UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["players"][k] and UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["itemid"]=="")then
	    eventcoin=eventcoin+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][j]["dkp"];
	    break;
	  end
	end
      end
      if(l>52) then break;end
      getglobal("UgkpMemberCoinButton"..l.."Check"):Show();
      getglobal("UgkpMemberCoinButton"..l.."Button"):Show();

      --if(eventcoin~=0) then
      --	getglobal("UgkpMemberCoinButton"..l.."ButtonName"):SetText("|cffff0000"..mem["player"].."|r");
      --	getglobal("UgkpMemberCoinButton"..l.."ButtonCoin"):SetText("|cffff0000"..everycoin+eventcoin.."|r");
      --else
      if(UgkpOptions.CoinLevel==1) then
	everycoin=math.floor((incoin-outcoin)*mem["precent"]/totalprecent);
	--SendChatMessage(ugkp_say_message, UgkpOptions.ChannelLevel,this.language, nil);
	if(math.fmod(i,2)==0) then
	  if(mem["precent"]~=100) then
	    sendmessage=sendmessage..mem["player"].."("..mem["precent"].."%) "..(everycoin+eventcoin-mem["bro"])..";";
	  else
	    sendmessage=sendmessage..mem["player"]..","..(everycoin+eventcoin-mem["bro"])..";";
	  end
	  SendChatMessage(sendmessage,UgkpOptions.ChannelLevel, this.language, nil);
	  sendmessage="";
	else
	  if(mem["precent"]~=100) then
	    sendmessage=sendmessage..mem["player"].."("..mem["precent"].."%) "..(everycoin+eventcoin-mem["bro"])..";"
	  else
	    sendmessage=sendmessage..mem["player"]..","..(everycoin+eventcoin-mem["bro"])..";"
	  end
	end
	--getglobal("UgkpMemberCoinButton"..l.."ButtonName"):SetText(mem["player"]);
	--getglobal("UgkpMemberCoinButton"..l.."ButtonCoin"):SetText(everycoin+eventcoin-mem["bro"]);
      else
	everycoin=math.floor((incoin-outcoin)*mem["precent"]/totalprecent*100)/100;

	if(ugkp_mod(i,2)==0) then
	  if(mem["precent"]~=100) then
	    sendmessage=sendmessage..mem["player"].."("..mem["precent"].."%) "..(everycoin+eventcoin-mem["bro"]).."G;";
	  else
	    sendmessage=sendmessage..mem["player"]..","..(everycoin+eventcoin-mem["bro"]).."G;";
	  end
	  Ugkp_Debug(sendmessage);
	  SendChatMessage(sendmessage,UgkpOptions.ChannelLevel, this.language, nil);
	  sendmessage="";
	else

	  if(mem["precent"]~=100) then
	    sendmessage=sendmessage..mem["player"].."("..mem["precent"].."%) "..(everycoin+eventcoin-mem["bro"]).."G;"
	  else
	    sendmessage=sendmessage..mem["player"]..","..(everycoin+eventcoin-mem["bro"]).."G;"
	  end
	end
	--getglobal("UgkpMemberCoinButton"..l.."ButtonName"):SetText(mem["player"]);
	--getglobal("UgkpMemberCoinButton"..l.."ButtonCoin"):SetText(everycoin+eventcoin-mem["bro"]);
      end

      --end

    end
  end
  if(sendmessage~="") then

    SendChatMessage(sendmessage,UgkpOptions.ChannelLevel, this.language, nil);
  end

end
