fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Boost#4383'
description 'Boost`s 3sides-rwhud'
version '1.0.0'

shared_script '@es_extened/imports.lua'

client_scripts{
    'client/*.lua'
}

server_scripts{
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/**'
}