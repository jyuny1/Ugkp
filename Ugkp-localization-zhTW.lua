local lang = GetLocale() -- Don't touch these two lines
if lang ~= "zhTW" then return end;

UGKP_TITLE = "渡邊G團分贓系統(由 Ugkp 修改)";
SLASH_COMMAND_STRING="/dobang"

UGKP_MINIMAP_TOOLTIP = "開啟/關閉渡邊G團分贓系統"
UGKP_TAB_RAID = "主頁";
UGKP_TAB_SIGNUP = "報名";
UGKP_TAB_SET = "設置";
UGKP_TAB_DEFAULT="參考"

UGKP_TAB_MEMBER = "成員";
UGKP_TAB_ITEM = "物品";
UGKP_TAB_GKP = "事件";
UGKP_TAB_CHANNEL = "分配";
UGKP_TAB_REPORT = "報表";
UGKP_TAB_PACKET = "打包";

UGKP_TAB_ITEM_ZR = "祖格";
UGKP_TAB_ITEM_HL = "黑龍";
UGKP_TAB_ITEM_FX = "廢墟";

UGKP_TEXT_RAID_LIST = "G團記錄";
UGKP_TEXT_RAID_HEADER = "G團訊息";

UGKP_HEAD_SELECT = "選擇";
UGKP_HEAD_UPDATE= "操作";

UGKP_MESSAGE_STATUS_CREATE="創建中,請保存";
UGKP_MESSAGE_STATUS_HAVECREATE="已保存，請點擊開始RAID"
UGKP_MESSAGE_STATUS_ACTIVE="進行中,結束後請點結束RAID";
UGKP_MESSAGE_STATUS_CLOSED="已結束,數據可修改";
UGKP_MESSAGE_STATUS_UPLOADED="已上傳，數據不可修改";

UGKP_MESSAGE_HOUR="小時";
UGKP_MESSAGE_MINUTE="分";
UGKP_MESSAGE_OFFLINE="離線";
UGKP_MESSAGE_COIN="金幣";


UGKP_HEAD_RAID_STATUS="狀態";
UGKP_HEAD_RAID_TIME = "G團日期";
UGKP_HEAD_RAID_MAP = "G團地圖";
UGKP_HEAD_RAID_NAME = "G團名稱";
UGKP_HEAD_RAID_LEADER = "G團隊長";
UGKP_HEAD_RAID_START = "開始時間";
UGKP_HEAD_RAID_END = "結束時間";
UGKP_HEAD_RAID_GNOTE = "G團通告";

UGKP_BUTTON_RAID_SAVE = "保存";
UGKP_BUTTON_RAID_START = "開始RAID";
UGKP_BUTTON_RAID_END = "結束RAID";


UGKP_HEAD_MEMBER_NAME = "姓名";
UGKP_HEAD_MEMBER_LEVEL = "級別";
UGKP_HEAD_MEMBER_CLASS = "職業";
UGKP_HEAD_MEMBER_MAP = "地圖";
UGKP_HEAD_MEMBER_JOINTIME = "加入";
UGKP_HEAD_MEMBER_LEFTTIME = "累計離線";
UGKP_HEAD_MEMBER_PGKP = "上次";
UGKP_HEAD_MEMBER_CGKP = "變化";
UGKP_HEAD_MEMBER_LGKP = "最後";
UGKP_HEAD_MEMBER_DETAIL = "詳細";

UGKP_BUTTON_MEMBER_ADDONLINE = "刪除離隊成員";
UGKP_BUTTON_MEMBER_ADDALL = "刪除離線成員";

UGKP_CHECKBOX_MEMBER_ONLINE = "所有在線";

UGKP_TOOLTIP_MEMBER_DELETE = "刪除此人";
UGKP_TOOLTIP_MEMBER_GKPCHANGE="補貼為正值，扣除為負數";
UGKP_TOOLTIP_MEMBER_EVENTLIST="查看此人事件列表";

UGKP_TOOLTIP_EVENT_CHANGE="修改變化金幣數";

UGKP_HEAD_ITEM_ICON = "圖標";
UGKP_HEAD_ITEM_NAME = "物品名稱";
UGKP_HEAD_ITEM_TOMEMBER = "拾取人";
UGKP_HEAD_ITEM_GKP = "拍買價格";
UGKP_HEAD_ITEM_RARE = "稀有度";
UGKP_HEAD_ITEM_SGKP = "數量";
UGKP_HEAD_ITEM_TIME="時間";

UGKP_CHECKBOX_ITEM_ALL="所有物品";
UGKP_BUTTON_ITEM_SAVE="保存";
UGKP_BUTTON_ITEM_DELETE="刪除物品";
UGKP_BUTTON_ITEMPACKET_SEND="發送打包物品";
UGKP_BUTTON_ITEMDETAIL_SEND="發送詳細物品";

UGKP_MESSAGE_ITEM_DELETE="確實要刪除此物品嗎?";
UGKP_HEAD_EVENT_NAME="說明";
UGKP_HEAD_EVENT_ITEM="物品";
UGKP_HEAD_EVENT_IN="收入";
UGKP_HEAD_EVENT_OUT="支出";
UGKP_HEAD_EVENT_MEMBER="成員";
UGKP_HEAD_EVENT_MEMBERLIST="列表";
UGKP_HEAD_MEMBER_PRECENT="百分比";
UGKP_HEAD_MEMBER_BRO="賒帳";

UGKP_HEAD_EVENT_TIN="總收入";
UGKP_HEAD_EVENT_TOUT="總支出";
UGKP_HEAD_EVENT_TADV="所有人平均";

FIVE_PERCENT_BONUS="5%紅利"

UGKP_CHECKBOX_EVENT_ALL="所有事件";
UGKP_BUTTON_EVENT_SAVE="保存";
UGKP_BUTTON_EVENT_DELETE="刪除事件";
UGKP_MESSAGE_EVENT_DELETE="確實要刪除此事件嗎?";
UGKP_TITLE_EVENT_MEMBERS="修改物品拾取人";
UGKP_TOOLTIP_EVENT_CHANGEMEMBER="修改事件影響的人員";

UGKP_BUTTON_RAID_ADD="新增";
UGKP_BUTTON_RAID_DELETE="刪除";

UGKP_HEAD_CHANNEL_CLASSGKP="向頻道廣播團隊中以下職業的GKP餘額";
UGKP_HEAD_CHANNEL_ALLGKP="向頻道中廣播本次RAID成員GKP變化";
UGKP_TOOLTIP_ITEM_CHANGEMEMBER="修改物品拾取人";
UGKP_BUTTON_GKP_SEND="發送";

UGKP_STRING_GKP_POINT="加減金幣數";
UGKP_STRING_GKP_DES="加減原因";
UGKP_BUTTON_GKP_ADD="確定";
UGKP_BUTTON_GKP_CANCEL="取消";

UGKP_MESSAGE_GKP_ISNULL="物品拍買價值必須錄入,且為數字";
UGKP_MESSAGE_GKP_SUBMONEY="扣錢必須為小於0的負數";
UGKP_MESSAGE_GKP_NOMEMBER="沒有要加的成員";
UGKP_STRING_GKP_NODES="無說明";

UGKP_TOOLTIP_ITEM_CHANGEGKP="設置物品拍買價格";
UGKP_STRING_ITEM_GET="拍賣物品";

UGKP_BUTTON_MEMBER_DELETE="刪除成員";
UGKP_MESSAGE_MEMBER_DELETE="刪除人員將不參加金幣的分配，確認刪除？";
UGKP_MESSAGE_MEMBER="打對勾的為要分金幣的成員：";
UGKP_MESSAGE_RAID="G團訊息：";
UGKP_MESSAGE_ITEM="物品訊息：";
UGKP_MESSAGE_EVENT="金幣收支表：";
UGKP_MESSAGE_CHANNEL="頻道訊息：";
UGKP_TITLE_COPYRIGHT="[渡邊G團：http://doban-g.wikidot.com]";

UGKP_MESSAGE_COIN_IN="收入金額：";
UGKP_MESSAGE_COIN_OUT="支出金額：";

UGKP_SEND_COIN_DETAIL="發送收支詳細";
UGKP_SEND_COIN_ONE="發送收支概要";

UgkpRaid_Class = {
  ["WARRIOR"] = "戰士",
  ["PALADIN"] = "聖騎士",
  ["SHAMAN"] = "薩滿",
  ["HUNTER"] = "獵人",
  ["ROGUE"] = "盜賊",
  ["DRUID"] = "德魯伊",
  ["WARLOCK"] = "術士",
  ["MAGE"] = "法師",
  ["PRIEST"] = "牧師",
  ["DEATHKNIGHT"] = "死亡騎士",
};

UgkpRaid_Race = {
  ["Dwarf"] = "矮人",
  ["Gnome"] = "地精",
  ["Human"] = "人類",
  ["NightElf"] = "夜精靈",
  ["Orc"] = "獸人",
  ["Tauren"] = "牛頭人",
  ["Troll"] = "食人妖",
  ["Scourge"] = "不死族",
  ["Draenei"] = "德萊尼",
  ["BloodElf"] = "血精靈",
};

UGKP_SET="Ugkp 設置";
UGKP_OPTION_FRAME_HEADER="顯示Ugkp圖標";
UGKP_ICON_POSITION="圖標位置";
UGKP_MAP = {
  "太陽井高地",
  "磨導師平台",
  "卡拉贊",
  "格魯爾的巢穴",
  "瑪瑟裡頓的巢穴",
  "毀滅領主卡扎克",
  "末日行者",
  "毒蛇神殿洞穴",
  "風暴之眼",
  "海加爾山",
  "黑暗神廟",
  "祖阿曼",
  "祖爾格拉布",
  "奧尼西亞洞穴",
  "熔火之心",
  "黑翼之巢",
  "安其拉 (廢墟)",
  "卡扎克",
  "藍龍",
  "安其拉 (神殿)",
  "強力風石",
  "翡翠四綠龍",
  "納克薩瑪斯",
  "永恆之眼",
  "黑曜聖所",
  "奧杜亞",
  "十字軍試煉",
  "冰冠城塞",
};

CT_ITEMREG = "(|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:(%-?%d+):(%-?%d+):%d+|h%[.-%]|h|r)%";
CT_ITEMREG_MULTI = "(|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:(%-?%d+):(%-?%d+):%d+|h%[.-%]|h|r)x(%d+)%";

UGKP_MESSAGE_MAX_RAID="最多可以建5個raid,請先刪除以前的raid";

UgkpRaid_lang_LeftGroup = "([^%s]+)離開了團隊";
UgkpRaid_lang_JoinedGroup = "([^%s]+)加入了團隊";
UgkpRaid_lang_ReceivesLoot1 = "([^%s]+)拾取了物品:"..CT_ITEMREG.."。";
UgkpRaid_lang_ReceivesLoot2 = "你拾取了物品:"..CT_ITEMREG.."。";
UgkpRaid_lang_ReceivesLoot3 = "([^%s]+)獲得戰利品:"..CT_ITEMREG_MULTI.."。";
UgkpRaid_lang_ReceivesLoot4 = "你獲得戰利品:"..CT_ITEMREG_MULTI.."。";

--[[
UgkpRaid_lang_ReceivesLoot1 = "([^%s]+)獲得戰利品:(.+)。";
UgkpRaid_lang_ReceivesLoot2 = "你獲得戰利品:(.+)。";

UgkpRaid_lang_ReceivesLoot3 = "([^%s]+)x([%d]+)。";
UgkpRaid_lang_ReceivesLoot4 = "([^%s]+)拾取了物品:(.+)。";
--]]
UgkpRaid_lang_ReceivesLootYou = "你";
UgkpRaid_lang_UnknownEntity = "未知目標";
UgkpRaid_lang_RequiresLevel = "需要等級";
UgkpRaid_lang_Equip = "裝備";
UgkpRaid_lang_Use = "使用";
UgkpRaid_lang_Chanceonhit = "擊中時可能";
UgkpRaid_lang_Durability = "持久";
UgkpRaid_lang_Classes = "職業";
UgkpRaid_lang_Madeby = "由(.+)製造";
UgkpRaid_lang_TwoHand = "雙手";
UgkpRaid_lang_OneHand = "單手";
UgkpRaid_lang_MainHand = "主手";
UgkpRaid_lang_OffHand = "副手";
UgkpRaid_lang_classArmor = {
  ["WORRIOR"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 1, ["鎧甲"] = 40 },
  ["DEATHKNIGHT"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 1, ["鎧甲"] = 40 },
  ["PALADIN"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 1, ["鎧甲"] = 40 },
  ["SHAMAN"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 40, ["鎧甲"] = 61 },
  ["HUNTER"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 40, ["鎧甲"] = 61 },
  ["ROGUE"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 61, ["鎧甲"] = 61 },
  ["DRUID"] = { ["布甲"] = 1, ["皮甲"] = 1, ["鎖甲"] = 61, ["鎧甲"] = 61 },
  ["WARLOCK"] = { ["布甲"] = 1, ["皮甲"] = 61, ["鎖甲"] = 61, ["鎧甲"] = 61 },
  ["MAGE"] = { ["布甲"] = 1, ["皮甲"] = 61, ["鎖甲"] = 61, ["鎧甲"] = 61 },
  ["PRIEST"] = { ["布甲"] = 1, ["皮甲"] = 61, ["鎖甲"] = 61, ["鎧甲"] = 61 }
};
UgkpRaid_lang_types = {
  ["頭部"] = 1,
  ["頸部"] = 1,
  ["肩部"] = 1,
  ["背部"] = 1,
  ["胸部"] = 1,
  ["襯衣"] = 1,
  ["公會徽章"] = 1,
  ["手腕"] = 1,
  ["雙手"] = 1,
  ["單手"] = 1,
  ["主手"] = 1,
  ["副手"] = 1,
  ["副手物品"] = 1,
  ["槍械"] = 1,
  ["弓"] = 1,
  ["弩"] = 1,
  ["魔杖"] = 1,
  ["彈藥"] = 1,
  ["投擲武器"] = 1,
  ["手"] = 1,
  ["腰部"] = 1,
  ["腿部"] = 1,
  ["腳"] = 1,
  ["手指"] = 1,
  ["飾品"] = 1
};
UgkpRaid_lang_special = {
  ["拳套"] = 1,
  ["匕首"] = 1,
  ["盾牌"] = 1,
  ["劍"] = 1,
  ["斧"] = 1,
  ["長柄武器"] = 1,
  ["錘"] = 1,
  ["法杖"] = 1
};
UgkpRaid_lang_ItemTextures = {
  ["頭部"] = "INV_Helmet_22",
  ["頸部"] = "INV_Jewelry_Necklace_11",
  ["肩部"] = "INV_Shoulder_23",
  ["背部"] = "INV_Misc_Cape_16",
  ["胸部"] = "INV_Chest_Chain_05",
  ["襯衣"] = "INV_Shirt_Black_01",
  ["盾牌"] = "INV_Shield_05",
  ["公會徽章"] = "INV_Misc_TabardPVP_04",
  ["手腕"] = "INV_Bracer_07",
  ["雙手-其他"] = "INV_Sword_39",
  ["雙手-劍"] = "INV_Sword_39",
  ["雙手-法杖"] = "INV_Staff_30",
  ["雙手-長柄武器"] = "INV_Spear_06",
  ["雙手-斧"] = "INV_Axe_09",
  ["雙手-錘"] = "INV_Hammer_04",
  ["背部"] = "INV_Misc_Cape_16",
  ["副手"] = "INV_Misc_Book_06",
  ["副手物品"] = "INV_Misc_Book_06",
  ["副手-其他"] = "INV_Misc_Wrench_01",
  ["槍械"] = "INV_Weapon_Rifle_01",
  ["弓"] = "INV_Weapon_Bow_01",
  ["弩"] = "INV_Weapon_Crossbow_01",
  ["斧"] = "INV_Axe_02",
  ["魔杖"] = "INV_Wand_02",
  ["彈藥"] = "INV_Ammo_Arrow_01",
  ["投擲武器"] = "INV_Spear_07",
  ["手"] = "INV_Gauntlets_16",
  ["腰部"] = "INV_Belt_02",
  ["腿部"] = "INV_Pants_11",
  ["腳"] = "INV_Boots_05",
  ["手指"] = "INV_Jewelry_Ring_30",
  ["飾品"] = "INV_Jewelry_Talisman_10",
  ["Other"] = "INV_Box_02",
  ["Special-劍"] = "INV_Sword_18",
  ["Special-匕首"] = "INV_Weapon_ShortBlade_11",
  ["Special-錘"] = "INV_Hammer_17",
  ["Special-拳套"] = "INV_Misc_MonsterClaw_04",
  ["Special-盾牌"] = "INV_Shield_05",
};


BINDING_HEADER_UGKP_TITLE = "ugkp 按鍵設置";
BINDING_NAME_UGKP_TOGGLE = "開啟/關閉 ugkp";
BINDING_NAME_UGKP_OPTIONS = "切換設置";
UGKP_SYSTEM_MESSAGE = "系統設置";
GGKP_TOOLTIP_MESSAGE = "設置Ugkp圖標和記錄物品的稀有程度";

SYSTEM_QUERY_GKP = "gkp";
UGKP_NOT_QUERY_DATA = "沒有查找到您的數據，您加入了Raid了嗎？";
UGKP_IF_QUERY_DATA = "您的Dkp值是";
WHO_GKP_Change_MESSAGE = "的本次RAID的GKP變化值是:";

WHO_GKP_MESSAGE = "的GKP餘額是:";

SEND_GKP_MESSGE_EVENT="事件：";
SEND_GKP_MESSGE_EVENT_CHANGE=",GKP變化:";

UGKP_MESSAGE_NO_MEMBER="沒有成員，你是否在一個RAID中";

UGKP_BUTTON_RAID_DELETE="刪除";
UGKP_MESSAGE_RAID_DELETE="確定要刪除選中的RAID嗎";
--UGKP_MESSAGE_DUNIU="由嘟牛遊戲網UGKP發佈";
UGKP_MESSAGE_TITLE_REPORT="本次渡邊 G 團消費報告"

UGKP_MESSAGE_GOLD="金幣";
UGKP_MESSAGE_SILVER="銀幣";
UGKP_MESSAGE_DLEVEL="分配時精確到";

UGKP_MESSAGE_CHANNEL="消息發送頻道";

UGKP_MESSAGE_CHANNEL_RAID="團隊";
UGKP_MESSAGE_CHANNEL_PARTY="小隊";
UGKP_MESSAGE_CHANNEL_GUILD="公會";
UGKP_MESSAGE_CHANNEL_SAY="說";

UGKP_MESSAGE_MEMBER_JOIN="參加分配";
UGKP_MESSAGE_LABEL_RULER="G團規則(可編輯)";
UGKP_BUTTON_SEND_RULER="發送";
UGKP_EDIT_MESSAGE_RULER=""
UGKP_TITLE_ITEM_DES="";

UGKP_SET_ITEM_PRICE="設置物品價格";
UGKP_MESSAGE_ITEM_PRICE="實拍價格";
UGKP_MEMBER_HEAD_DIS="分配";

UGKP_EDIT_MESSAGE_RULER1="";
UGKP_BUTTON_RAID_PUB="發佈";


UGKP_MESSAGE_ADDITEM="增加物品"

UGKP_HEAD_REPORT_REVENUE="總收入";
UGKP_HEAD_REPORT_ITEM="裝備拍買收入";
UGKP_HEAD_REPORT_PACKET="打包拍賣";
UGKP_HEAD_REPORT_PUNISHMENT="扣錢";
UGKP_HEAD_REPORT_LAST="最終分配";
UGKP_HEAD_REPORT_MEMBER="分配人數";

UGKP_HEAD_REPORT_SPEND="總花費";
UGKP_HEAD_REPORT_MT="MT人均修理費";
UGKP_HEAD_REPORT_OTHERSPEND="其它";
UGKP_TEXT_ITEMSET_HEADER="自動記錄的物品！"


UGKP_HEAD_PRECENT_TITLE="分配時所佔百分比";
UGKP_ERROR_PRECENT_TITLE="百分比必須大於0";

UGKP_HEAD_BRO_TITLE="預支金額";
UGKP_ERROR_BRO_TITLE="預支款必須為正值";

UGKP_HEAD_PACKET_TITLE="設置打包拍買物品的價格";
UGKP_HEAD_PACKET_LABEL="價格";
UGKP_ERROR_PACKET_TITLE="拍買的價格必須為正值";

UGKP_BUTTON_REPORT_GEN1="生成概要報表";
UGKP_BUTTON_REPORT_GEN2="生成詳細報表";
UGKP_BUTTON_REPORT_SEND="發送";

UGKP_BUTTON_SEND_MONEY="發送分配訊息";
UGKP_HEAD_UPDATE1="補/扣";

--Ugkp-item
UGKP_NO_ADD_ITEM = "沒有要增加的物品，按 shift+物品連結新增"
UGKP_NO_ITEM_LOOTER = "沒有選擇物品的拾取人"
UGKP_NO_ITEM_DELETE = "沒有選擇要刪除的物品"
UGKP_ITEM_DELETE_CONFIRM1 = "確認要刪除選擇的"
UGKP_ITEM_DELETE_CONFIRM2 = "件物品嗎？"
