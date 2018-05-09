/*
	---------------------------------------

		Animated Textdraw
		@author: Ino
		@version: 1.0.0
		@release: 09/05/2018
		@build: 1	
		@download: github.com/Ino-Bagaric/animated-textdraw

	---------------------------------------

	 	Changelog:

	 		09-05-2018:
	 			Initial release
	 		
	 	Thanks to:
	 		Muma - Idea
	 		(profile: http://balkan-samp.com/forum/index.php?action=profile;u=20783)

	---------------------------------------

		Callbacks:
			OnTextdrawAnimationFinish(playerid, PlayerText:textdraw);

		Methods:
			CreateTextdrawAnimation(playerid, PlayerText:textdraw, frame, color[], string[]);

*/

#define _INC_ANIMATED_TD // For other includes

#if !defined MAX_ANIM_DATA
	#define MAX_ANIM_DATA 100
#endif

#if !defined MAX_ANIM_STRING
	#define MAX_ANIM_STRING 512
#endif

enum E_ANIM_DATA
{
	data_string[MAX_ANIM_STRING],
	data_frame,
	data_chars, 
	data_color[4],
	data_color_1[15],
	data_color_2[15]
}
static AnimData[MAX_ANIM_DATA][E_ANIM_DATA];

forward OnTextdrawAnimationFinish(playerid, PlayerText:textdraw);

static FindFreeAnimDataID()
{
	for (new i = 0; i < MAX_ANIM_DATA; i++) {
		if (strlen(AnimData[i][data_string]) <= 0) {
			return i;
		}
	}
	return -1;
}

stock CreateTextdrawAnimation(playerid, PlayerText:textdraw, frame, color[], string[])
{
	new id = FindFreeAnimDataID();
	if (id == -1) return 1;

	for (new i = 0; i < strlen(string); i++) {
		if (string[i] == ' ') {
			string[i] = '_';
		}
	}

	AnimData[id][data_chars] = 0;
	AnimData[id][data_frame] = frame;
	format (AnimData[id][data_string], MAX_ANIM_STRING, "%s", string);
	format (AnimData[id][data_color], 4, "%s", color);
	format (AnimData[id][data_color_1], 15, "%s~h~~h~~h~", color);
	format (AnimData[id][data_color_2], 15, "%s~h~~h~", color);
	PlayerTextDrawSetString(playerid, textdraw, "");

	SetTimerEx("UpdateTextdrawAnimation", frame, false, "iii", playerid, _:textdraw, id);
	return 1;
}

forward UpdateTextdrawAnimation(playerid, PlayerText:textdraw, id);
public UpdateTextdrawAnimation(playerid, PlayerText:textdraw, id)
{
	new tmp[MAX_ANIM_STRING];
	new len = strlen(AnimData[id][data_string]);
	new idx = AnimData[id][data_chars]++;

	if (AnimData[id][data_string][idx] == '~') {
		AnimData[id][data_chars] += 3;
		idx += 3;
	}

	strmid(tmp, AnimData[id][data_string], 0, idx);	

	if (idx < len) {
		if (idx > 2 && (tmp[idx - 2] != '~' && tmp[idx - 1] != '~' && tmp[idx] != '~') ) {
			strins(tmp, AnimData[id][data_color_2], idx - 2);
			strins(tmp, AnimData[id][data_color_1], idx + strlen(AnimData[id][data_color_2]) - 1);
		}

		SetTimerEx("UpdateTextdrawAnimation", AnimData[id][data_frame], false, "iii", playerid, _:textdraw, id);
	} else {
		format (AnimData[id][data_string], MAX_ANIM_STRING, "");
		CallRemoteFunction("OnTextdrawAnimationFinish", "ii", playerid, _:textdraw);
	}

	strins(tmp, AnimData[id][data_color], 0);
	PlayerTextDrawSetString(playerid, textdraw, tmp);
	return 1;
}
