-----------------------------------------------------------------------------------------
-- Override the restart button
-----------------------------------------------------------------------------------------
include( "PopupDialog" )

local m_kPopupDialog

function OnReallyRestart()
    -- Start a fresh game using the existing game configuration.
    LuaEvents.RestartGame() -- add the function(s) you want to call before restarting a game to this lua event : LuaEvents.RestartGame.Add(myFunction)
    Network.RestartGame()
end

function OnRestartGame()
    ContextPtr:LookUpControl("/InGame/TopOptionsMenu/"):SetHide(true)
    if (not m_kPopupDialog:IsOpen()) then
        m_kPopupDialog:AddText(      Locale.Lookup("LOC_GAME_MENU_RESTART_WARNING"))
        m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), OnNo )
        m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), OnReallyRestart, nil, nil, "PopupButtonInstanceRed" )
        m_kPopupDialog:Open()
    end
end

function OnNo()
    ContextPtr:LookUpControl("/InGame/TopOptionsMenu/"):SetHide(false)
end

function Initialize()
    m_kPopupDialog = PopupDialog:new( "ModInGame" )
end