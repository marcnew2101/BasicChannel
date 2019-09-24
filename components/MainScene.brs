sub Show(args as Object)
    print "MainScene start"

    LaunchController()

    print "MainScene end" 
end sub

' sub OnGridItemSelected(event as Object)
'     grid = event.GetRoSGNode()
'     selectedIndex = event.GetData()
'     rowContent = grid.content.GetChild(selectedIndex[0])
'     detailsView = ShowDetailsView(rowContent, selectedIndex[1])
'     detailsView.ObserveField("wasClosed", "OnDetailsWasClosed")
' end sub

' sub OnDetailsWasClosed(event as Object)
'     details = event.GetRoSGNode()
'     m.grid.jumpToRowItem = [m.grid.rowItemFocused[0], details.itemFocused]
' end sub