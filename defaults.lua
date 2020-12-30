--[[Copyright © 2020, Saharystar
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of storydialogbox nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Saharystar BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.]]

theme = 'ffxi'

defaults = {}
defaults.dialogbox = {}
defaults.dialogbox.pos = {}
defaults.dialogbox.pos.x = math.round(windower.get_windower_settings().ui_x_res / 3.44)
defaults.dialogbox.pos.y = math.round(windower.get_windower_settings().ui_y_res / 1.46)
defaults.dialogbox.theme = theme

settings = config.load(defaults)
settings.save(settings)

if settings.dialogbox.theme == 'ffxiv' then
    dialogboxPath = windower.addon_path .. 'theme/ffxiv/box.png'
    dialogboxBgNamePath = windower.addon_path .. 'theme/ffxiv/bg_name.png'

    dialogBoxMessageNPCSettings = {}
    dialogBoxMessageNPCSettings.bg = {}
    dialogBoxMessageNPCSettings.bg.alpha = 0
    dialogBoxMessageNPCSettings.pos = {}
    dialogBoxMessageNPCSettings.pos.x = settings.dialogbox.pos.x
    dialogBoxMessageNPCSettings.pos.y = settings.dialogbox.pos.y
    dialogBoxMessageNPCSettings.text = {}
    dialogBoxMessageNPCSettings.text.font = 'sans-serif'
    dialogBoxMessageNPCSettings.text.fonts = {'Arial', 'Trebuchet MS'}
    dialogBoxMessageNPCSettings.text.alpha = 255
    dialogBoxMessageNPCSettings.text.red = 0
    dialogBoxMessageNPCSettings.text.green = 0
    dialogBoxMessageNPCSettings.text.blue = 0
    dialogBoxMessageNPCSettings.text.size = 12
    dialogBoxMessageNPCSettings.flags = {}
    dialogBoxMessageNPCSettings.flags.draggable = false

    dialogboxBgSettings = {}
    dialogboxBgSettings.pos = {}
    dialogboxBgSettings.pos.x = dialogBoxMessageNPCSettings.pos.x - 45
    dialogboxBgSettings.pos.y = dialogBoxMessageNPCSettings.pos.y - 29
    dialogboxBgSettings.texture = {}
    dialogboxBgSettings.texture.path = dialogboxPath
    dialogboxBgSettings.texture.fit = true
    dialogboxBgSettings.texture.alpha = 100
    dialogboxBgSettings.size = {}
    dialogboxBgSettings.size.width = 785
    dialogboxBgSettings.size.height = 172
    dialogboxBgSettings.draggable = false

    dialogBoxNameNPCSettings = {}
    dialogBoxNameNPCSettings.bg = {}
    dialogBoxNameNPCSettings.bg.alpha = 0
    dialogBoxNameNPCSettings.pos = {}
    dialogBoxNameNPCSettings.pos.x = dialogboxBgSettings.pos.x + 60
    dialogBoxNameNPCSettings.pos.y = dialogboxBgSettings.pos.y - 11
    dialogBoxNameNPCSettings.text = {}
    dialogBoxNameNPCSettings.text.font = 'sans-serif'
    dialogBoxNameNPCSettings.text.fonts = {'Arial Unicode MS', 'Trebuchet MS'}
    dialogBoxNameNPCSettings.text.alpha = 255
    dialogBoxNameNPCSettings.text.red = 250
    dialogBoxNameNPCSettings.text.green = 250
    dialogBoxNameNPCSettings.text.blue = 250
    dialogBoxNameNPCSettings.text.size = 16
    dialogBoxNameNPCSettings.flags = {}
    dialogBoxNameNPCSettings.flags.draggable = false

    dialogBoxBgNameNPCSettings = {}
    dialogBoxBgNameNPCSettings.pos = {}
    dialogBoxBgNameNPCSettings.pos.x = dialogBoxNameNPCSettings.pos.x - 35
    dialogBoxBgNameNPCSettings.pos.y = dialogBoxNameNPCSettings.pos.y - 2
    dialogBoxBgNameNPCSettings.texture = {}
    dialogBoxBgNameNPCSettings.texture.path = dialogboxBgNamePath
    dialogBoxBgNameNPCSettings.texture.fit = true
    dialogBoxBgNameNPCSettings.draggable = false
elseif settings.dialogbox.theme == 'ffxi' then
    dialogboxPath = windower.addon_path .. 'theme/ffxi/box.png'
    dialogboxBgNamePath = windower.addon_path .. 'theme/ffxi/bg_name.png'

    dialogBoxMessageNPCSettings = {}
    dialogBoxMessageNPCSettings.bg = {}
    dialogBoxMessageNPCSettings.bg.alpha = 0
    dialogBoxMessageNPCSettings.pos = {}
    dialogBoxMessageNPCSettings.pos.x = settings.dialogbox.pos.x
    dialogBoxMessageNPCSettings.pos.y = settings.dialogbox.pos.y
    dialogBoxMessageNPCSettings.text = {}
    dialogBoxMessageNPCSettings.text.font = 'sans-serif'
    dialogBoxMessageNPCSettings.text.fonts = {'Arial', 'Trebuchet MS'}
    dialogBoxMessageNPCSettings.text.alpha = 255
    dialogBoxMessageNPCSettings.text.red = 250
    dialogBoxMessageNPCSettings.text.green = 250
    dialogBoxMessageNPCSettings.text.blue = 250
    dialogBoxMessageNPCSettings.text.size = 12
    dialogBoxMessageNPCSettings.flags = {}
    dialogBoxMessageNPCSettings.flags.draggable = false

    dialogboxBgSettings = {}
    dialogboxBgSettings.pos = {}
    dialogboxBgSettings.pos.x = dialogBoxMessageNPCSettings.pos.x - 50
    dialogboxBgSettings.pos.y = dialogBoxMessageNPCSettings.pos.y - 29
    dialogboxBgSettings.texture = {}
    dialogboxBgSettings.texture.path = dialogboxPath
    dialogboxBgSettings.texture.fit = true
    dialogboxBgSettings.texture.alpha = 100
    dialogboxBgSettings.size = {}
    dialogboxBgSettings.size.width = 785
    dialogboxBgSettings.size.height = 172
    dialogboxBgSettings.draggable = false

    dialogBoxNameNPCSettings = {}
    dialogBoxNameNPCSettings.bg = {}
    dialogBoxNameNPCSettings.bg.alpha = 0
    dialogBoxNameNPCSettings.pos = {}
    dialogBoxNameNPCSettings.pos.x = dialogboxBgSettings.pos.x + 60
    dialogBoxNameNPCSettings.pos.y = dialogboxBgSettings.pos.y - 11
    dialogBoxNameNPCSettings.text = {}
    dialogBoxNameNPCSettings.text.font = 'sans-serif'
    dialogBoxNameNPCSettings.text.fonts = {'Arial Unicode MS', 'Trebuchet MS'}
    dialogBoxNameNPCSettings.text.alpha = 255
    dialogBoxNameNPCSettings.text.red = 250
    dialogBoxNameNPCSettings.text.green = 250
    dialogBoxNameNPCSettings.text.blue = 250
    dialogBoxNameNPCSettings.text.size = 16
    dialogBoxNameNPCSettings.flags = {}
    dialogBoxNameNPCSettings.flags.draggable = false

    dialogBoxBgNameNPCSettings = {}
    dialogBoxBgNameNPCSettings.pos = {}
    dialogBoxBgNameNPCSettings.pos.x = dialogBoxNameNPCSettings.pos.x - 35
    dialogBoxBgNameNPCSettings.pos.y = dialogBoxNameNPCSettings.pos.y - 2
    dialogBoxBgNameNPCSettings.texture = {}
    dialogBoxBgNameNPCSettings.texture.path = dialogboxBgNamePath
    dialogBoxBgNameNPCSettings.texture.fit = true
    dialogBoxBgNameNPCSettings.draggable = false
end
