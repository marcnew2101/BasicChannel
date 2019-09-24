function TempController()
	print "TempController start"
	m.tempScreen = CreateObject("roSGNode", "AuthScreen")

    m.tempDialog = m.tempScreen.FindNode("dialog")

    m.tempDialog.SetFields({
        title: "Log In Options"
        message: "Choose an option below to log in"
        bulletText: ["Email/Password - Log in with your email address and password", "Pairing Code - log in with a 4-digit code"]
        buttons: ["Email/Password", "Pairing Code"]
        iconUri: ""
    })

    m.tempDialog.buttonGroup.SetFields({
        ' layoutDirection: "horiz"
        ' horizAlignment: "center"
        ' itemSpacings: [0, 100]
        iconUri: ""
        focusedIconUri: ""
        ' maxWidth: 35
    })

    m.top.GetScene().dialog = m.tempDialog

    m.tempDialog.ObserveField("buttonSelected", "OnTempButtonSelected")
    m.top.observeField("focusedChild", "OnFocusedChildChange")

    m.top.ComponentController.CallFunc("show", {
        view: m.tempScreen
    })

    print "TempController end" 
end function

function OnTempButtonSelected()
    if m.tempScreen.buttonSelected = 0 then
        LoginController()
    else if m.tempScreen.buttonSelected = 1 then
        PairingController()
    end if
end function

Sub OnFocusedChildChange()
    if m.top.isInFocusChain() and not m.tempDialog.buttonGroup.isInFocusChain() then
        m.tempDialog.buttonGroup.setFocus(true)
    end if
End Sub

' function onKeyEvent(key as String, press as Boolean) as Boolean
'     handled = false
'     if press then
'         if key = "back" then
'             m.tempScreen.close = true
'             handled = true
'         end if
'     end if
'     return handled
' end function