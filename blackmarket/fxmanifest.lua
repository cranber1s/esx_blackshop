fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'andri.ucha'
description 'The script aims to enhance the immersive and interactive aspects of the gameplay by introducing an illicit marketplace for weapons.'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

dependencies {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'