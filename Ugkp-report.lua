function ugkp_change_packet()
	if(ugkp_point<0) then
		UgkpRaidMessageBox(UGKP_ERROR_PACKET_TITLE);
		return;
	end

	if(ugkp_change_id=="1") then
		UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]=ugkp_point;
	end
	if(ugkp_change_id=="2") then
		UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]=ugkp_point;
	end
	if(ugkp_change_id=="3") then
		UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]=ugkp_point;
	end
	if(ugkp_change_id=="4") then
		UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]=ugkp_point;
	end

	getglobal("UgkpReportPacket1_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]);
	getglobal("UgkpReportPacket2_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]);
	getglobal("UgkpReportPacket3_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]);
	getglobal("UgkpReportPacket4_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]);


end

function ugkp_report_onshow()

	getglobal("UgkpReportPacket1_EditText"):SetText(0);
	getglobal("UgkpReportPacket2_EditText"):SetText(0);
	getglobal("UgkpReportPacket3_EditText"):SetText(0);
	getglobal("UgkpReportPacket4_EditText"):SetText(0);

	if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
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

		getglobal("UgkpReportPacket1_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]);
		getglobal("UgkpReportPacket2_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]);
		getglobal("UgkpReportPacket3_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]);
		getglobal("UgkpReportPacket4_EditText"):SetText(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]);

		incoin=0;
		outcoin=0;
		totalEvents=0;
		if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
			totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
		end
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
		local ugkp_sum=incoin+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]
		local ugkp_last=ugkp_sum - outcoin;


		getglobal("Ugkp_ReportFrameRevenue"):SetText(UGKP_HEAD_REPORT_REVENUE..":|cff1eff00"..ugkp_sum.."|r");
		getglobal("Ugkp_ReportFrameItem"):SetText(UGKP_HEAD_REPORT_ITEM..":|cff1eff00"..incoin.."|r");
		getglobal("Ugkp_ReportFrameSpend"):SetText(UGKP_HEAD_REPORT_SPEND..":|cffff0000"..outcoin.."|r");
		getglobal("Ugkp_ReportFrameLast"):SetText(UGKP_HEAD_REPORT_LAST..":|cff1eff00"..ugkp_last.."|r");
		getglobal("Ugkp_ReportFrameMember"):SetText(UGKP_HEAD_REPORT_MEMBER..":|cffffffff"..l.."|r");
	end
end


function ugkp_gen_report(report_type)
	if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
		local report_text="";
		incoin=0;
		outcoin=0;
		totalEvents=0;
		if(UGKP_PARTY_STUFF and getn(UGKP_PARTY_STUFF) > 0) then
			totalEvents = getn(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"]);
		end
		in_item_text="";
		out_item_text="";
		for i=1,totalEvents do
			e = UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["Events"][i];
			if(e["dkp"]<0 and e["type"]==3) then
				if(report_type==2) then
					in_item_text=in_item_text.."\n"..e["reason"].."-->"..e["players"][1].." "..e["dkp"]*(-1).."G";
				end
				incoin=incoin+e["dkp"]*(-1);
			else
				if(report_type==2) then
					out_item_text=out_item_text.."\n"..e["reason"].."->"..e["players"][1].." "..e["dkp"].."G";
				end
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
		local ugkp_sum=incoin+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]+UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]
		local ugkp_last=ugkp_sum - outcoin;

		report_text=UGKP_MESSAGE_TITLE_REPORT;
		report_text=report_text.."\n"..UGKP_HEAD_REPORT_REVENUE..":"..ugkp_sum.."G";
		report_text=report_text.."\n".."----------------------"
		report_text=report_text.."\n"..UGKP_HEAD_REPORT_ITEM..":"..incoin.."G";
		report_text=report_text.."\n"..in_item_text;

		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"]~=0) then
			report_text=report_text.."\n"..UGKP_HEAD_REPORT_PACKET.."一"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet1"].."G";
		end
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"]~=0) then
			report_text=report_text.."\n"..UGKP_HEAD_REPORT_PACKET.."二"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet2"].."G";
		end
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"]~=0) then
			report_text=report_text.."\n"..UGKP_HEAD_REPORT_PACKET.."三"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet3"].."G";
		end
		if(UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"]~=0) then
			report_text=report_text.."\n"..UGKP_HEAD_REPORT_PACKET.."四"..UGKP_PARTY_STUFF[UgkpRaid_GetCurrentRaid]["packet4"].."G";
		end
		report_text=report_text.."\n".."----------------------"
		report_text=report_text.."\n"..UGKP_HEAD_REPORT_SPEND..":"..outcoin.."G";
		report_text=report_text.."\n"..out_item_text;
		report_text=report_text.."\n".."----------------------"
		report_text=report_text.."\n"..UGKP_HEAD_REPORT_LAST..":"..ugkp_last.."G"
		report_text=report_text.."\n"..UGKP_HEAD_REPORT_MEMBER..":"..l
		if(UgkpOptions.CoinLevel==1) then
			report_text=report_text.."\n"..UGKP_HEAD_EVENT_TADV..":"..math.floor(ugkp_last/l).."G"
		else
			report_text=report_text.."\n"..UGKP_HEAD_EVENT_TADV..":"..(math.floor(ugkp_last/l*100)/100).."G"
		end
		getglobal("ugkp_ReportGenBodyEditBox"):SetText(report_text);
	end
end


function ugkp_send_report()

	s=getglobal("ugkp_ReportGenBodyEditBox"):GetText()
	pos=0;
	pos1=0;
	i=0;
	while(string.find(s,"\n",pos1)~=nil) do
		pos=string.find(s,"\n",pos1);
		s1=string.sub(s,pos1,pos-1)
		pos1=pos+1
		i=i+1;
		Ugkp_Debug(s1);
		sendMessge(s1);
	end
	Ugkp_Debug(string.sub(s,pos1));
	sendMessge(string.sub(s,pos1));
end
