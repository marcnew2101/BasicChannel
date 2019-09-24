function LaunchController()
	print "LaunchController start"
    m.launch = CreateObject("roSGNode", "LaunchScreen")

    m.launch.observeField("buttonLogin", "OnLoginButtonSelected")
    m.launch.observeField("buttonSignUp", "OnSignUpButtonSelected")
    
    m.top.ComponentController.CallFunc("show", {
        view: m.launch
    })
    print "LaunchController end" 
end function

function OnLoginButtonSelected()
	print "Log in button selected"
	TempController()
end function

function OnSignUpButtonSelected()
	print "Sign up button selected"
    SignUpController()
end function