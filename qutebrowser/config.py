import json
import os

colors_f = open(os.path.expanduser('~/.cache/wal/colors.json'))
colors = json.load(colors_f)
colors_f.close()

bg, fg, cursor = list(colors['special'].values())
color = list(colors['colors'].values())

c.colors.tabs.bar.bg = bg
c.colors.statusbar.normal.bg = bg
c.colors.statusbar.normal.fg = color[11]
c.colors.statusbar.url.fg = color[7]
c.colors.statusbar.url.success.https.fg = color[7]
c.colors.statusbar.url.success.http.fg = fg
c.colors.statusbar.url.hover.fg = color[4]
c.colors.tabs.even.bg = color[11]
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.selected.even.bg = bg
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.indicator.start = bg
c.colors.tabs.indicator.stop = fg

c.statusbar.position = 'top'
c.tabs.position = 'top'
c.tabs.width = 30
c.zoom.default = '110%'

if c.tabs.position == 'top':
    config.bind('K', 'tab-next', mode='normal')
    config.bind('J', 'tab-prev', mode='normal')

config.bind('CS', 'config-source', mode='normal')
