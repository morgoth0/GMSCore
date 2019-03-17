/*
	GMS_fnc_giveTakeCrypto

	Purpose: update crypto on player.

*/
#include "\addons\GMSCore\init\GMS_defines.hpp"
//diag_log format["giveTakeCrypto: _this = %1",_this];
_this call EPOCH_server_effectCrypto;
