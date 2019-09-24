function init()
	print "LaunchScreen start"

    m.buttonLogin = m.top.FindNode("buttonLogin")
    m.buttonSignUp = m.top.FindNode("buttonSignUp")
    
    m.buttonLogin.SetFields({
    	text: "Current Subscriber - Log In"
    	minWidth: 200
    	translation: [300,800]
    	showFocusFootprint: true
    '     focusBitmapUri  : "pkg:/images/button_on.9.png"
        focusedIconUri  : ""
        iconUri: ""
    })

    m.buttonSignUp.SetFields({
    	text: "New Subscriber - Sign Up"
    	minWidth: 200
    	translation: [1000,800]
    	showFocusFootprint: true
    '     focusBitmapUri  : "pkg:/images/button_on.9.png"
    	focusedIconUri  : ""
        iconUri: ""
    })
    
    print "LaunchScreen end"
end function

function onKeyEvent(key as String, Pressed as Boolean) as Boolean
    result = false
    if Pressed AND (key = "left" OR key = "right" OR key = "up" OR key = "down") then
        buttonFocused = m.buttonLogin.hasFocus()
        m.buttonLogin.setFocus(not buttonFocused)
        m.buttonSignup.setFocus(buttonFocused)
        result = true
    end if
    return result
end function