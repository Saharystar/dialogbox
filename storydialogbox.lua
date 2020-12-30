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

_addon.name = 'storydialogbox'
_addon.author = 'Sahary'
_addon.version = '1.0'

-- Libs
table = require('tables')
images = require('images')
texts = require('texts')
config = require('config')
settings = require('defaults')

-- Code
hiddenByKey = false

dialogBoxBg = images.new(dialogboxBgSettings)
dialogBoxBgNameNPC = images.new(dialogBoxBgNameNPCSettings)
dialogBoxNameNPC = texts.new('${name}', dialogBoxNameNPCSettings)
dialogBoxMessageNPC = texts.new('${message}', dialogBoxMessageNPCSettings)

stringPxLen = function(message, pixel)
    lenString = string.len(message)
    return (lenString * pixel)
end

wrapMessage = function(messageToWrap, pixel)
    MessageNPCPxLen = stringPxLen(messageToWrap, pixel)
    lenBox = math.round(740 * 1.21)
    lenMessage = 0
    wrapped = false
    messagesWords = windower.regex.split(messageToWrap, ' ')
    for i, v in pairs(messagesWords) do
        lenWord = stringPxLen(v, dialogBoxMessageNPCSettings.text.size)
        lenMessage = lenMessage + lenWord
        if lenMessage > lenBox then
            messagesWords[i] = '\n' .. v
            lenMessage = 0
            wrapped = true
        end
    end
    return messagesWords, wrapped
end

renderDialogBox = function(DialogNameNpc, DialogMessageNpc)
    dialogBoxMessageNPC:text(DialogMessageNpc)
    dialogBoxNameNPC:text(DialogNameNpc)
end

showDialogBox = function ()
    dialogBoxMessageNPC:show()
    dialogBoxBg:show()
    dialogBoxBgNameNPC:show()
    dialogBoxNameNPC:show()
end

hideDialogBox = function()
    dialogBoxMessageNPC:hide()
    dialogBoxBg:hide()
    dialogBoxBgNameNPC:hide()
    dialogBoxMessageNPC:hide()
    dialogBoxNameNPC:hide()
end

initializeDialogBox = function ()
    windower.register_event('target change', function(number)
        target = 0
        if target ~= number then
            windower.register_event('incoming text', function(original, modified, original_mode)
                if (original_mode == 150) or (original_mode == 152) then
                    dialogNpc = windower.regex.split(original, ' : ')
                    nameNpc = dialogNpc[1]
                    messageNpc = dialogNpc[2]
                    if messageNpc ~= nil then
                        nameNpc = windower.regex.replace(nameNpc, '[]', '')
                        messageNPCWrapped = wrapMessage(dialogNpc[2], dialogBoxMessageNPCSettings.text.size)
                        if wrapped then
                            messageNpcFinal = {''}
                            for i, v in pairs(messagesWords) do
                                messagesWords[i] = v
                                messageNpcFinal[1] = messageNpcFinal[1] .. ' ' ..messagesWords[i]
                            end
                            messageNpc = windower.regex.replace(messageNpcFinal[1], '[]', '')
                            messageNpcRegA = windower.regex.replace(messageNpc, '[]', ' ')
                            messageNpcRegB = windower.regex.replace(messageNpcRegA, '/[�`]+/i', 'A')
                            messageNpcRegC = windower.regex.replace(messageNpcRegB, '[^A-Za-z0-9-,"\'?!.()~éèàôûùÖü:;&\\n ]', '')
                            renderDialogBox(nameNpc, messageNpcRegC)
                            showDialogBox()
                        else
                            messageNpc = windower.regex.replace(messageNpc, '[]', '')
                            messageNpcRegA = windower.regex.replace(messageNpc, '[]', ' ')
                            messageNpcRegB = windower.regex.replace(messageNpcRegA, '/[�`]+/i', 'A')
                            messageNpcRegC = windower.regex.replace(messageNpcRegB, '[^A-Za-z0-9-,"\'?!.()~éèàôûùÖü:;&\\n ]', '')
                            renderDialogBox(nameNpc, messageNpcRegC)
                            showDialogBox()
                        end
                    end
                elseif (original_mode == 190) then
                    if original == '     ' then
                        hideDialogBox()
                    else
                        messageNPCWrapped = wrapMessage(original, dialogBoxMessageNPCSettings.text.size)
                        if wrapped then
                            messageNpcFinal = {''}
                            for i, v in pairs(messagesWords) do
                                messagesWords[i] = v
                                messageNpcFinal[1] = messageNpcFinal[1] .. ' ' ..messagesWords[i]
                            end
                            messageNpc = windower.regex.replace(messageNpcFinal[1], '[]', '')
                            messageNpcRegA = windower.regex.replace(messageNpc, '[]', ' ')
                            messageNpcRegB = windower.regex.replace(messageNpcRegA, '/[�`]+/i', 'A')
                            messageNpcRegC = windower.regex.replace(messageNpcRegB, '[^A-Za-z0-9-,"\'?!.()~éèàôûùÖü:;&\\n ]', '')
                            renderDialogBox('', messageNpcRegC)
                            showDialogBox()
                            dialogBoxBgNameNPC:hide()
                        else
                            messageNpc = windower.regex.replace(original, '[]', '')
                            messageNpcRegA = windower.regex.replace(messageNpc, '[]', ' ')
                            messageNpcRegB = windower.regex.replace(messageNpcRegA, '/[�`]+/i', 'A')
                            messageNpcRegC = windower.regex.replace(messageNpcRegB, '[^A-Za-z0-9-,"\'?!.()~éèàôûùÖü:;&\\n ]', '')
                            renderDialogBox('', messageNpcRegC)
                            showDialogBox()
                            dialogBoxBgNameNPC:hide()
                        end
                    end
                else
                    windower.register_event('outgoing chunk', function (id, data)
                        if (id == 0x00C)  then
                            hideDialogBox()
                            initializeDialogBox()
                        elseif (id == 0x00F) then
                            hideDialogBox()
                            initializeDialogBox()
                        elseif (id == 0x011) then
                            hideDialogBox()
                            initializeDialogBox()
                        end    
                    end)
                end
            end)
        else
            hideDialogBox()
        end
    end)  
end

windower.register_event('status change', function(new_status_id, old_status_id)
    windower.register_event('keyboard', function (dik, down)
        if (dik == 28) and down then
            if (new_status_id == 4) then
                hideDialogBox()
                initializeDialogBox()
            elseif (new_status_id == 0) then
                hideDialogBox()
            end
        end
    end)
end)

windower.register_event('login', function()
    initializeDialogBox()
end)

windower.register_event('load', function()
    if windower.ffxi.get_info().logged_in then
        initializeDialogBox()
    end
end)