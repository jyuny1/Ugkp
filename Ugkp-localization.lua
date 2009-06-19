local lang = GetLocale() -- Don't touch these two lines
if lang ~= "zhCN" then return end

--UGKP_TITLE = "嘟牛 GKP 系统";
UGKP_TITLE = "嘟牛UGKP插件";

UGKP_TAB_RAID = "G团";
UGKP_TAB_SIGNUP = "报名";
UGKP_TAB_SET = "设置";
UGKP_TAB_DEFAULT="参考"

UGKP_TAB_MEMBER = "成员";
UGKP_TAB_ITEM = "物品";
UGKP_TAB_GKP = "事件";
UGKP_TAB_CHANNEL = "分配";
UGKP_TAB_REPORT = "报表";
UGKP_TAB_PACKET = "打包";

UGKP_TAB_ITEM_ZR = "祖格";
UGKP_TAB_ITEM_HL = "黑龙";
UGKP_TAB_ITEM_FX = "废墟";

UGKP_TEXT_RAID_LIST = "G团列表";
UGKP_TEXT_RAID_HEADER = "G团信息";

UGKP_HEAD_SELECT = "选择";
UGKP_HEAD_UPDATE= "操作";

UGKP_MESSAGE_STATUS_CREATE="创建中,请保存";
UGKP_MESSAGE_STATUS_HAVECREATE="已保存，请点击开始RAID"
UGKP_MESSAGE_STATUS_ACTIVE="进行中,结束后请点结束RAID";
UGKP_MESSAGE_STATUS_CLOSED="已结束,数据可修改";
UGKP_MESSAGE_STATUS_UPLOADED="已上传，数据不可修改";

UGKP_MESSAGE_HOUR="小时";
UGKP_MESSAGE_MINUTE="分";
UGKP_MESSAGE_OFFLINE="离线";
UGKP_MESSAGE_COIN="金币";


UGKP_HEAD_RAID_STATUS="状态";
UGKP_HEAD_RAID_TIME = "G团日期";
UGKP_HEAD_RAID_MAP = "G团地图";
UGKP_HEAD_RAID_NAME = "G团名称";
UGKP_HEAD_RAID_LEADER = "G团队长";
UGKP_HEAD_RAID_START = "开始时间";
UGKP_HEAD_RAID_END = "结束时间";
UGKP_HEAD_RAID_GNOTE = "G团通告";

UGKP_BUTTON_RAID_SAVE = "保存";
UGKP_BUTTON_RAID_START = "开始RAID";
UGKP_BUTTON_RAID_END = "结束RAID";


UGKP_HEAD_MEMBER_NAME = "姓名";
UGKP_HEAD_MEMBER_LEVEL = "级别";
UGKP_HEAD_MEMBER_CLASS = "职业";
UGKP_HEAD_MEMBER_MAP = "地图";
UGKP_HEAD_MEMBER_JOINTIME = "加入";
UGKP_HEAD_MEMBER_LEFTTIME = "累计离线";
UGKP_HEAD_MEMBER_PGKP = "上次";
UGKP_HEAD_MEMBER_CGKP = "变化";
UGKP_HEAD_MEMBER_LGKP = "最后";
UGKP_HEAD_MEMBER_DETAIL = "详细";

UGKP_BUTTON_MEMBER_ADDONLINE = "删除离队成员";
UGKP_BUTTON_MEMBER_ADDALL = "删除离线成员";

UGKP_CHECKBOX_MEMBER_ONLINE = "所有在线";

UGKP_TOOLTIP_MEMBER_DELETE = "删除此人";
UGKP_TOOLTIP_MEMBER_GKPCHANGE="补贴为正数，扣除为负数";
UGKP_TOOLTIP_MEMBER_EVENTLIST="查看此人事件列表";

UGKP_TOOLTIP_EVENT_CHANGE="修改变化金币数";

UGKP_HEAD_ITEM_ICON = "图标";
UGKP_HEAD_ITEM_NAME = "物品名称";
UGKP_HEAD_ITEM_TOMEMBER = "拾取人";
UGKP_HEAD_ITEM_GKP = "拍买价格";
UGKP_HEAD_ITEM_RARE = "稀有度";
UGKP_HEAD_ITEM_SGKP = "数量";
UGKP_HEAD_ITEM_TIME="时间";

UGKP_CHECKBOX_ITEM_ALL="所有物品";
UGKP_BUTTON_ITEM_SAVE="保存";
UGKP_BUTTON_ITEM_DELETE="删除物品";
UGKP_BUTTON_ITEMPACKET_SEND="发送打包物品";
UGKP_BUTTON_ITEMDETAIL_SEND="发送详细物品";

UGKP_MESSAGE_ITEM_DELETE="确实要删除此物品吗?";
UGKP_HEAD_EVENT_NAME="说明";
UGKP_HEAD_EVENT_ITEM="物品";
UGKP_HEAD_EVENT_IN="收入";
UGKP_HEAD_EVENT_OUT="支出";
UGKP_HEAD_EVENT_MEMBER="成员";
UGKP_HEAD_EVENT_MEMBERLIST="列表";
UGKP_HEAD_MEMBER_PRECENT="百分比";
UGKP_HEAD_MEMBER_BRO="赊帐";

UGKP_HEAD_EVENT_TIN="总收入";
UGKP_HEAD_EVENT_TOUT="总支出";
UGKP_HEAD_EVENT_TADV="人均";

UGKP_CHECKBOX_EVENT_ALL="所有事件";
UGKP_BUTTON_EVENT_SAVE="保存";
UGKP_BUTTON_EVENT_DELETE="删除事件";
UGKP_MESSAGE_EVENT_DELETE="确实要删除此事件吗?";
UGKP_TITLE_EVENT_MEMBERS="修改物品拾取人";
UGKP_TOOLTIP_EVENT_CHANGEMEMBER="修改事件影响的人员";

UGKP_BUTTON_RAID_ADD="新增";
UGKP_BUTTON_RAID_DELETE="删除";

UGKP_HEAD_CHANNEL_CLASSGKP="向频道广播团队中以下职业的GKP余额";
UGKP_HEAD_CHANNEL_ALLGKP="向频道中广播本次RAID成员GKP变化";
UGKP_TOOLTIP_ITEM_CHANGEMEMBER="修改物品拾取人";
UGKP_BUTTON_GKP_SEND="发送";

UGKP_STRING_GKP_POINT="加减金币数";
UGKP_STRING_GKP_DES="加减原因";
UGKP_BUTTON_GKP_ADD="确定";
UGKP_BUTTON_GKP_CANCEL="取消";

UGKP_MESSAGE_GKP_ISNULL="物品拍买价值必须录入,且为数字";
UGKP_MESSAGE_GKP_SUBMONEY="扣钱必须为小于0的负数";
UGKP_MESSAGE_GKP_NOMEMBER="没有要加的成员";
UGKP_STRING_GKP_NODES="无说明";

UGKP_TOOLTIP_ITEM_CHANGEGKP="设置物品拍买价格";
UGKP_STRING_ITEM_GET="拍卖物品";

UGKP_BUTTON_MEMBER_DELETE="删除成员";
UGKP_MESSAGE_MEMBER_DELETE="删除人员将不参加金币的分配，确认删除？";
UGKP_MESSAGE_MEMBER="打对勾的为要分金币的成员：";
UGKP_MESSAGE_RAID="G团信息：";
UGKP_MESSAGE_ITEM="物品信息：";
UGKP_MESSAGE_EVENT="金币收支表：";
UGKP_MESSAGE_CHANNEL="频道信息：";
UGKP_TITLE_COPYRIGHT="[嘟牛游戏网:www.duniu.com]";

UGKP_MESSAGE_COIN_IN="收入金额：";
UGKP_MESSAGE_COIN_OUT="支出金额：";

UGKP_SEND_COIN_DETAIL="发送收支详细";
UGKP_SEND_COIN_ONE="发送收支概要";

UgkpRaid_Class = {
	["WARRIOR"] = "战士",
	["PALADIN"] = "圣骑士",
	["SHAMAN"] = "萨满祭司",
	["HUNTER"] = "猎人",
	["ROGUE"] = "潜行者",
	["DRUID"] = "德鲁伊",
	["WARLOCK"] = "术士",
	["MAGE"] = "法师",
	["PRIEST"] = "牧师"
};

UgkpRaid_Race = {
	["Dwarf"] = "矮人",
	["Gnome"] = "侏儒",
	["Human"] = "人类",
	["NightElf"] = "暗夜精灵",
	["Orc"] = "兽人",
	["Tauren"] = "牛头人",
	["Troll"] = "巨魔",
	["Scourge"] = "亡灵",
	["Draenei"] = "德莱尼",
	["BloodElf"] = "血精灵"
};

UGKP_SET="Ugkp 设置";
UGKP_OPTION_FRAME_HEADER="显示Ugkp图标";
UGKP_ICON_POSITION="图标位置";
UGKP_MAP = {
		  "太阳井高地",
		  "磨导师平台",
		  "卡拉赞",
          "格鲁尔的巢穴",
          "玛瑟里顿的巢穴",
          "毁灭领主卡扎克",
          "末日行者",
          "毒蛇神殿洞穴",
          "风暴之眼",
          "海加尔山",
          "黑暗神庙",
          "祖阿曼",
          "祖尔格拉布",
          "奥尼西亚洞穴",
          "熔火之心",
          "黑翼之巢",
          "安其拉 (废墟)",
          "卡扎克",
          "蓝龙",
          "安其拉 (神殿)",
          "强力风石",
          "翡翠四绿龙",
          "纳克萨玛斯"

  };

UGKP_MESSAGE_MAX_RAID="最多可以建5个raid,请先删除以前的raid";

UgkpRaid_lang_LeftGroup = "([^%s]+)离开了团队";
UgkpRaid_lang_JoinedGroup = "([^%s]+)加入了团队";
UgkpRaid_lang_ReceivesLoot1 = "([^%s]+)获得了物品：(.+)。";
UgkpRaid_lang_ReceivesLoot2 = "你获得了物品：(.+)";

UgkpRaid_lang_ReceivesLoot3 = "([^%s]+)x(.+)。";
UgkpRaid_lang_ReceivesLoot4 = "([^%s]+)得到了物品：(.+)x";

UgkpRaid_lang_ReceivesLootYou = "你";
UgkpRaid_lang_UnknownEntity = "未知目标";
UgkpRaid_lang_RequiresLevel = "需要等级";
UgkpRaid_lang_Equip = "装备";
UgkpRaid_lang_Use = "使用";
UgkpRaid_lang_Chanceonhit = "击中时可能";
UgkpRaid_lang_Durability = "持久";
UgkpRaid_lang_Classes = "职业";
UgkpRaid_lang_Madeby = "由(.+)制造";
UgkpRaid_lang_TwoHand = "双手";
UgkpRaid_lang_OneHand = "单手";
UgkpRaid_lang_MainHand = "主手";
UgkpRaid_lang_OffHand = "副手";
UgkpRaid_lang_classArmor = {
	["战士"] = { ["布甲"] = 1, ["皮甲"] = 1, ["锁甲"] = 1, ["板甲"] = 40 },
	["圣骑士"] = { ["布甲"] = 1, ["皮甲"] = 1, ["锁甲"] = 1, ["板甲"] = 40 },
	["萨满祭司"] = { ["布甲"] = 1, ["皮甲"] = 1, ["锁甲"] = 40, ["板甲"] = 61 },
	["猎人"] = { ["布甲"] = 1, ["皮甲"] = 1, ["锁甲"] = 40, ["板甲"] = 61 },
	["盗贼"] = { ["布甲"] = 1, ["皮甲"] = 1, ["锁甲"] = 61, ["板甲"] = 61 },
	["德鲁伊"] = { ["布甲"] = 1, ["皮甲"] = 1, ["锁甲"] = 61, ["板甲"] = 61 },
	["术士"] = { ["布甲"] = 1, ["皮甲"] = 61, ["锁甲"] = 61, ["板甲"] = 61 },
	["法师"] = { ["布甲"] = 1, ["皮甲"] = 61, ["锁甲"] = 61, ["板甲"] = 61 },
	["牧师"] = { ["布甲"] = 1, ["皮甲"] = 61, ["锁甲"] = 61, ["板甲"] = 61 }
};
UgkpRaid_lang_types = {
	["头部"] = 1,
	["颈部"] = 1,
	["肩部"] = 1,
	["背部"] = 1,
	["胸部"] = 1,
	["衬衣"] = 1,
	["公会徽章"] = 1,
	["手腕"] = 1,
	["双手"] = 1,
	["单手"] = 1,
	["主手"] = 1,
	["副手"] = 1,
	["副手物品"] = 1,
	["枪械"] = 1,
	["弓"] = 1,
	["弩"] = 1,
	["魔杖"] = 1,
	["弹药"] = 1,
	["投掷武器"] = 1,
	["手"] = 1,
	["腰部"] = 1,
	["腿部"] = 1,
	["脚"] = 1,
	["手指"] = 1,
	["饰品"] = 1
};
UgkpRaid_lang_special = {
	["拳套"] = 1,
	["匕首"] = 1,
	["盾牌"] = 1,
	["剑"] = 1,
	["斧"] = 1,
	["长柄武器"] = 1,
	["锤"] = 1,
	["法杖"] = 1
};
UgkpRaid_lang_ItemTextures = {
	["头部"] = "INV_Helmet_22",
	["颈部"] = "INV_Jewelry_Necklace_11",
	["肩部"] = "INV_Shoulder_23",
	["背部"] = "INV_Misc_Cape_16",
	["胸部"] = "INV_Chest_Chain_05",
	["衬衣"] = "INV_Shirt_Black_01",
	["盾牌"] = "INV_Shield_05",
	["公会徽章"] = "INV_Misc_TabardPVP_04",
	["手腕"] = "INV_Bracer_07",
	["双手-其他"] = "INV_Sword_39",
	["双手-剑"] = "INV_Sword_39",
	["双手-法杖"] = "INV_Staff_30",
	["双手-长柄武器"] = "INV_Spear_06",
	["双手-斧"] = "INV_Axe_09",
	["双手-锤"] = "INV_Hammer_04",
	["背部"] = "INV_Misc_Cape_16",
	["副手"] = "INV_Misc_Book_06",
	["副手物品"] = "INV_Misc_Book_06",
	["副手-其他"] = "INV_Misc_Wrench_01",
	["枪械"] = "INV_Weapon_Rifle_01",
	["弓"] = "INV_Weapon_Bow_01",
	["弩"] = "INV_Weapon_Crossbow_01",
	["斧"] = "INV_Axe_02",
	["魔杖"] = "INV_Wand_02",
	["弹药"] = "INV_Ammo_Arrow_01",
	["投掷武器"] = "INV_Spear_07",
	["手"] = "INV_Gauntlets_16",
	["腰部"] = "INV_Belt_02",
	["腿部"] = "INV_Pants_11",
	["脚"] = "INV_Boots_05",
	["手指"] = "INV_Jewelry_Ring_30",
	["饰品"] = "INV_Jewelry_Talisman_10",
	["Other"] = "INV_Box_02",
	["Special-剑"] = "INV_Sword_18",
	["Special-匕首"] = "INV_Weapon_ShortBlade_11",
	["Special-锤"] = "INV_Hammer_17",
	["Special-拳套"] = "INV_Misc_MonsterClaw_04",
	["Special-盾牌"] = "INV_Shield_05",
};


BINDING_HEADER_UGKP_TITLE = "ugkp 按键设置";
BINDING_NAME_UGKP_TOGGLE = "开启/关闭 ugkp";
BINDING_NAME_UGKP_OPTIONS = "切换设置";
UGKP_SYSTEM_MESSAGE = "系统设置";
GGKP_TOOLTIP_MESSAGE = "设置Ugkp图标和记录物品的稀有程度";

SYSTEM_QUERY_GKP = "gkp";
UGKP_NOT_QUERY_DATA = "没有查找到您的数据，您加入了Raid了吗？";
UGKP_IF_QUERY_DATA = "您的Dkp值是";
WHO_GKP_Change_MESSAGE = "的本次RAID的GKP变化值是:";

WHO_GKP_MESSAGE = "的GKP余额是:";

SEND_GKP_MESSGE_EVENT="事件：";
SEND_GKP_MESSGE_EVENT_CHANGE=",GKP变化:";

UGKP_MESSAGE_NO_MEMBER="没有成员，你是否在一个RAID中";

UGKP_BUTTON_RAID_DELETE="删除";
UGKP_MESSAGE_RAID_DELETE="确定要删除选中的RAID吗";
UGKP_MESSAGE_DUNIU="由嘟牛游戏网UGKP发布";
UGKP_MESSAGE_TITLE_REPORT="本次G团报表"

UGKP_MESSAGE_GOLD="金币";
UGKP_MESSAGE_SILVER="银币";
UGKP_MESSAGE_DLEVEL="分配时精确到";

UGKP_MESSAGE_CHANNEL="消息发送频道";

UGKP_MESSAGE_CHANNEL_RAID="团队";
UGKP_MESSAGE_CHANNEL_PARTY="小队";
UGKP_MESSAGE_CHANNEL_GUILD="公会";
UGKP_MESSAGE_CHANNEL_SAY="说";

UGKP_MESSAGE_MEMBER_JOIN="参加分配";
UGKP_MESSAGE_LABEL_RULER="本G团规则(可编辑)";
UGKP_BUTTON_SEND_RULER="发送";
UGKP_EDIT_MESSAGE_RULER="1为避免不必要的麻烦，本G团初步规则，如有异议可以提出或直接退团:\n1.本团原则上采用蓝件(含)以上由队长分配模式，蓝色物品均20G起，紫色50G起(任务物品流标则不拾取)；\n2.拍卖时最少5G或10G一次跳价，请准确把握好自己的心理价位，倒计时3次后生效；\n3.血藤、灵魂宝钻、人偶、大块黑石碎片、圣甲虫箱钥匙，拾取后请主动交于RL待事后拍卖，否则不得参与最后金额分配;\n4.流拍则减半再拍,最终蓝装如果低于10G，紫装低于20G起价，则件由指定附魔人员分解魔光后交于RL;\n5.战斗中不许采药、挖矿、开骨头堆，如有发现，不得参与当前所以金额分配;\n6.非全团1/4人员以上提议解散前任何理由离团不得参与最后分配，不得代领；\n7.跟随或长时间AFK被举报者不参与当前分配，掉线超过30分钟者直接踢出团不得参与任何分配；\n8.引起共愤者经全团半数投票同意后直接踢出团不得参与分配，中途替补加入者同样获得全程最后分配，提前退团者不参与分配；9.最后所得金额扣除15G作为MT修理费补偿,5G作为RL补贴；请仔细阅读以上规则，欢迎相互监督，提高G团效率，希望大家有一个愉快的G团旅程!";
UGKP_TITLE_ITEM_DES="";

UGKP_SET_ITEM_PRICE="设置物品价格";
UGKP_MESSAGE_ITEM_PRICE="实拍价格";
UGKP_MEMBER_HEAD_DIS="分配";

UGKP_EDIT_MESSAGE_RULER1="UT号是: 密码";
UGKP_BUTTON_RAID_PUB="发布";


UGKP_MESSAGE_ADDITEM="增加物品"

UGKP_HEAD_REPORT_REVENUE="总收入";
UGKP_HEAD_REPORT_ITEM="装备拍买";
UGKP_HEAD_REPORT_PACKET="打包拍卖";
UGKP_HEAD_REPORT_PUNISHMENT="扣钱";
UGKP_HEAD_REPORT_LAST="最终分配";
UGKP_HEAD_REPORT_MEMBER="分配人数";

UGKP_HEAD_REPORT_SPEND="总花费";
UGKP_HEAD_REPORT_MT="MT人均修理费";
UGKP_HEAD_REPORT_OTHERSPEND="其它";
UGKP_TEXT_ITEMSET_HEADER="自动记录的物品！"


UGKP_HEAD_PRECENT_TITLE="分配时所占百分比";
UGKP_ERROR_PRECENT_TITLE="百分比必须大于0";

UGKP_HEAD_BRO_TITLE="预支金额";
UGKP_ERROR_BRO_TITLE="预支款必须为正值";

UGKP_HEAD_PACKET_TITLE="设置打包拍买物品的价格";
UGKP_HEAD_PACKET_LABEL="价格";
UGKP_ERROR_PACKET_TITLE="拍买的价格必须为正数";

UGKP_BUTTON_REPORT_GEN1="生成概要报表";
UGKP_BUTTON_REPORT_GEN2="生成详细报表";
UGKP_BUTTON_REPORT_SEND="发送";

UGKP_BUTTON_SEND_MONEY="发送分配信息";
UGKP_HEAD_UPDATE1="补/扣";
