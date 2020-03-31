class CfgPatches {
    class antistasi_server {
        name = "Antistasi Server Mod";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {};
        author = "rory-dev";
        authorUrl = "https://a3command.com";
    };
};


class CfgFunctions
{
	class DB
	{
		class Database
		{
			file = "\antistasi_server\function\database";
			class async {};
			class bool {};
			class insertRequest {};
			class mresArray {};
			class mresString {};
			class mresToArray {};
			class numberSafe {};
			class queryRequest {};
			class updateFull {};
			class updatePart {};
		};
	};
	
	class A3S
	{
		class init
		{
			file = "\antistasi_server\function\init";
			class initFortify {};
			class initLoot {};
		};	
		class playtime
		{
			file = "\antistasi_server\function\playtime";
			class getPlayTime {};
			class setPlayTime {};
		};	
	};
	
};