function AuthController()
	print "AuthController start"
	m.authScreen = CreateObject("roSGNode", "Dialog")

    m.authScreen.SetFields({
        title: "Log In Options"
        message: "Choose an option below to log in"
        bulletText: ["Email/Password - Log in with your email address and password", "Pairing Code - log in with a 4-digit code"]
        buttons: ["Email/Password", "Pairing Code"]
        iconUri: ""
    })

    m.authScreen.buttonGroup.SetFields({
        ' layoutDirection: "horiz"
        ' horizAlignment: "center"
        ' itemSpacings: [0, 100]
        iconUri: ""
        focusedIconUri: ""
        ' maxWidth: 35
    })

    m.authScreen.ObserveField("buttonSelected", "OnAuthButtonSelected")

    m.top.ComponentController.CallFunc("show", {
        view: m.authScreen
    })

    print "AuthController end" 
end function

function OnAuthButtonSelected()
    if m.authScreen.buttonSelected = 0 then
        LoginController()
    else if m.authScreen.buttonSelected = 1 then
        PairingController()
    end if
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if key = "back" then
            m.authScreen.close = true
            handled = true
        end if
    end if
    return handled
end function