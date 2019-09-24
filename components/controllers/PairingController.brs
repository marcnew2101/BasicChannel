function PairingController()
	print "PairingController start"

	m.pairingScreen = CreateObject("roSGNode", "ParagraphView")

    pairingContent = CreateObject("roSGNode", "ContentNode")

    header = pairingContent.CreateChild("ContentNode")
	header.paragraph = "Paragraph Text"
	header.AddField("paragraphType", "string", true)
	header.paragraphType = "linkingCode"

	m.pairingScreen.content = pairingContent
	m.pairingScreen.buttons = GetButtons()

	m.pairingScreen.ObserveField("buttonSelected", "OnButtonSelected")

    m.top.ComponentController.CallFunc("show", {
        view: m.pairingScreen
    })

	print "PairingController end"
end function

function GetButtons() as Object
    buttons = CreateObject("roSGNode", "ContentNode")
    btn1 = buttons.CreateChild("ContentNode")
    btn1.title = "Reload linking code"
    btn1.id = "codeButton"
    return buttons
end function

sub OnButtonSelected(event as Object)
    ?"OnButtonSelected"
    buttonIndex = event.GetData()
    button = m.pairingScreen.buttons.GetChild(buttonIndex)
    if button.id = "codeButton"
        ' You can reset content with config to trigger 
        ' content handler for fetching new linking code
        ' the entire screen will be reloaded in such case
        ' content = CreateObject("roSGNode", "ContentNode")
        ' content.AddFields({
        '     HandlerConfigParagraph: {
        '         name: "CHRoot"
        '     }
        ' })
        ' m.paragraphView.content = content
        ' Or you can fetch new linking code by your own 
        ' and just set it to the appropriate content node
        code = (1000 + Rnd(8999)).ToStr()
        content = m.pairingScreen.content.Clone(true)
        linkingCodeIndex = content.GetChildCount() - 1 ' linking code is the last child in our sample
        content.GetChild(linkingCodeIndex).text = code
        m.pairingScreen.content = content
    end if
end sub