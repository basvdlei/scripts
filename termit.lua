require("termit.colormaps")
require("termit.utils")

-- Modified default example config

defaults = {}
defaults.windowTitle = 'Termit'
defaults.tabName = 'Terminal'
defaults.encoding = 'UTF-8'
defaults.wordChars = '+-AA-Za-z0-9,./?%&#:_~'
defaults.font = 'Bitstream Vera Sans Mono 12'
defaults.foregroundColor = 'lightgreen'
defaults.backgroundColor = 'black'
defaults.showScrollbar = false
defaults.transparency = 0.1
--defaults.imageFile = '/tmp/img.png'
defaults.hideSingleTab = false
defaults.hideTabbar = false
defaults.showBorder = true
defaults.hideMenubar = true
defaults.fillTabbar = true
defaults.scrollbackLines = 10240
defaults.geometry = '80x24'
defaults.allowChangingTitle = false
--defaults.backspaceBinding = 'AsciiBksp'
--defaults.deleteBinding = 'AsciiDel'
defaults.tabPos = 'Right'
defaults.setStatusbar = function (tabInd)
    tab = tabs[tabInd]
    if tab then
        return tab.encoding..'  Bksp: '..tab.backspaceBinding..'  Del: '..tab.deleteBinding
    end
    return ''
end
defaults.colormap = termit.colormaps.delicate
defaults.matches = {['http[^ ]+'] = function (url) print('Matching url: '..url) end}
--defaults.tabs = {{title = 'Test new tab 1'; workingDir = '/tmp'};
    --{title = 'Test new tab 2'; workingDir = '/tmp'}}
setOptions(defaults)

bindKey('Ctrl-t', nil)
bindKey('CtrlShift-t', openTab)
bindKey('Ctrl-w', nil)
bindKey('CtrlShift-w', closeTab)
bindKey('Ctrl-Page_Up', prevTab)
bindKey('Ctrl-Page_Down', nextTab)
bindKey('CtrlShift-/', findDlg)
bindKey('CtrlShift-m', toggleMenubar)

-- 
userMenu = {}
table.insert(userMenu, {name='Close tab', action=closeTab})
table.insert(userMenu, {name='New tab name', action=function () setTabTitle('New tab name') end})
table.insert(userMenu, {name='set red color', action=function () setTabForegroundColor('red') end})
table.insert(userMenu, {name='Reconfigure', action=reconfigure, accel='Ctrl-r'})
table.insert(userMenu, {name='Selection', action=function () print(selection()) end})
table.insert(userMenu, {name='dumpAllRows', action=function () forEachRow(print) end})
table.insert(userMenu, {name='dumpVisibleRowsToFile',
    action=function () termit.utils.dumpToFile(forEachVisibleRow, '/tmp/termit.dump') end})
table.insert(userMenu, {name='findNext', action=findNext, accel='Alt-n'})
table.insert(userMenu, {name='findPrev', action=findPrev, accel='Alt-p'})
table.insert(userMenu, {name='new colormap', action=function () setColormap(termit.colormaps.mikado) end})
table.insert(userMenu, {name='toggle menubar', action=function () toggleMenubar() end})
table.insert(userMenu, {name='toggle tabbar', action=function () toggleTabbar()  end})

mi = {}
mi.name = 'Get tab info'
mi.action = function ()
    tab = tabs[currentTabIndex()]
    if tab then
        termit.utils.printTable(tab, '  ')
    end
end
table.insert(userMenu, mi)

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    setTabFont(string.sub(tab.font, 1, string.find(tab.font, '%d+$') - 1)..(tab.fontSize + delta))
end

table.insert(userMenu, {name='Increase font size', action=function () changeTabFontSize(1) end})
table.insert(userMenu, {name='Decrease font size', action=function () changeTabFontSize(-1) end})
table.insert(userMenu, {name='feed example', action=function () feed('example') end})
table.insert(userMenu, {name='feedChild example', action=function () feedChild('date\n') end})
table.insert(userMenu, {name='move tab left', action=function () setTabPos(currentTabIndex() - 1) end})
table.insert(userMenu, {name='move tab right', action=function () setTabPos(currentTabIndex() + 1) end})
table.insert(userMenu, {name='User quit', action=quit})

addMenu(userMenu, "User menu")
addPopupMenu(userMenu, "User menu")
