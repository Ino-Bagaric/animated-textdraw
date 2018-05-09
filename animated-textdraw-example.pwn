#include <a_samp>
#include <zcmd>
#include <animated-textdraw>

new PlayerText:Textdraw0[MAX_PLAYERS];
new PlayerText:Textdraw1[MAX_PLAYERS];

public OnTextdrawAnimationFinish(playerid, PlayerText:textdraw)
{
	SendClientMessage(playerid, -1, "> Animation finished");
	printf("Textdraw animation finished %d", _:textdraw);
	return 1;
}

CMD:show(playerid, arg[])
{
	PlayerTextDrawShow(playerid, Textdraw0[playerid]);
	PlayerTextDrawShow(playerid, Textdraw1[playerid]);
	return 1;
}


CMD:hide(playerid, arg[])
{
	PlayerTextDrawHide(playerid, Textdraw0[playerid]);
	PlayerTextDrawHide(playerid, Textdraw1[playerid]);
	return 1;
}

CMD:anim(playerid, arg[])
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 100, "~p~", arg);
	return 1;
}

CMD:anim2(playerid, arg[])
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 75, "~p~", "\
		Lorem Ipsum is simply dummy~n~\
		text of the printing and typesetting industry.~n~\
		Lorem Ipsum has been the industry's standard dummy~n~\
		text ever since the 1500s, when an unknown printer~n~\
		took a galley of type and scrambled it to make a type~n~\
		specimen book. It has survived not only five centuries,~n~\
		but also the leap into electronic typesetting, remaining~n~\
		essentially unchanged. It was popularised in the 1960s~n~\
		with the release of Letraset sheets containing Lorem Ipsum passages");

	return 1;
}

CMD:anim3(playerid, arg[])
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 50, "~b~", "\
		Lorem Ipsum is simply dummy~n~\
		text of the printing and typesetting industry.~n~\
		Lorem Ipsum has been the industry's standard dummy~n~\
		text ever since the 1500s, when an unknown printer~n~\
		took a galley of type and scrambled it to make a type~n~\
		specimen book. It has survived not only five centuries,~n~\
		but also the leap into electronic typesetting, remaining~n~\
		essentially unchanged. It was popularised in the 1960s~n~\
		with the release of Letraset sheets containing Lorem Ipsum passages");

	return 1;
}

CMD:anim4(playerid, arg[])
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 35, "~y~", "\
		Lorem Ipsum is simply dummy~n~\
		text of the printing and typesetting industry.~n~\
		Lorem Ipsum has been the industry's standard dummy~n~\
		text ever since the 1500s, when an unknown printer~n~\
		took a galley of type and scrambled it to make a type~n~\
		specimen book. It has survived not only five centuries,~n~\
		but also the leap into electronic typesetting, remaining~n~\
		essentially unchanged. It was popularised in the 1960s~n~\
		with the release of Letraset sheets containing Lorem Ipsum passages");

	return 1;
}

CMD:anim5(playerid, arg[])
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 30, "~r~", "\
		Lorem Ipsum is simply dummy~n~\
		text of the printing and typesetting industry.~n~\
		Lorem Ipsum has been the industry's standard dummy~n~\
		text ever since the 1500s, when an unknown printer~n~\
		took a galley of type and scrambled it to make a type~n~\
		specimen book. It has survived not only five centuries,~n~\
		but also the leap into electronic typesetting, remaining~n~\
		essentially unchanged. It was popularised in the 1960s~n~\
		with the release of Letraset sheets containing Lorem Ipsum passages");

	return 1;
}

CMD:animzombie(playerid, arg[])
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 50, "~r~", "\
		Lorem Ipsum is simply dummy~n~\
		text of the printing and typesetting industry.~n~\
		Lorem Ipsum has been the industry's standard dummy~n~\
		text ever since the 1500s, when an unknown printer~n~\
		took a galley of type and scrambled it to make a type~n~\
		specimen book. It has survived not only five centuries,~n~\
		but also the leap into electronic typesetting, remaining~n~\
		essentially unchanged. It was popularised in the 1960s~n~\
		with the release of Letraset sheets containing Lorem Ipsum passages");

	SetTimerEx("NewAnim", 260, false, "i", playerid);

	return 1;
}

forward NewAnim(playerid);
public NewAnim(playerid)
{
	CreateTextdrawAnimation(playerid, Textdraw1[playerid], 50, "~r~", "\
		Lorem Ipsum is simply dummy~n~\
		text of the printing and typesetting industry.~n~\
		Lorem Ipsum has been the industry's standard dummy~n~\
		text ever since the 1500s, when an unknown printer~n~\
		took a galley of type and scrambled it to make a type~n~\
		specimen book. It has survived not only five centuries,~n~\
		but also the leap into electronic typesetting, remaining~n~\
		essentially unchanged. It was popularised in the 1960s~n~\
		with the release of Letraset sheets containing Lorem Ipsum passages");
	return 1;
}


public OnFilterScriptInit()
{
	for (new i = 0; i < MAX_PLAYERS; i++) {
		if (IsPlayerConnected(i)) {
			GenerateInterface(i);
		}
	}
	return 1;
}


public OnFilterScriptExit()
{
	for (new i = 0; i < MAX_PLAYERS; i++) {
		if (IsPlayerConnected(i)) {
			GenerateInterface(i, false);
		}
	}
	return 1;
}


public OnPlayerConnect(playerid)
{
	GenerateInterface(playerid);
	return 1;
}


public OnPlayerDisconnect(playerid, reason)
{
	GenerateInterface(playerid, false);
	return 1;
}


stock GenerateInterface(playerid, bool:create = true)
{
	if (create) {
		Textdraw0[playerid] = CreatePlayerTextDraw(playerid,650.000000, -4.000000, "_");
		PlayerTextDrawBackgroundColor(playerid,Textdraw0[playerid], 255);
		PlayerTextDrawFont(playerid,Textdraw0[playerid], 1);
		PlayerTextDrawLetterSize(playerid,Textdraw0[playerid], 0.500000, 51.000000);
		PlayerTextDrawColor(playerid,Textdraw0[playerid], -1);
		PlayerTextDrawSetOutline(playerid,Textdraw0[playerid], 0);
		PlayerTextDrawSetProportional(playerid,Textdraw0[playerid], 1);
		PlayerTextDrawSetShadow(playerid,Textdraw0[playerid], 1);
		PlayerTextDrawUseBox(playerid,Textdraw0[playerid], 1);
		PlayerTextDrawBoxColor(playerid,Textdraw0[playerid], 255);
		PlayerTextDrawTextSize(playerid,Textdraw0[playerid], -10.000000, 0.000000);
		PlayerTextDrawSetSelectable(playerid,Textdraw0[playerid], 0);

		Textdraw1[playerid] = CreatePlayerTextDraw(playerid,320.000000, 330.000000, "");
		PlayerTextDrawAlignment(playerid,Textdraw1[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,Textdraw1[playerid], 255);
		PlayerTextDrawFont(playerid,Textdraw1[playerid], 2);
		PlayerTextDrawLetterSize(playerid,Textdraw1[playerid], 0.260000, 1.000000);
		PlayerTextDrawColor(playerid,Textdraw1[playerid], -1);
		PlayerTextDrawSetOutline(playerid,Textdraw1[playerid], 1);
		PlayerTextDrawSetProportional(playerid,Textdraw1[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,Textdraw1[playerid], 0);
	} else {
		PlayerTextDrawDestroy(playerid, Textdraw0[playerid]);
		PlayerTextDrawDestroy(playerid, Textdraw1[playerid]);
	}
	return 1;
}