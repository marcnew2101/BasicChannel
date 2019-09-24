function LoginController()
	print "LoginController start"

	m.login = CreateObject("roSGNode", "EntitlementView")

    m.login.SetFields({
        prepopulateEmail: true
    })

    content = CreateObject("roSGNode", "ContentNode")

    content.AddFields({
        handlerConfigEntitlement: {
            name: "HandlerEntitlement"
        }
    })

    m.login.content = content

    m.top.ComponentController.CallFunc("show", {
        view: m.login
    })

    print "LoginController end" 
end function