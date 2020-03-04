/*
    File: fn_welcomeNotification.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='A3C\resource\image\A3AS.paa'/></t><br /><br />";
_message = _message + "Antistasi by Barbolani and the Official Antistasi Community, this version is further edited by rory-dev and the A3 Community.<br /><br />";
_message = _message + "We still expect bugs on this version and will release new features and content over the next few weeks.<br /><br />";
_message = _message + "You will need to join TS and please submit feedback on the discord:<br /><br />";
_message = _message + "<a color='#00DFFF'>•</a> Teamspeak (required): <a href='ts3server://ts.a3command.com' color='#56BDD6'> ts.a3command.com</a><br />";
_message = _message + "<a color='#00DFFF'>•</a> Discord: <a href='https://discord.a3command.com' color='#56BDD6'> discord.a3command.com</a><br /><br />";
_message = _message + "Thanks for joining and enjoy your stay, A3 Command Team.<br />";
_message = _message + "Check the Map Briefing for further info and join us on Teamspeak";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
