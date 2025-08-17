//       .o.        .oooooo..o ooooooooooooo ooooooooo.     .oooooo.   ooooo      ooo       .o.       ooooo     ooo ooooooooooooo       .o.       
//      .888.      d8P'    `Y8 8'   888   `8 `888   `Y88.  d8P'  `Y8b  `888b.     `8'      .888.      `888'     `8' 8'   888   `8      .888.      
//     .8"888.     Y88bo.           888       888   .d88' 888      888  8 `88b.    8      .8"888.      888       8       888          .8"888.     
//    .8' `888.     `"Y8888o.       888       888ooo88P'  888      888  8   `88b.  8     .8' `888.     888       8       888         .8' `888.    
//   .88ooo8888.        `"Y88b      888       888`88b.    888      888  8     `88b.8    .88ooo8888.    888       8       888        .88ooo8888.   
//  .8'     `888.  oo     .d8P      888       888  `88b.  `88b    d88'  8       `888   .8'     `888.   `88.    .8'       888       .8'     `888.  
// o88o     o8888o 8""88888P'      o888o     o888o  o888o  `Y8bood8P'  o8o        `8  o88o     o8888o    `YbodP'        o888o     o88o     o8888o



#include < a_samp >
#include < streamer >

    //Defines (Fake)
static const E_SPACE_SKIN = 278;
    //Defines
#define     E_ROCKET_OBJECTS            (50)
#define 	E_FOSSIL_DISABLED 		    (0)
#define     E_FOSSIL_LEGHT                (28)

    //forward
forward SetPlayerNave(playerid);
forward SpaceUpdate();

    //Enums
enum SPACE_DATA {
    E_ROCKET[E_ROCKET_OBJECTS],
    E_ROCKET_SPACE[E_ROCKET_OBJECTS],
    E_ROCKET_TYPE
}
enum Data_SpaceX{
	E_FOSSIL_TYPE,
	E_FOSSIL_OBJECT,
	Float:E_FOSSIL_POS[3],
	E_FOSSIL_TIMER
}
static e_Fossil[E_FOSSIL_LEGHT][Data_SpaceX] =  {
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {942.458923, 1223.004028, 1056.677124}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {885.088684, 1295.546264, 1056.375610}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {885.546264, 1151.512573, 1056.448730}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {794.497131, 1178.424804, 1056.985107}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {772.539428, 1226.665283, 1056.839843}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {835.552185, 1250.438110, 1055.366821}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {791.156311, 1287.596313, 1056.297607}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {968.266784, 1305.586669, 1057.477661}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {1029.866699, 1219.956665, 1057.607666}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {999.401000, 1164.415283, 1056.657104}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {959.592285, 1170.845458, 1056.356933}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {974.991088, 1268.698852, 1057.457031}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {896.911010, 1261.960815, 1047.347534}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {919.472412, 1336.642456, 1049.098388}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {955.470153, 1335.699829, 1057.137695}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {925.126831, 1402.058471, 1056.647338}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {865.976745, 1407.058715, 1056.647338}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {885.821594, 1356.902221, 1056.104736}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {885.821594, 1320.122070, 1057.005004}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {885.821594, 1234.181640, 1056.934936}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {928.121459, 1261.651611, 1056.714721}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {972.791748, 1221.611572, 1057.244995}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {1038.707397, 1271.005493, 1056.994750}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {1017.205444, 1346.979125, 1057.875244}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {976.128906, 1382.186035, 1057.404907}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {869.506286, 1268.480346, 1057.274780}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {829.971191, 1218.955078, 1057.814819}},
		{E_FOSSIL_DISABLED, INVALID_OBJECT_ID , {850.265014, 1170.484130, 1058.495361}}
	};

    //Variables
static  e_SpaceData[SPACE_DATA];

main() {}

/*

                    ooooooooo.   ooooo     ooo oooooooooo.  ooooo        ooooo   .oooooo.   
                    `888   `Y88. `888'     `8' `888'   `Y8b `888'        `888'  d8P'  `Y8b  
                    888   .d88'  888       8   888     888  888          888  888          
                    888ooo88P'   888       8   888oooo888'  888          888  888          
                    888          888       8   888    `88b  888          888  888          
                    888          `88.    .8'   888    .88P  888       o  888  `88b    ooo  
                    o888o           `YbodP'    o888bood8P'  o888ooooood8 o888o  `Y8bood8P'  

*/
public OnGameModeInit() {

    CreateActor(165, 1119.1292,1075.2604,10.4422,273.9150);
    LoadSpaceMaps();
    CreateFocilSpace();
    SetTimer("SpaceUpdate",(60 * 1000), true);
    return 1;
}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){

    if(newkeys == KEY_YES) {
        if(IsPlayerInRangeOfPoint(playerid, 2.0, 1119.1292,1075.2604,11.5422)){
            if(e_SpaceData[E_ROCKET_TYPE] != 0)
                return SendClientMessage(playerid, 0xFF0000FF,"INFO: Aguarde o foguete retornar a zona de lancamento");

            InterpolateCameraPos(playerid, 1120.639526, 1075.249633, 10.442197, 1130.564331, 1034.564697, 56.544269, 4000);
            InterpolateCameraLookAt(playerid, 1115.705932, 1075.756835, 9.807682, 1127.354492, 1038.015625, 54.874347, 4000);
            SetTimerEx("SetPlayerNave", 7000, false,"i", playerid);
            SendClientMessage(playerid, -1,"INFO: Embarcando na aeronave, Aguarde a chagada ate a lua.");                    
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1123.9799,1111.6237,1086.5282)){
			SetPlayerPos(playerid, 800.1113+random(2),1353.6876+random(2),1058.5195);
			SetPlayerFacingAngle(playerid, 93.6355);
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, 1);
			SetPlayerTime(playerid, 20, 0);
			SetPlayerWeather(playerid, 45);
			return 1;	
		}		
		else if(IsPlayerInRangeOfPoint(playerid, Float:2.0, 800.5208,1373.0804,1057.8629)){

			if(e_SpaceData[E_ROCKET_TYPE] != 1)
				return SendClientMessage(playerid, -1,"INFO: Aguarde o foguete retornar a zona de lancamento");	

			SetPlayerPos(playerid, 1072.1250+random(2),1061.1973+random(2),10.2734);
			SetPlayerFacingAngle(playerid, 128.4157);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerWeather(playerid, 1);
			//SetPlayerSkin(playerid, 22); //Substitua pela Variavel da Skin

			for(new i = 0; i < 10; i++) {
				if(IsPlayerAttachedObjectSlotUsed(playerid, i)) 
				    RemovePlayerAttachedObject(playerid, i);
			}
			SendClientMessage(playerid, -1,"INFO: Voce retornou com seguranca a terra");
			return 1;	
		}
    }
    return 1;
}
public SetPlayerNave(playerid){
    if(!IsPlayerConnected(playerid))
        return false;

	SetCameraBehindPlayer(playerid);
	SetPlayerSkin(playerid, E_SPACE_SKIN);
	SetAstronautaPlayer(playerid);
	SetPlayerPos(playerid, 1114.2740+random(2), 1111.6119+random(2), 1086.5599);
	SetPlayerFacingAngle(playerid, 88.8170);
	SetPlayerInterior(playerid, 1);
	SetPlayerVirtualWorld(playerid, 1);
	SetPlayerTime(playerid, 20, 0);
	SetPlayerWeather(playerid, 45);
	SendClientMessage(playerid, -1,"INFO: Voce colocou seu equipamento de protecao espacial e proceda a saida da aeronave.");  
    return 1;      
}
public SpaceUpdate() {

    new 
		Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz;

	if(e_SpaceData[E_ROCKET_TYPE] == 0){

		for(new i; i < sizeof e_SpaceData[E_ROCKET_SPACE]; i++){
			GetDynamicObjectPos(e_SpaceData[E_ROCKET_SPACE][i], x, y, z);
			GetDynamicObjectRot(e_SpaceData[E_ROCKET_SPACE][i], rx, ry, rz);
			MoveDynamicObject(e_SpaceData[E_ROCKET_SPACE][i], x, y, z-250, 7.5, rx, ry, rz);	

			GetDynamicObjectPos(e_SpaceData[E_ROCKET][i], x, y, z);
			GetDynamicObjectRot(e_SpaceData[E_ROCKET][i], rx, ry, rz);
			MoveDynamicObject(e_SpaceData[E_ROCKET][i], x, y, z+250, 7.5, rx, ry, rz);			
		}
		e_SpaceData[E_ROCKET_TYPE] = 1;
	}
	else{
		for(new i; i < sizeof e_SpaceData[E_ROCKET_SPACE]; i++){

			GetDynamicObjectPos(e_SpaceData[E_ROCKET_SPACE][i], x, y, z);
			GetDynamicObjectRot(e_SpaceData[E_ROCKET_SPACE][i], rx, ry, rz);
			MoveDynamicObject(e_SpaceData[E_ROCKET_SPACE][i], x, y, z+250, 7.5, rx, ry, rz);			

			GetDynamicObjectPos(e_SpaceData[E_ROCKET][i], x, y, z);
			GetDynamicObjectRot(e_SpaceData[E_ROCKET][i], rx, ry, rz);
			MoveDynamicObject(e_SpaceData[E_ROCKET][i], x, y, z-250, 7.5, rx, ry, rz);	
		}
		e_SpaceData[E_ROCKET_TYPE] = 0;
	}
}

/*

                    .oooooo..o ooooooooooooo   .oooooo.     .oooooo.   oooo    oooo  .oooooo..o 
                    d8P'    `Y8 8'   888   `8  d8P'  `Y8b   d8P'  `Y8b  `888   .8P'  d8P'    `Y8 
                    Y88bo.           888      888      888 888           888  d8'    Y88bo.      
                    `"Y8888o.       888      888      888 888           88888[       `"Y8888o.  
                        `"Y88b      888      888      888 888           888`88b.         `"Y88b 
                    oo     .d8P      888      `88b    d88' `88b    ooo   888  `88b.  oo     .d8P 
                    8""88888P'      o888o      `Y8bood8P'   `Y8bood8P'  o888o  o888o 8""88888P'  

*/
static stock CreateFocilSpace(){
	for(new f; f < E_FOSSIL_LEGHT; f++){
		e_Fossil[f][E_FOSSIL_OBJECT] = CreateDynamicObject(1631, e_Fossil[f][E_FOSSIL_POS][0], e_Fossil[f][E_FOSSIL_POS][1], e_Fossil[f][E_FOSSIL_POS][2], 0.0, 0.0, 0.0);
		SetDynamicObjectMaterial(e_Fossil[f][E_FOSSIL_OBJECT], 0, 2922, "kmb_keypadx", "keypad_light", 0xFFFFFFFF);
		SetDynamicObjectMaterial(e_Fossil[f][E_FOSSIL_OBJECT], 1, 2922, "kmb_keypadx", "keypad_light", 0x00000000);
		SetDynamicObjectMaterial(e_Fossil[f][E_FOSSIL_OBJECT], 2, 19480, "signsurf", "sign", 0x00000000);
	}
    return 1;
}
static stock LoadSpaceMaps() {
    new
		tmpobject;
	// ~~~~~ [ Nave ] ~~~~~//
	tmpobject = CreateDynamicObject(19456, 1110.800415, 1113.094116, 1085.442260, 0.000000, 90.000000, 270.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(1523, 1114.558471, 1114.752075, 1086.230102, 0.000000, -90.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2749, "cj_hair", "cj_spec", 0x00000000);
	tmpobject = CreateDynamicObject(1523, 1109.567871, 1114.822143, 1086.230102, 0.000000, -90.000000, -180.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2749, "cj_hair", "cj_spec", 0x00000000);
	tmpobject = CreateDynamicObject(1523, 1111.188720, 1113.833862, 1089.766479, -25.900018, -180.000000, 179.999954, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	SetDynamicObjectMaterial(tmpobject, 1, 2749, "cj_hair", "cj_spec", 0x00000000);
	tmpobject = CreateDynamicObject(19736, 1111.359130, 1114.298461, 1088.520019, 158.699996, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19738, 1108.341308, 1111.589965, 1088.085937, 0.000000, -150.699996, 178.599929, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19736, 1107.448120, 1114.504760, 1088.393798, 157.099975, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19738, 1108.079956, 1111.585327, 1085.108276, 0.000000, 29.300010, -1.400024, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19354, 1109.383789, 1114.789062, 1086.080688, -0.000007, 0.000000, -89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1107.987670, 1113.952758, 1087.081665, -0.000007, 0.000000, -60.400001, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1109.383056, 1114.025390, 1089.348510, -0.000000, 204.899993, -89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19456, 1117.993774, 1114.025390, 1089.348510, 0.000000, 204.899993, -89.999969, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19456, 1117.983520, 1114.789062, 1086.101318, -0.000007, 0.000000, -89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1112.064086, 1114.829101, 1084.542114, 0.000000, 180.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(1523, 1112.653076, 1113.837158, 1089.769042, -25.900018, -180.000000, 179.999954, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(1523, 1109.689331, 1113.833862, 1089.766479, -25.900018, -180.000000, 179.999954, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19456, 1110.800415, 1110.074829, 1085.438354, 0.000000, 90.000000, 450.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(1523, 1109.567871, 1108.350830, 1086.230102, 0.000007, -90.000000, 179.999877, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2749, "cj_hair", "cj_spec", 0x00000000);
	tmpobject = CreateDynamicObject(1523, 1114.558471, 1108.280761, 1086.230102, -0.000007, -90.000000, 0.000007, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2749, "cj_hair", "cj_spec", 0x00000000);
	tmpobject = CreateDynamicObject(1523, 1112.937622, 1109.269042, 1089.766479, -25.900022, -180.000000, -0.000041, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	SetDynamicObjectMaterial(tmpobject, 1, 2749, "cj_hair", "cj_spec", 0x00000000);
	tmpobject = CreateDynamicObject(1523, 1111.473266, 1109.265747, 1089.769042, -25.900022, -180.000000, -0.000041, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(1523, 1114.437011, 1109.269042, 1089.766479, -25.900022, -180.000000, -0.000041, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19456, 1117.983764, 1108.304443, 1086.080688, -0.000007, 0.000007, 89.999961, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19456, 1118.003906, 1109.068115, 1089.348510, 0.000000, 204.899993, 89.999961, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19354, 1109.382934, 1109.068115, 1089.348510, 0.000000, 204.899993, 89.999969, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19354, 1109.383178, 1108.304443, 1086.101318, -0.000007, 0.000007, 89.999961, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1112.064086, 1108.278564, 1084.542114, 0.000000, 180.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1107.750976, 1109.289062, 1087.081665, -0.000007, 0.000000, -126.199996, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1112.064086, 1114.548461, 1087.713623, 0.000000, -170.099945, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1112.064086, 1108.556518, 1087.738403, 0.000000, 170.799987, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(5837, 1113.353637, 1111.556640, 1083.825561, 0.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 3, 18245, "cw_junkyardmachin", "Was_scrpyd_baler_decking", 0x00000000);
	tmpobject = CreateDynamicObject(14405, 1114.749511, 1111.588500, 1086.156005, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(19526, 1108.724975, 1113.629272, 1085.216430, 0.000007, 0.000012, 32.700004, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 16377, "des_byofficeint", "hectics_text", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 9818, "ship_brijsfw", "ship_greenscreen1", 0x00000000);
	tmpobject = CreateDynamicObject(19526, 1108.085083, 1113.218261, 1085.216430, 0.000007, 0.000012, 32.700004, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 16640, "a51", "a51_monitors", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 9818, "ship_brijsfw", "ship_screen1sfw", 0x00000000);
	tmpobject = CreateDynamicObject(19526, 1108.016357, 1109.978637, 1085.216430, 0.000009, -0.000012, 143.100036, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 1952, "mixkb1", "mixer1", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 9818, "ship_brijsfw", "ship_screen1sfw", 0x00000000);
	tmpobject = CreateDynamicObject(19526, 1108.632080, 1109.516357, 1085.216430, 0.000009, -0.000012, 143.100036, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 16640, "a51", "a51_monitors", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 10938, "skyscrap_sfse", "ws_skyscraperwin1", 0x00000000);
	tmpobject = CreateDynamicObject(19526, 1107.614746, 1112.358398, 1085.216430, 0.000022, 0.000000, 89.999931, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 14392, "dr_gsstudio", "rec_mix2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 16377, "des_byofficeint", "hectics_text", 0x00000000);
	tmpobject = CreateDynamicObject(19526, 1107.614746, 1111.578247, 1085.216430, 0.000022, 0.000000, 89.999931, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 14392, "dr_gsstudio", "rec_mix5c", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 14392, "dr_gsstudio", "monitors_128", 0x00000000);
	tmpobject = CreateDynamicObject(19456, 1120.433715, 1113.094116, 1085.442260, -0.000007, 90.000000, -89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19526, 1107.614746, 1110.797607, 1085.216430, 0.000022, 0.000000, 89.999931, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 14392, "dr_gsstudio", "rec_mix5b", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 14392, "dr_gsstudio", "rec_mix2", 0x00000000);
	tmpobject = CreateDynamicObject(995, 1108.568115, 1108.665649, 1086.671142, 0.000000, 90.000000, -39.600006, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1108.768066, 1108.500122, 1086.671142, 0.000000, 90.000000, -39.600006, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1111.898193, 1109.020629, 1088.771606, -90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1111.898193, 1109.360961, 1088.771606, -90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1113.028564, 1114.851684, 1085.700927, 0.000000, 0.000000, -180.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1113.028564, 1114.851684, 1085.991210, 0.000000, 0.000000, -180.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 1106.277099, 1111.648925, 1086.524902, 0.000000, 90.000000, 180.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 3070, "gogsx", "nightvision", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19456, 1120.433715, 1110.074829, 1085.438354, 0.000007, 90.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(14405, 1124.509643, 1110.148071, 1086.156005, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(14405, 1124.509643, 1112.968505, 1086.156005, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(14405, 1126.070922, 1110.148071, 1086.156005, 0.000007, 0.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(14405, 1126.070922, 1112.968505, 1086.156005, 0.000007, 0.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(14405, 1127.471923, 1110.148071, 1086.156005, 0.000014, 0.000000, 89.999954, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(14405, 1127.471923, 1112.968505, 1086.156005, 0.000014, 0.000000, 89.999954, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	tmpobject = CreateDynamicObject(19736, 1117.598999, 1114.298461, 1088.520019, 158.699996, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19736, 1123.828979, 1114.300415, 1088.523925, 158.699996, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2259, 1110.186767, 1114.230468, 1086.336059, 0.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 14392, "dr_gsstudio", "rec_mix5", 0x00000000);
	tmpobject = CreateDynamicObject(2259, 1110.186767, 1108.880371, 1086.336059, 0.000000, 0.000000, 180.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 14392, "dr_gsstudio", "rec_mix5b", 0x00000000);
	tmpobject = CreateDynamicObject(19866, 1107.896362, 1109.839843, 1087.254760, -30.800008, -90.000000, 60.599952, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19866, 1107.503906, 1109.269653, 1087.280395, 31.599990, -90.000000, -119.300086, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19866, 1107.857421, 1114.121948, 1087.375488, 30.800001, 90.000000, -65.500000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFF0F0F0);
	tmpobject = CreateDynamicObject(19866, 1107.885986, 1114.046875, 1087.384033, -149.300048, 90.000000, -65.500000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2371, 1116.510620, 1115.506103, 1087.296875, 0.000000, 90.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "chrome_tube4", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2371, 1116.510620, 1115.506103, 1086.216430, 0.000000, 90.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "chrome_tube4", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2371, 1117.970947, 1107.576049, 1086.186523, 0.000000, 90.000000, -270.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "chrome_tube4", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(3504, 1115.621093, 1111.497558, 1089.549560, -90.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1952, "mixkb1", "chrome_tube3", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(1437, 1117.013671, 1111.594238, 1086.669433, 10.699996, 0.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19598, "sfbuilding1", "darkwood1", 0x00000000);
	tmpobject = CreateDynamicObject(1654, 1107.159545, 1111.187377, 1087.016723, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 10226, "sfeship1", "sf_ship_generic21", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(1654, 1107.289672, 1112.737182, 1087.016723, 0.000000, 0.000000, 65.399993, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 9818, "ship_brijsfw", "sf_ship_generic2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(1654, 1107.394653, 1112.798950, 1086.696533, 0.000000, 0.000000, 65.399993, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 10226, "sfeship1", "sf_ship_generic4", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(1654, 1108.177978, 1109.523193, 1086.991210, 15.700000, 0.000000, 147.500030, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 9818, "ship_brijsfw", "sf_ship_generic2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(1654, 1109.080566, 1108.786865, 1085.792480, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 9818, "ship_brijsfw", "sf_ship_generic2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(1654, 1115.661132, 1109.457153, 1088.342895, 31.700004, 0.000000, 119.400009, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 9818, "ship_brijsfw", "sf_ship_generic2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(2689, 1117.624511, 1114.663085, 1087.243652, 0.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1948, "kbslotnu", "larg_reel1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1", 0x00000000);
	tmpobject = CreateDynamicObject(2689, 1116.574218, 1114.663085, 1087.243652, 0.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1948, "kbslotnu", "larg_reel1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1", 0x00000000);
	tmpobject = CreateDynamicObject(19736, 1121.924072, 1114.684814, 1086.913818, 0.000000, 90.000000, -117.699958, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19736, 1121.901611, 1108.340576, 1086.953857, 180.000000, 90.000000, 118.899917, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6104, "gazlaw2", "gm_labuld4_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(3504, 1124.901611, 1111.547607, 1086.818725, 0.000000, 0.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1952, "mixkb1", "chrome_tube3", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(954, 1107.981933, 1112.320190, 1086.122192, 23.399993, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(954, 1107.981933, 1110.819824, 1086.122192, 23.399993, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1123.613891, 1109.295288, 1086.671142, 0.000000, 90.000000, 45.200000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(995, 1123.768920, 1109.451293, 1087.811523, 0.000000, 90.000000, 45.200000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18659, 1112.451904, 1109.737548, 1088.887084, 0.000000, -90.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14561, "triad_neon", "kbneon", 0x00000000);
	tmpobject = CreateDynamicObject(18659, 1112.451904, 1113.317749, 1088.887084, 0.000000, -90.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14561, "triad_neon", "kbneon", 0x00000000);
	tmpobject = CreateDynamicObject(18659, 1120.723388, 1109.737548, 1088.887084, 0.000000, -89.999992, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14561, "triad_neon", "kbneon", 0x00000000);
	tmpobject = CreateDynamicObject(18659, 1120.723388, 1113.317749, 1088.887084, 0.000000, -89.999992, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14561, "triad_neon", "kbneon", 0x00000000);
	tmpobject = CreateDynamicObject(18659, 1116.022583, 1109.737548, 1088.887084, 0.000000, -89.999984, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14561, "triad_neon", "kbneon", 0x00000000);
	tmpobject = CreateDynamicObject(18659, 1116.022583, 1113.317749, 1088.887084, 0.000000, -89.999984, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14561, "triad_neon", "kbneon", 0x00000000);
	tmpobject = CreateDynamicObject(2263, 1119.432495, 1114.208129, 1086.689819, 5.499999, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16640, "a51", "a51_monitors", 0x00000000);
	tmpobject = CreateDynamicObject(2263, 1120.822631, 1114.208129, 1086.689819, 5.499999, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14392, "dr_gsstudio", "monitors_128", 0x00000000);
	tmpobject = CreateDynamicObject(2263, 1120.822631, 1108.907714, 1086.689819, 5.499989, 0.000000, -179.999877, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16640, "a51", "a51_monitors", 0x00000000);
	tmpobject = CreateDynamicObject(2263, 1119.432495, 1108.907714, 1086.689819, 5.499989, 0.000000, -179.999877, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14392, "dr_gsstudio", "monitors_128", 0x00000000);
	tmpobject = CreateDynamicObject(2263, 1108.111206, 1112.726074, 1086.848510, 18.299999, 0.000000, 54.999988, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14392, "dr_gsstudio", "monitors_128", 0x00000000);
	tmpobject = CreateDynamicObject(2263, 1108.080566, 1110.391601, 1086.788452, 18.299999, 0.000000, 121.000007, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14392, "dr_gsstudio", "monitors_128", 0x00000000);
	tmpobject = CreateDynamicObject(2977, 1114.981567, 1108.925170, 1085.407348, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19842, 1105.551269, 1122.026611, 1085.342285, 0.000000, 90.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18864, "fakesnow1", "snow2", 0x00000000);
	tmpobject = CreateDynamicObject(19842, 1105.551269, 1102.976196, 1085.342285, 0.000000, 90.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18864, "fakesnow1", "snow2", 0x00000000);
	// ~~~~~ [ Lua ] ~~~~~//

	tmpobject = CreateDynamicObject(11694, 1012.880126, 1357.255737, 1027.971679, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 1012.880126, 1194.666137, 1027.971679, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 822.019470, 1357.255737, 1027.971679, 0.000000, 0.000022, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 836.739990, 1157.286499, 1027.971679, 0.000000, 0.000022, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(19332, 969.088500, 1296.287841, 1071.644775, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFE6E6E6);
	tmpobject = CreateDynamicObject(7313, 970.800659, 1293.031982, 1064.555297, -140.400039, 90.000000, -160.299972, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(7313, 971.686401, 1290.555541, 1061.626098, -133.900024, 90.000000, -160.299972, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 969.097900, 1296.315185, 1065.937255, 0.000000, 540.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19332, 954.262207, 1175.364257, 1069.213867, 0.000000, 180.000000, 121.899986, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFE6E6E6);
	tmpobject = CreateDynamicObject(7313, 956.121582, 1178.538452, 1062.124389, -39.599956, -89.999984, 141.600036, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(7313, 957.755981, 1180.598999, 1059.195190, -46.099975, -89.999984, 141.600036, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 954.234069, 1175.357788, 1064.066528, 0.000000, 180.000000, 121.899986, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19332, 859.240295, 1206.489013, 1067.953002, 0.000006, 180.000000, 20.100006, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFE6E6E6);
	tmpobject = CreateDynamicObject(7313, 861.967163, 1204.019897, 1060.863525, -39.599948, -89.999992, 39.800045, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(7313, 863.649963, 1201.998657, 1057.934326, -46.099967, -89.999992, 39.800045, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 859.239685, 1206.517944, 1062.805664, 0.000006, 180.000000, 20.100006, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19332, 1021.296936, 1229.341064, 1068.453369, 0.000009, 180.000000, -119.999946, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFE6E6E6);
	tmpobject = CreateDynamicObject(7313, 1017.621154, 1229.486083, 1061.363891, -39.599945, -89.999984, -100.299911, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(7313, 1015.033630, 1229.957397, 1058.434692, -46.099960, -89.999984, -100.299903, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 1021.315979, 1229.319213, 1063.306030, 0.000009, 180.000000, -119.999946, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(3255, 1011.480346, 1565.720947, 1133.506103, -37.035144, 3.860236, -20.324714, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 18646, "matcolours", "lightblue", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 4, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 5, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 6, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 7, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(880, 1010.333374, 1569.067260, 1137.950927, 23.266593, 3.353655, -23.978008, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10386, "mountainsfs", "grass4dirty", 0x00000000);
	tmpobject = CreateDynamicObject(880, 1011.868713, 1569.330810, 1138.561889, 73.515182, 127.982780, 167.826538, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10386, "mountainsfs", "grass4dirty", 0x00000000);
	tmpobject = CreateDynamicObject(906, 1010.027282, 1569.779907, 1140.175781, 57.820449, -29.730365, -28.422031, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10386, "mountainsfs", "grass4dirty", 0x00000000);
	tmpobject = CreateDynamicObject(880, 1013.527587, 1572.339355, 1136.491333, 53.597297, -21.969768, -28.443241, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10756, "airportroads_sfse", "ws_white_wall1", 0x00000000);
	tmpobject = CreateDynamicObject(906, 1009.683105, 1570.037597, 1139.770141, -42.755496, 32.517723, -20.383148, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10386, "mountainsfs", "grass4dirty", 0x00000000);
	tmpobject = CreateDynamicObject(880, 1012.862976, 1569.141845, 1140.306030, 19.891725, -82.621856, -25.160921, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10756, "airportroads_sfse", "ws_white_wall1", 0x00000000);
	tmpobject = CreateDynamicObject(11751, 1073.467407, 1520.477905, 1073.331054, 0.000000, 66.099983, -63.499984, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19063, "xmasorbs", "sphere", 0x00000000);
	tmpobject = CreateDynamicObject(7230, 1013.079284, 1567.538940, 1143.610473, -29.279085, -16.810777, 150.982879, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19063, "xmasorbs", "sphere", 0x00000000);
	tmpobject = CreateDynamicObject(18614, 885.354675, 1328.383422, 1173.106933, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18864, "fakesnow1", "snow2", 0x00000000);
	tmpobject = CreateDynamicObject(17437, 885.354675, 1109.564697, 1203.427001, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18864, "fakesnow1", "snow2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 834.411926, 1104.197021, 1065.231933, -25.100004, 90.000000, 68.100013, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(18843, 475.542144, 1325.787841, 1075.506469, 0.000000, 5.400014, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 726, "gtatreesh", "pinewood", 0x00000000);
	tmpobject = CreateDynamicObject(11751, 533.545104, 1330.233032, 1069.016845, -23.299968, 0.000001, 89.999931, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19063, "xmasorbs", "sphere", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 1012.880126, 1388.122070, 991.959411, 40.600002, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 844.860107, 1399.828369, 995.045959, 46.200004, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 783.278930, 1386.476806, 988.985595, 46.200004, 0.000000, 80.900016, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 785.651428, 1232.081054, 988.303894, 46.200004, 6.499999, 99.400009, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 732.734619, 1233.894287, 1065.231933, 0.000000, 90.000000, 15.900000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 727.530944, 1369.819213, 1065.231933, 0.000000, 90.000000, -7.399997, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 856.205932, 1446.067993, 1065.231933, 0.000000, 90.000000, -92.900032, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 1039.466186, 1428.354492, 1065.231933, 0.000000, 90.000000, -100.800033, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 1002.452087, 1115.346313, 1090.797363, 94.599960, 12.999997, -164.399932, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 1075.493408, 1214.697265, 1099.235351, 94.599960, 12.999997, -107.899971, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(11694, 1076.680664, 1332.977416, 1056.891845, -37.900005, -90.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFDCDCDC);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0x00000000);
	tmpobject = CreateDynamicObject(1631, 835.552185, 1250.438110, 1055.366821, -17.099998, 0.000000, 10.199990, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2922, "kmb_keypadx", "keypad_light", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2922, "kmb_keypadx", "keypad_light", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(19717, 814.266235, 1363.757812, 1074.363891, 86.599983, 179.999862, -179.999862, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18876, 809.885253, 1364.977294, 1057.318115, 0.699997, 90.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(19717, 814.277587, 1343.792846, 1074.363891, 86.599983, 180.000106, -0.000157, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18876, 818.658569, 1342.573364, 1057.318115, 0.700003, 89.999992, 179.999832, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(19717, 823.917480, 1353.943115, 1074.363891, 86.599983, 180.000106, 89.999778, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18876, 825.136962, 1358.324096, 1057.318115, 0.699989, 89.999992, -90.000061, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(1391, 842.985961, 1354.113525, 1085.826171, 0.000000, 0.000029, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2772, "airp_prop", "cj_chromepipe", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1631, "landjump", "Aascaff128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19277, 842.973876, 1352.107421, 1095.457275, -0.000006, 0.000022, 0.000020, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 11395, "corvinsign_sfse", "shutters", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 9583, "bigshap_sfw", "sf_ship_glasst", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(9339, 832.467041, 1354.702636, 1094.227050, 0.000014, 90.000000, 89.999954, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14776, "genintintcarint3", "tyretread_64H", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(9339, 832.468994, 1353.475585, 1094.233032, -0.000014, 90.000000, -89.999954, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14776, "genintintcarint3", "tyretread_64H", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19633, 814.472167, 1353.873779, 1057.755249, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16322, "a51_stores", "metalic128", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 3053, "magnetx", "magnetY", 0x00000000);
	tmpobject = CreateDynamicObject(1301, 814.166870, 1353.850830, 1057.784179, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 818.656982, 1353.850830, 1057.784179, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 809.746704, 1353.850830, 1057.784179, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 814.201904, 1358.305908, 1057.784179, 0.000007, 180.000000, 89.999946, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 814.201904, 1349.395629, 1057.784179, 0.000007, 180.000000, 89.999946, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(5838, 787.081726, 1378.668945, 1043.728881, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 787.140197, 1378.669189, 1056.518676, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(19699, 797.846740, 1378.770996, 1057.657226, 0.000000, 180.000000, 180.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(5838, 813.471618, 1378.668945, 1043.728881, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 813.530090, 1378.669189, 1056.518676, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(5838, 800.371215, 1378.668945, 1043.728881, 0.000000, 0.000022, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 800.429687, 1378.669189, 1056.518676, 0.000000, 0.000022, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(5838, 800.371215, 1402.678955, 1043.728881, 0.000000, 0.000029, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 800.429687, 1402.679199, 1056.518676, 0.000000, 0.000029, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(19699, 800.466674, 1391.191528, 1057.657226, 0.000000, 180.000000, 270.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(3504, 800.434509, 1375.445922, 1058.130249, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 800.434509, 1374.415649, 1058.130249, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19790, 810.041687, 1387.545532, 1052.040893, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16640, "a51", "a51_strips1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19790, 790.221679, 1387.545532, 1052.040893, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16640, "a51", "a51_strips1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1697, 810.087280, 1387.476318, 1058.660644, 0.000000, 0.000000, -90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1697, 790.227172, 1387.476318, 1058.660644, 0.000000, 0.000000, -90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18452, 811.822875, 1397.658203, 1053.802734, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14569, "traidman", "darkgrey_carpet_256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 10938, "skyscrap_sfse", "ws_skyscraperwin1", 0x00000000);
	tmpobject = CreateDynamicObject(2977, 809.352722, 1401.279907, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 809.352722, 1399.799682, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 809.693054, 1398.479492, 1057.019531, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 811.272766, 1399.779907, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 814.242858, 1393.119995, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 812.652954, 1393.119995, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 814.713073, 1402.280273, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 814.713073, 1400.849853, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19129, 918.625732, 1366.917358, 1044.152343, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18835, "mickytextures", "orang006", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(11461, 969.115173, 1296.173583, 1054.465209, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 969.095031, 1296.249267, 1066.715820, 180.000000, 90.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 1021.335021, 1229.328857, 1063.785766, 180.000000, 90.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 954.284790, 1175.368164, 1064.446411, 180.000000, 90.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(19354, 859.154663, 1206.468139, 1063.306030, 180.000000, 90.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(6881, 530.085693, 1286.504638, 1085.626342, -13.339424, 20.550228, 1.284350, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2627, "genintint_gym", "chrome_tube1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2627, "genintint_gym", "chrome_tube1", 0x00000000);
	tmpobject = CreateDynamicObject(6881, 455.097564, 1291.300048, 1112.933715, -19.971803, -14.210345, -93.658927, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2627, "genintint_gym", "chrome_tube1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2627, "genintint_gym", "chrome_tube1", 0x00000000);
	tmpobject = CreateDynamicObject(6881, 453.374725, 1368.151489, 1094.706298, 13.339481, -20.550207, -178.715759, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2627, "genintint_gym", "chrome_tube1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2627, "genintint_gym", "chrome_tube1", 0x00000000);
	tmpobject = CreateDynamicObject(6881, 528.362792, 1363.356079, 1067.399047, 19.971792, 14.210383, 86.340797, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2627, "genintint_gym", "chrome_tube1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2627, "genintint_gym", "chrome_tube1", 0x00000000);
	tmpobject = CreateDynamicObject(5838, 955.635925, 1389.365356, 1043.728881, 0.000000, 0.000037, -53.100002, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 955.671264, 1389.318725, 1056.518676, 0.000000, 0.000037, -53.100002, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 953.096496, 1387.379516, 1058.130249, 0.000000, 0.000014, -53.100002, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 952.272644, 1386.760864, 1058.130249, 0.000000, 0.000014, -53.100002, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(1697, 955.693847, 1389.301147, 1061.301147, -0.000007, 0.000000, -143.099990, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(5838, 953.457763, 1275.295288, 1043.728881, -0.000006, 0.000040, 164.199966, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 953.401367, 1275.310913, 1056.518676, -0.000006, 0.000040, 164.199966, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 954.274414, 1278.413818, 1058.130249, -0.000006, 0.000018, 164.199966, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 954.554931, 1279.405151, 1058.130249, -0.000006, 0.000018, 164.199966, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(1697, 953.372802, 1275.311157, 1061.301147, -0.000012, -0.000006, 74.200004, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(5838, 812.899597, 1229.585815, 1044.659423, -0.000003, 0.000034, 81.899963, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(18849, 812.907470, 1229.643798, 1057.449218, -0.000003, 0.000034, 81.899963, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 816.099426, 1229.194335, 1059.060791, -0.000003, 0.000012, 81.899963, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(3504, 817.119384, 1229.049316, 1059.060791, -0.000003, 0.000012, 81.899963, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(1697, 812.903869, 1229.672119, 1062.231689, -0.000003, -0.000003, -8.099971, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 3, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(11293, 788.617126, 1400.057495, 1062.061279, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1830, "kbslotmchines", "slot_bit2", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 905.183288, 1219.783203, 1020.636840, 17.399999, 0.000000, 149.299987, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 916.101928, 1233.534179, 1026.193847, 17.399999, 0.000000, -53.400016, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 1017.369445, 1207.785278, 1016.396667, 17.399999, 0.000000, -53.400016, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 1002.562011, 1190.113525, 1011.645629, 17.399999, 0.000000, 153.100021, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 1001.113647, 1205.872558, 1022.853027, -17.900005, 0.000000, -119.000007, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 985.915649, 1324.647949, 1011.356689, 17.399988, 0.000014, 36.599975, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 1003.587402, 1309.840454, 1006.605651, 17.399999, -0.000017, -116.899971, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 987.828369, 1308.392089, 1017.813049, -17.900016, 0.000000, -28.999988, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 939.312866, 1418.338378, 1011.356689, 17.399990, 0.000022, 2.199980, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 945.528259, 1396.136718, 1006.605651, 17.399990, -0.000020, -151.299926, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 931.706970, 1403.844970, 1017.813049, -17.900018, 0.000006, -63.399974, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 886.866638, 1407.932861, 1011.356689, 17.399995, 0.000029, 92.199928, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 909.068298, 1414.148193, 1006.605651, 17.399976, -0.000024, -61.299915, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 901.360046, 1400.326904, 1017.813049, -17.900018, 0.000017, 26.600019, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 897.272155, 1297.136718, 1014.266723, 17.400009, 0.000029, -177.800064, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 891.056823, 1319.338378, 1009.515686, 17.399959, -0.000015, 28.700077, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 904.878112, 1311.630126, 1020.723083, -17.900009, 0.000030, 116.599990, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 797.058166, 1307.542236, 1012.016662, 17.400007, 0.000012, -87.800003, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 774.856506, 1301.326904, 1007.265625, 17.399965, -0.000001, 118.700042, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 782.564758, 1315.148193, 1018.473022, -17.899990, 0.000024, -153.400009, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 786.652648, 1217.038208, 1012.016662, 17.399990, 0.000014, 2.200011, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 792.867980, 1194.836547, 1007.265625, 17.399978, -0.000009, -151.299942, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 779.046691, 1202.544799, 1018.473022, -17.899995, 0.000009, -63.399978, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 836.600036, 1160.603027, 1021.896972, 17.399988, 0.000022, 45.399993, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 856.328979, 1148.673461, 1017.145935, 17.399974, -0.000017, -108.099922, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 840.976989, 1144.831176, 1028.353271, -17.900003, 0.000012, -20.199979, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 962.460571, 1158.321533, 1019.616821, 17.399993, 0.000037, -44.600002, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 950.531005, 1138.592529, 1014.865783, 17.399957, -0.000029, 161.900039, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 946.688720, 1153.944580, 1026.073120, -17.900011, 0.000024, -110.199928, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(16112, 1055.651611, 1239.867309, 1112.145874, 0.000000, -78.099990, -2.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(16112, 991.397460, 1133.439086, 1116.031005, 26.900001, -81.299995, -85.400001, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(16112, 1009.417053, 1143.730224, 1126.715209, 55.599998, -89.499977, -45.800006, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19129, 918.955810, 1209.687500, 1053.111083, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18996, "mattextures", "lava1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19129, 919.075256, 1189.707763, 1053.111083, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18996, "mattextures", "lava1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19129, 919.075256, 1169.828247, 1053.111083, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18996, "mattextures", "lava1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(14558, 810.278930, 1398.297973, 1057.840209, 0.000000, 0.000000, 90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2922, "kmb_keypadx", "keypad_light", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2922, "kmb_keypadx", "keypad_light", 0x00000000);
	tmpobject = CreateDynamicObject(14558, 810.278930, 1398.297973, 1057.479858, 0.000000, 0.000000, 90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2922, "kmb_keypadx", "keypad_light", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 2922, "kmb_keypadx", "keypad_light", 0x00000000);
	tmpobject = CreateDynamicObject(2977, 812.382568, 1399.779907, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 813.482666, 1399.779907, 1057.019531, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 809.693054, 1397.279174, 1057.019531, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2977, 809.693054, 1396.159301, 1057.019531, 0.000000, 0.000007, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1596, 813.429199, 1377.876098, 1062.103393, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1596, 787.169250, 1377.876098, 1062.103393, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(11751, 533.545104, 1330.233032, 1069.016845, -23.299968, 0.000001, 89.999931, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19063, "xmasorbs", "sphere", 0x00000000);
	tmpobject = CreateDynamicObject(10765, 717.219482, 1575.316894, 1174.635986, 119.200004, -3.699996, 24.399999, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14612, "ab_abattoir_box", "ab_bloodfloor", 0x96FFFFFF);
	tmpobject = CreateDynamicObject(10765, 828.525329, 1437.393920, 1288.635742, 160.300003, -12.199997, 90.199996, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14612, "ab_abattoir_box", "ab_bloodfloor", 0x96FFFFFF);
	tmpobject = CreateDynamicObject(8397, 853.850646, 1103.101684, 1088.620117, -5.092391, 53.148761, 23.155149, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 867.445068, 1083.907592, 1087.672119, 2.754113, -56.279701, -113.306114, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(8397, 861.109802, 1094.860473, 1102.367309, -74.003814, 18.939199, -20.714262, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19527, "cauldron1", "alienliquid1", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19332, 869.998107, 1375.637695, 1073.785400, 0.000000, 180.000000, -49.399993, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 3, 9507, "boxybld2_sfw", "sfn_rock2", 0xFFE6E6E6);
	tmpobject = CreateDynamicObject(7313, 868.640319, 1372.218994, 1066.695922, -39.599956, -89.999984, -29.699991, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(7313, 867.336425, 1369.934936, 1063.766723, -46.099975, -89.999984, -29.699985, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 17003, "countrys", "rustc256128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 870.024963, 1375.648437, 1068.077880, 0.000000, 540.000000, -49.399993, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19354, 869.973083, 1375.607788, 1068.856445, 0.000000, 270.000000, 130.599990, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(2208, 988.806030, 1361.471923, 1057.650512, 90.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 988.987121, 1360.577514, 1057.624023, 0.000000, 90.000000, 90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 991.147216, 1360.577514, 1057.624023, 0.000000, 90.000000, 90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 990.057067, 1360.577514, 1057.624023, 0.000000, 90.000000, 90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19589, 990.120117, 1362.228271, 1059.213012, 0.000000, 180.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2208, 991.407470, 1362.839599, 1057.650512, 89.999992, -47.780025, -132.219879, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 991.226318, 1363.734130, 1057.624023, 0.000029, 90.000007, -90.000022, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 989.066162, 1363.734008, 1057.624023, 0.000029, 90.000007, -90.000022, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 990.156494, 1363.734008, 1057.624023, 0.000029, 90.000007, -90.000022, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(1335, 988.841674, 1362.078857, 1058.563964, 0.000000, 0.000000, 90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1581, 988.134094, 1362.086547, 1058.885864, -7.199999, 0.000000, -90.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19843, 990.477661, 1362.171264, 1059.193603, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0x00000000);
	tmpobject = CreateDynamicObject(2208, 984.074218, 1203.969726, 1057.580322, 85.700027, -89.999992, -54.200023, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 983.402893, 1204.588378, 1057.567504, -4.299971, 90.000000, -54.200019, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 981.655822, 1203.328369, 1057.729370, -4.299971, 90.000000, -54.200019, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 982.537536, 1203.964233, 1057.647705, -4.299971, 90.000000, -54.200019, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19589, 983.548889, 1202.658203, 1059.237060, 0.000000, 175.700027, -144.200012, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2208, 982.770263, 1201.342895, 1057.775390, 85.700027, 89.999984, -54.199943, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 983.438354, 1200.722045, 1057.735351, 4.300001, 90.000007, 125.799911, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 985.185424, 1201.982177, 1057.573364, 4.300001, 90.000007, 125.799911, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 984.303588, 1201.346191, 1057.655151, 4.300001, 90.000007, 125.799911, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(1335, 984.455932, 1203.496704, 1058.493896, -4.299971, 0.000000, -54.200019, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1581, 985.052307, 1203.917358, 1058.761840, -2.900027, 0.000000, 125.799934, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19843, 983.225158, 1202.495117, 1059.244384, 0.000000, -4.299971, -144.200012, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0x00000000);
	tmpobject = CreateDynamicObject(2208, 844.942382, 1179.355346, 1057.810913, 86.391464, -98.394821, -0.824971, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 844.030456, 1179.318359, 1057.787597, -3.569797, 89.472496, -9.236231, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 843.684387, 1177.190429, 1057.921997, -3.569797, 89.472496, -9.236231, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 843.859008, 1178.264282, 1057.854125, -3.569797, 89.472496, -9.236231, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19589, 845.479919, 1178.038208, 1059.459228, 0.526480, 176.430053, -99.203361, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2208, 845.875732, 1176.573852, 1057.985473, 86.391464, 81.605155, -0.824885, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 846.787536, 1176.607788, 1057.955932, 3.569827, 90.527511, 170.763671, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 847.133544, 1178.735717, 1057.821411, 3.569827, 90.527511, 170.763671, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 846.958862, 1177.661621, 1057.889404, 3.569827, 90.527511, 170.763671, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(1335, 845.536560, 1179.280639, 1058.730346, -3.569797, -0.527502, -9.236231, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1581, 845.657775, 1179.996826, 1059.007690, -3.629897, 0.527538, 170.829940, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19843, 845.366210, 1177.693969, 1059.461425, 0.526480, -3.569947, -99.203361, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0x00000000);
	tmpobject = CreateDynamicObject(2208, 846.574584, 1307.844360, 1057.080810, 85.028022, -72.494338, -143.456893, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2887, "a51_spotlight", "dts_spotlight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 846.952636, 1308.675415, 1057.092773, -4.741166, 91.498992, -125.889167, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 845.208801, 1309.937377, 1057.271240, -4.741166, 91.498992, -125.889167, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 846.088867, 1309.300537, 1057.181152, -4.741166, 91.498992, -125.889167, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19589, 845.149658, 1307.891845, 1058.726562, -1.493854, 175.257217, 143.986831, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19844, 843.289672, 1307.431030, 1057.195556, 4.741199, 88.501022, 54.110671, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 845.033569, 1306.169067, 1057.016967, 4.741199, 88.501022, 54.110671, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(19844, 844.153320, 1306.806152, 1057.107177, 4.741199, 88.501022, 54.110671, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14650, "ab_trukstpc", "bras_base", 0x00000000);
	tmpobject = CreateDynamicObject(1335, 846.236206, 1307.310913, 1057.978027, -4.741166, 1.498988, -125.889167, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1929, "kbroul2", "roul_slotbit6", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1581, 846.819702, 1306.869018, 1058.240234, -2.456377, -1.495229, 53.922664, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19843, 844.893676, 1308.148193, 1058.738159, -1.493854, -4.742783, 143.986831, 1, -1, -1, 900.00, 900.00);
	SetDynamicObjectMaterial(tmpobject, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0x00000000);
	tmpobject = CreateDynamicObject(7313, 970.546813, 1294.453002, 1061.521728, -140.400039, 90.000000, -160.299972, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(7313, 955.049316, 1177.571899, 1059.090820, -39.599956, -89.999984, 141.600036, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(7313, 861.240295, 1205.267089, 1057.829956, -39.599948, -89.999992, 39.800045, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(7313, 1018.978820, 1228.995605, 1058.330322, -39.599945, -89.999984, -100.299911, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(18074, 836.991577, 1355.258300, 1095.700561, -14.999980, 0.000000, 89.999954, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(2888, 843.965454, 1354.175903, 1098.028564, 0.000007, 0.000000, 89.999977, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(2888, 841.964599, 1354.175903, 1098.028564, -0.000007, 0.000000, -89.999977, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(19129, 918.625732, 1366.917358, 1040.282470, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(19129, 919.075256, 1186.518676, 1044.260864, 0.000000, 0.000000, 0.000000, 1, -1, -1, 900.00, 900.00);
	tmpobject = CreateDynamicObject(7313, 869.554016, 1373.336547, 1063.662353, -39.599956, -89.999984, -29.699991, 1, -1, -1, 900.00, 900.00);
  // ~~~~~ [ Base Terra Lancamento	] ~~~~~//
	tmpobject = CreateDynamicObject(19758, 1081.181518, 1074.845092, 32.776966, 90.000000, 90.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18250, "cw_junkbuildcs_t", "Was_scrpyd_hngr_jsts", 0x00000000);
	tmpobject = CreateDynamicObject(19758, 1081.181518, 1074.845092, -2.193046, 270.000000, 90.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18250, "cw_junkbuildcs_t", "Was_scrpyd_hngr_jsts", 0x00000000);
	tmpobject = CreateDynamicObject(19672, 1077.235107, 1070.714721, 9.907462, -0.000000, 630.000000, 115.900093, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18250, "cw_junkbuildcs_t", "Was_scrpyd_hngr_jsts", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(3567, 1049.904663, 1069.934326, 9.854412, -0.000016, 0.000014, 20.500043, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 2, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 5, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(13025, 1051.333618, 1066.237182, 11.894704, 0.000014, 0.000016, 110.499931, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 16271, "des_factory", "dish_cylinder_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(13025, 1048.504028, 1073.805175, 11.894704, 0.000014, 0.000016, 110.499931, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 16271, "des_factory", "dish_cylinder_a", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19672, 1058.005126, 1063.467773, 10.473268, 13.000016, 270.000000, 115.400016, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18250, "cw_junkbuildcs_t", "Was_scrpyd_hngr_jsts", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(1366, 1052.798828, 1062.682617, 11.623136, 0.000014, -89.999984, 117.299926, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16322, "a51_stores", "Gen_Freight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1366, 1071.186035, 1071.562622, 9.416456, -0.000007, -109.200065, -68.299934, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16322, "a51_stores", "Gen_Freight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19672, 1065.458740, 1071.568237, 9.307466, -0.000014, 270.000000, -64.099861, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 18250, "cw_junkbuildcs_t", "Was_scrpyd_hngr_jsts", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 19480, "signsurf", "sign", 0x00000000);
	tmpobject = CreateDynamicObject(19131, 1052.781250, 1062.656616, 11.664776, 0.000014, 0.000009, 110.499931, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 3564, "dockcargo2_las", "lastran8", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 3630, "compthotrans_la", "sanpedock993", 0x00000000);
	tmpobject = CreateDynamicObject(19717, 1088.628295, 1084.809814, 26.453659, 93.400001, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19131, 1048.910156, 1067.156250, 11.664776, -0.000002, 0.000021, 20.499998, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 3564, "dockcargo2_las", "lastran8", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 3630, "compthotrans_la", "sanpedock993", 0x00000000);
	tmpobject = CreateDynamicObject(19131, 1046.192504, 1074.424926, 11.664776, -0.000002, 0.000021, 20.499998, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 3564, "dockcargo2_las", "lastran8", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 3630, "compthotrans_la", "sanpedock993", 0x00000000);
	tmpobject = CreateDynamicObject(920, 1051.948242, 1061.882080, 10.993362, -0.000002, 0.000014, 20.499998, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10850, "bakerybit2_sfse", "frate64_red", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 10850, "bakerybit2_sfse", "frate64_red", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 2, 11150, "ab_acc_control", "ab_dialsSwitches", 0x00000000);
	tmpobject = CreateDynamicObject(2372, 1051.320556, 1062.804443, 11.021695, 89.999992, 85.835006, -65.335014, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10850, "bakerybit2_sfse", "frate64_red", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2372, 1051.508056, 1062.874511, 11.021695, 89.999992, 85.835006, -65.335014, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10850, "bakerybit2_sfse", "frate64_red", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(2261, 1045.038452, 1076.022216, 11.229751, -0.000014, -0.000002, -69.500000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10850, "bakerybit2_sfse", "frate64_red", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 1217, "dynbarrels", "redallu", 0x00000000);
	tmpobject = CreateDynamicObject(1366, 1071.548828, 1070.650878, 9.790100, -0.000007, 70.799934, -68.299934, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 16322, "a51_stores", "Gen_Freight", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18876, 1084.247314, 1086.029296, 9.407942, 0.699997, 90.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(19717, 1088.639648, 1064.844848, 26.453659, 86.599983, 179.999984, -0.000029, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18876, 1093.020629, 1063.625366, 9.407942, 0.700004, 90.000000, 179.999877, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(19717, 1098.279541, 1074.995117, 26.453659, 86.599983, 180.000106, 89.999801, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18876, 1099.499023, 1079.376098, 9.407942, 0.699997, 89.999992, -90.000083, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(9527, 1088.792236, 1086.094238, 9.123733, 90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobject = CreateDynamicObject(9527, 1088.521972, 1063.524291, 9.123733, 90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobject = CreateDynamicObject(9527, 1099.582763, 1074.844238, 9.123733, 90.000000, 0.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobject = CreateDynamicObject(1391, 1117.348022, 1075.165527, 37.915912, 0.000000, 0.000022, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 2772, "airp_prop", "cj_chromepipe", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 1631, "landjump", "Aascaff128", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 1948, "kbslotnu", "slot_black", 0x00000000);
	tmpobject = CreateDynamicObject(19277, 1117.335937, 1073.159423, 47.547096, -0.000007, 0.000015, 0.000022, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 11395, "corvinsign_sfse", "shutters", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 1, 9583, "bigshap_sfw", "sf_ship_glasst", 0x00000000);
	SetDynamicObjectMaterial(tmpobject, 2, 15040, "cuntcuts", "CsCrackpipe01", 0x00000000);
	tmpobject = CreateDynamicObject(9339, 1106.829101, 1075.754638, 46.316829, 0.000007, 90.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14776, "genintintcarint3", "tyretread_64H", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(9339, 1106.831054, 1074.527587, 46.322826, -0.000007, 90.000000, -89.999977, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 14776, "genintintcarint3", "tyretread_64H", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(19633, 1088.834228, 1074.925781, 9.845079, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	//SetDynamicObjectMaterial(tmpobject, 0, -1, "none", "none", 0xFFFFFFFF);
	SetDynamicObjectMaterial(tmpobject, 1, 3053, "magnetx", "magnetY", 0x00000000);
	tmpobject = CreateDynamicObject(1301, 1088.528930, 1074.902832, 9.873929, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 1093.019042, 1074.902832, 9.873929, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 1084.108764, 1074.902832, 9.873929, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 1088.563964, 1079.357910, 9.873929, 0.000000, 180.000000, 89.999969, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(1301, 1088.563964, 1070.447631, 9.873929, 0.000000, 180.000000, 89.999969, -1, -1, -1, 120.00, 120.00);
	SetDynamicObjectMaterial(tmpobject, 0, 15046, "svcunthoose", "GB_plug01", 0xFFFFFFFF);
	tmpobject = CreateDynamicObject(18646, 1052.167114, 1064.110107, 13.694700, 0.000014, 0.000002, 110.499931, -1, -1, -1, 120.00, 120.00);
	tmpobject = CreateDynamicObject(18074, 1111.353637, 1076.310302, 47.790390, -14.999990, 0.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
	tmpobject = CreateDynamicObject(2888, 1118.327514, 1075.227905, 50.118392, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
	tmpobject = CreateDynamicObject(2888, 1116.326660, 1075.227905, 50.118392, 0.000000, 0.000000, -90.000000, -1, -1, -1, 120.00, 120.00);

    //{#} Foguete Load
    e_SpaceData[E_ROCKET][0] = CreateDynamicObject(19731, 1089.180786, 1074.834594, 66.067726, 0.000000, -103.999954, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][0], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][1] = CreateDynamicObject(19732, 1087.756225, 1074.834594, 66.066947, 0.000000, -103.900154, 179.999404, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][1], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][2] = CreateDynamicObject(19690, 1089.905029, 1074.834594, 58.569099, 0.000000, -103.999984, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][2], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][3] = CreateDynamicObject(19691, 1087.070922, 1074.863891, 58.582176, 0.000000, -103.900123, 179.999588, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][3], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][4] = CreateDynamicObject(19646, 1091.039062, 1074.828735, 49.399105, 0.000000, -89.999977, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][4], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][5] = CreateDynamicObject(19646, 1085.866699, 1074.881469, 49.403102, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][5], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][6] = CreateDynamicObject(1683, 1093.355957, 1072.849121, 34.324974, 0.000000, -90.700012, -179.999862, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][6], 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][6], 1, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][6], 2, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][6], 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][6], 4, 2749, "cj_hair", "cj_spec", 0x00000000);
    e_SpaceData[E_ROCKET][7] = CreateDynamicObject(19316, 1088.456542, 1074.869384, 66.665817, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][7], 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][7], 3, 1948, "kbslotnu", "slot_black", 0x00000000);
    e_SpaceData[E_ROCKET][8] = CreateDynamicObject(19646, 1091.037109, 1074.836547, 39.499107, 0.000000, -89.999969, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][8], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][9] = CreateDynamicObject(19697, 1091.197998, 1074.400756, 22.320028, -0.699051, 81.299728, 89.963218, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][9], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][10] = CreateDynamicObject(19646, 1085.868652, 1074.883422, 39.503105, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][10], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][11] = CreateDynamicObject(19698, 1091.198486, 1076.210083, 22.380800, 0.699056, 83.500228, -90.036491, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][11], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][12] = CreateDynamicObject(19697, 1087.438964, 1071.973999, 22.278287, -0.699065, 79.199783, -0.036704, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][12], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][13] = CreateDynamicObject(19646, 1091.052734, 1074.848266, 29.549102, 0.000000, -89.999954, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][13], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][14] = CreateDynamicObject(19646, 1085.884277, 1074.895141, 29.553104, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][14], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][15] = CreateDynamicObject(19698, 1089.344238, 1071.973022, 22.325777, 0.699072, 82.100196, 179.963226, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][15], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][16] = CreateDynamicObject(19697, 1089.452026, 1077.703002, 22.373529, -0.699057, 79.899772, 179.963119, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][16], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][17] = CreateDynamicObject(19698, 1087.518432, 1077.734252, 22.412321, 0.699064, 82.300155, -0.036766, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][17], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][18] = CreateDynamicObject(19699, 1092.154418, 1078.592773, 31.870395, 0.000004, -89.999992, 43.699939, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][18], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][19] = CreateDynamicObject(19731, 1091.688842, 1078.146850, 46.446071, 0.000009, -103.999946, 44.299976, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][19], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][20] = CreateDynamicObject(19699, 1092.321289, 1071.191284, 31.870395, -0.000009, -89.999984, -46.000091, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][20], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][21] = CreateDynamicObject(19646, 1091.044921, 1074.842407, 24.379068, 0.000000, -89.999946, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][21], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][22] = CreateDynamicObject(19646, 1085.876464, 1074.889282, 24.387069, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][22], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][23] = CreateDynamicObject(19731, 1091.872924, 1071.654418, 46.446071, -0.000004, -103.999938, -45.400005, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][23], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET][24] = CreateDynamicObject(2643, 1090.467163, 1069.916015, 51.821605, 0.000000, 0.000000, 21.199993, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][24], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][25] = CreateDynamicObject(2643, 1093.168090, 1070.198242, 20.661619, 0.000004, 0.000004, 42.699977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][25], 0, 7103, "vgnplantgen", "metalwheel3_128", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][26] = CreateDynamicObject(2643, 1092.809570, 1079.742309, 20.661619, 0.000003, -0.000006, 143.199935, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][26], 0, 7103, "vgnplantgen", "metalwheel3_128", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][27] = CreateDynamicObject(2643, 1083.161987, 1074.873413, 32.931583, 0.000000, 0.000000, -90.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][27], 0, 1809, "cj_hi_fi", "cj_speaker_s", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][28] = CreateDynamicObject(2643, 1092.488159, 1071.392456, 51.821605, 0.000000, 0.000000, 48.699989, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][28], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][29] = CreateDynamicObject(2643, 1092.567749, 1078.169799, 51.821605, 0.000000, 0.000000, 125.999969, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][29], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][30] = CreateDynamicObject(2643, 1090.782470, 1079.619262, 51.821605, 0.000000, 0.000000, 156.299972, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][30], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][31] = CreateDynamicObject(2643, 1091.591796, 1070.568725, 53.631626, 0.000000, 0.000000, 40.999984, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][31], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][32] = CreateDynamicObject(2643, 1091.704101, 1078.997436, 53.621585, 0.000000, 0.000000, 139.699920, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][32], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][33] = CreateDynamicObject(2643, 1093.726440, 1075.093261, 28.871589, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][33], 0, 12853, "cunte_gas01", "starspangban1_256", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][34] = CreateDynamicObject(13649, 1091.472900, 1072.101562, 18.871910, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][34], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][34], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET][35] = CreateDynamicObject(13649, 1091.332763, 1077.821655, 18.871910, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][35], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][35], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET][36] = CreateDynamicObject(19756, 1087.459716, 1073.551025, 19.246540, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][36], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][37] = CreateDynamicObject(19756, 1087.529785, 1076.251831, 19.226541, 0.000000, 0.000000, 270.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][37], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][38] = CreateDynamicObject(19756, 1089.939697, 1074.860717, 19.238534, 0.000000, 0.000000, 180.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][38], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET][39] = CreateDynamicObject(13649, 1087.222534, 1074.941284, 18.871910, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][39], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][39], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET][40] = CreateDynamicObject(3504, 1093.296508, 1075.048095, 48.110359, 0.000000, 0.000000, 90.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][40], 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][40], 1, 1948, "kbslotnu", "slot_black", 0x00000000);
    e_SpaceData[E_ROCKET][41] = CreateDynamicObject(18846, 1091.487426, 1077.856689, 18.703886, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][41], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][41], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET][42] = CreateDynamicObject(18846, 1091.487426, 1072.126098, 18.703886, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][42], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][42], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET][43] = CreateDynamicObject(18846, 1087.117065, 1074.996459, 18.703886, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][43], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET][43], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET][44] = CreateDynamicObject(18694, 1086.649780, 1073.401611, 17.843692, -90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET][45] = CreateDynamicObject(18694, 1087.590698, 1073.401611, 17.843692, -90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET][46] = CreateDynamicObject(18694, 1091.050415, 1070.420166, 17.633687, -89.999992, 89.999992, 89.999992, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET][47] = CreateDynamicObject(18694, 1091.991333, 1070.420166, 17.633687, -89.999992, 89.999992, 89.999992, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET][48] = CreateDynamicObject(18694, 1091.050415, 1076.129394, 17.633687, -89.999992, 89.999992, 89.999977, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET][49] = CreateDynamicObject(18694, 1091.991333, 1076.129394, 17.633687, -89.999992, 89.999992, 89.999977, -1, -1, -1, 120.00, 120.00);


    e_SpaceData[E_ROCKET_SPACE][0] = CreateDynamicObject(19731, 814.818725, 1353.782592, 1113.977905+250.000000, 0.000000, -103.999946, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][0], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][1] = CreateDynamicObject(19732, 813.394165, 1353.782592, 1113.977172+250.000000, 0.000000, -103.900161, 179.999359, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][1], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][2] = CreateDynamicObject(19690, 815.542968, 1353.782592, 1106.479370+250.000000, 0.000000, -103.999977, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][2], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][3] = CreateDynamicObject(19691, 812.708862, 1353.811889, 1106.492431+250.000000, 0.000000, -103.900131, 179.999542, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][3], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][4] = CreateDynamicObject(19646, 816.677001, 1353.776733, 1097.309326+250.000000, 0.000000, -89.999969, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][4], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][5] = CreateDynamicObject(19646, 811.504638, 1353.829467, 1097.313354+250.000000, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][5], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][6] = CreateDynamicObject(1683, 818.993896, 1351.797119, 1082.235229+250.000000, 0.000000, -90.700019, -179.999816, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][6], 0, 19480, "signsurf", "sign", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][6], 1, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][6], 2, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][6], 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][6], 4, 2749, "cj_hair", "cj_spec", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][7] = CreateDynamicObject(19316, 814.094482, 1353.817382, 1114.576049+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][7], 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][7], 3, 1948, "kbslotnu", "slot_black", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][8] = CreateDynamicObject(19646, 816.675048, 1353.784545, 1087.409301+250.000000, 0.000000, -89.999961, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][8], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][9] = CreateDynamicObject(19697, 816.835937, 1353.348754, 1070.230224+250.000000, -0.699042, 81.299728, 89.963195, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][9], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET_SPACE][10] = CreateDynamicObject(19646, 811.506591, 1353.831420, 1087.413330+250.000000, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][10], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][11] = CreateDynamicObject(19698, 816.836425, 1355.158081, 1070.291015+250.000000, 0.699047, 83.500228, -90.036468, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][11], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET_SPACE][12] = CreateDynamicObject(19697, 813.076904, 1350.921997, 1070.188476+250.000000, -0.699064, 79.199790, -0.036703, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][12], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][13] = CreateDynamicObject(19646, 816.690673, 1353.796264, 1077.459350+250.000000, 0.000000, -89.999946, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][13], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][14] = CreateDynamicObject(19646, 811.522216, 1353.843139, 1077.463378+250.000000, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][14], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][15] = CreateDynamicObject(19698, 814.982177, 1350.921020, 1070.235961+250.000000, 0.699070, 82.100189, 179.963180, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][15], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET_SPACE][16] = CreateDynamicObject(19697, 815.089965, 1356.651000, 1070.283691+250.000000, -0.699056, 79.899765, 179.963073, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][16], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET_SPACE][17] = CreateDynamicObject(19698, 813.156372, 1356.682250, 1070.322509+250.000000, 0.699063, 82.300163, -0.036766, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][17], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][18] = CreateDynamicObject(19699, 817.792358, 1357.540771, 1079.780639+250.000000, 0.000009, -89.999984, 43.699939, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][18], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][19] = CreateDynamicObject(19731, 817.326782, 1357.094848, 1094.356323+250.000000, 0.000014, -103.999938, 44.299976, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][19], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET_SPACE][20] = CreateDynamicObject(19699, 817.959228, 1350.139282, 1079.780639+250.000000, -0.000014, -89.999977, -46.000091, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][20], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][21] = CreateDynamicObject(19646, 816.682861, 1353.790405, 1072.289306+250.000000, 0.000000, -89.999938, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][21], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][22] = CreateDynamicObject(19646, 811.514404, 1353.837280, 1072.297241+250.000000, 0.000000, -270.000000, -0.000029, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][22], 0, 1948, "kbslotnu", "slot_black", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][23] = CreateDynamicObject(19731, 817.510864, 1350.602416, 1094.356323+250.000000, -0.000009, -103.999931, -45.400005, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][23], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFDCDCDC);
    e_SpaceData[E_ROCKET_SPACE][24] = CreateDynamicObject(2643, 816.105102, 1348.864013, 1099.731811+250.000000, 0.000001, 0.000007, 21.199987, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][24], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][25] = CreateDynamicObject(2643, 818.806030, 1349.146240, 1068.571899+250.000000, 0.000009, 0.000009, 42.699977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][25], 0, 7103, "vgnplantgen", "metalwheel3_128", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][26] = CreateDynamicObject(2643, 818.447509, 1358.690307, 1068.571899+250.000000, 0.000007, -0.000012, 143.199935, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][26], 0, 7103, "vgnplantgen", "metalwheel3_128", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][27] = CreateDynamicObject(2643, 808.799926, 1353.821411, 1080.841796+250.000000, -0.000007, 0.000000, -89.999977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][27], 0, 1809, "cj_hi_fi", "cj_speaker_s", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][28] = CreateDynamicObject(2643, 818.126098, 1350.340454, 1099.731811+250.000000, 0.000004, 0.000004, 48.699977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][28], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][29] = CreateDynamicObject(2643, 818.205688, 1357.117797, 1099.731811+250.000000, 0.000006, -0.000003, 125.999946, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][29], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][30] = CreateDynamicObject(2643, 816.420410, 1358.567260, 1099.731811+250.000000, 0.000003, -0.000006, 156.299926, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][30], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][31] = CreateDynamicObject(2643, 817.229736, 1349.516723, 1101.541870+250.000000, 0.000004, 0.000004, 40.999980, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][31], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][32] = CreateDynamicObject(2643, 817.342041, 1357.945434, 1101.531860+250.000000, 0.000003, -0.000004, 139.699874, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][32], 0, 2749, "cj_hair", "cj_spec", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][33] = CreateDynamicObject(2643, 819.364379, 1354.041259, 1076.781860+250.000000, 0.000007, 0.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][33], 0, 12853, "cunte_gas01", "starspangban1_256", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][34] = CreateDynamicObject(13649, 817.110839, 1351.049560, 1066.782104+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][34], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][34], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][35] = CreateDynamicObject(13649, 816.970703, 1356.769653, 1066.782104+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][35], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][35], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][36] = CreateDynamicObject(19756, 813.097656, 1352.499023, 1067.156738+250.000000, 0.000007, 0.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][36], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][37] = CreateDynamicObject(19756, 813.167724, 1355.199829, 1067.136718+250.000000, -0.000007, 0.000000, -89.999977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][37], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][38] = CreateDynamicObject(19756, 815.577636, 1353.808715, 1067.148803+250.000000, 0.000000, -0.000007, 179.999954, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][38], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    e_SpaceData[E_ROCKET_SPACE][39] = CreateDynamicObject(13649, 812.860473, 1353.889282, 1066.782104+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][39], 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][39], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][40] = CreateDynamicObject(3504, 818.934448, 1353.996093, 1096.020629+250.000000, 0.000007, 0.000000, 89.999977, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][40], 0, 1982, "new_cabinets", "cabinet_hi1b", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][40], 1, 1948, "kbslotnu", "slot_black", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][41] = CreateDynamicObject(18846, 817.125366, 1356.804687, 1066.614135+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][41], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][41], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][42] = CreateDynamicObject(18846, 817.125366, 1351.074096, 1066.614135+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][42], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][42], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][43] = CreateDynamicObject(18846, 812.755004, 1353.944458, 1066.614135+250.000000, 0.000000, 180.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][43], 0, 15040, "cuntcuts", "CsCrackpipe01", 0xFFFFFFFF);
    SetDynamicObjectMaterial(e_SpaceData[E_ROCKET_SPACE][43], 1, 3922, "bistro", "vent_64", 0x00000000);
    e_SpaceData[E_ROCKET_SPACE][44] = CreateDynamicObject(18694, 817.437011, 1349.471069, 1065.126953+250.000000, -90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET_SPACE][45] = CreateDynamicObject(18694, 816.906555, 1349.471069, 1065.126953+250.000000, -90.000000, 0.000000, 0.000000, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET_SPACE][46] = CreateDynamicObject(18694, 817.437011, 1355.100585, 1065.126953+250.000000, -89.999992, 89.999992, 89.999977, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET_SPACE][47] = CreateDynamicObject(18694, 816.906555, 1355.100585, 1065.126953+250.000000, -89.999992, 89.999992, 89.999977, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET_SPACE][48] = CreateDynamicObject(18694, 812.997070, 1352.348876, 1065.126953+250.000000, -89.999992, 90.000000, 89.999969, -1, -1, -1, 120.00, 120.00);
    e_SpaceData[E_ROCKET_SPACE][49] = CreateDynamicObject(18694, 812.466613, 1352.348876, 1065.126953+250.000000, -89.999992, 90.000000, 89.999969, -1, -1, -1, 120.00, 120.00);
}
static stock SetAstronautaPlayer(playerid){

    SetPlayerAttachedObject(playerid, 0, 19063, 2, 0.0850, 0.0390, 0.0000, 0.0000, -96.5999, 0.0000, 0.3470, 0.3689, 0.3970, 0, -16777216);
    SetPlayerAttachedObject(playerid, 1, 19200, 2, 0.1289, -0.0329, 0.0030, 2.4000, -5.9999, -82.8999, 1.4609, 1.5759, 1.7020, 0, 0);
    SetPlayerAttachedObject(playerid, 2, 2186, 1, -0.3109, -0.1409, 0.0080, -0.2999, 89.0000, -92.5000, 0.2010, 0.5339, 0.5859, -1, 0);
    SetPlayerAttachedObject(playerid, 3, 19280, 2, 0.3389, 0.0430, 0.0359, 0.0000, 82.0999, 0.0000, 0.3639, 0.5609, 0.3529, 0, 0);
    SetPlayerAttachedObject(playerid, 4, 3675, 1, 0.4619, -0.1650, -0.0099, 0.0000, 90.6000, 0.0000, 0.0399, 0.0480, 0.0489, -1, 0);
    SetPlayerAttachedObject(playerid, 5, 1654, 1, 0.1819, -0.2980, -0.2150, 0.0000, 94.3999, 80.0999, 1.0000, 1.0000, 1.0000, 318767103, 0);
    SetPlayerAttachedObject(playerid, 6, 3384, 1, -0.0540, -0.4599, -0.0099, 0.0000, 89.1999, 85.3000, 0.2300, 0.2630, 0.1870, -1, 0);
    SetPlayerAttachedObject(playerid, 7, 1279, 1, -0.5029, -0.3149, -0.0149, 0.0000, 89.4999, 0.0000, 0.6150, 0.9409, 0.9809, -1, 0);
    SetPlayerAttachedObject(playerid, 8, 2711, 1, 0.5529, -0.1939, 0.2689, 0.0000, 87.3999, 0.0000, 1.1739, 1.1319, 2.4909, -1, 0);
    SetPlayerAttachedObject(playerid, 9, 2711, 1, 0.5709, -0.2039, -0.2469, 0.0000, 87.3999, 178.1999, 1.1739, 1.1319, 2.4909, 0, 0);	
	return 1;
}