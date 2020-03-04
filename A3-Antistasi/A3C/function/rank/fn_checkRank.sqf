private ["_unit","_newRank","_result"];
_unit = _this select 0;
_score = _this select 1;
_rank = _this select 2;
_rankName = "";
diag_log "------CHECK RANK HAS BEEN CALLED------";
switch (true) do 
{	case (_score > 229270): {_newRank = 19; _rankName = "19:Colonel"};
	case (_score > 163650): {_newRank = 18; _rankName = "18:Lieutenant Colonel"};
	case (_score > 116780): {_newRank = 17; _rankName = "17:Major"};
	case (_score > 83300): {_newRank = 16; _rankName = "16:Captain"};
	case (_score > 59390): {_newRank = 15; _rankName = "15:Captain";};
	case (_score > 42310): {_newRank = 14; _rankName = "14:First Lieutenant"};
	case (_score > 30110): {_newRank = 13; _rankName = "13:Second Lieutenant"};	
	case (_score > 21390): {_newRank = 12; _rankName = "12:Sergeant Major"};	
	case (_score > 15160): {_newRank = 11; _rankName = "11:Master Sergeant"};	
	case (_score > 10710): {_newRank = 10; _rankName = "10:Sergeant First Class"};	
	case (_score > 7530): {_newRank = 9; _rankName = "9:Staff Sergeant"};	
	case (_score > 5260): {_newRank = 8; _rankName = "8:Staff Sergeant"};	
	case (_score > 3640): {_newRank = 7; _rankName = "7:Sergeant"};	
	case (_score > 2490): {_newRank = 6; _rankName = "6:Sergeant"};
	case (_score > 1670): {_newRank = 5; _rankName = "5:Corporal"};	
	case (_score > 1080): {_newRank = 4; _rankName = "4:Corporal"};	
	case (_score > 660): {_newRank = 3; _rankName = "3:Private First Class"};	
	case (_score > 360): {_newRank = 2; _rankName = "2:Private First Class"};	
	case (_score > 150): {_newRank = 1; _rankName = "1:Private E2"};
	case (_score == 150): {_newRank = 0; _rankName = "0:Private E1"};	
	case (_score < 150): {_newRank = 0; _rankName = "0:Private E1"};	
};

_result = [_newRank, _rankName];
diag_log format ["CheckRank: %1 :: %2 ",_newRank, _rankName];
_result