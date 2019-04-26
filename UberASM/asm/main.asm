incsrc "../asm/library.asm"
incsrc "../other/macro_library.asm"
!level_nmi	= 0
!overworld_nmi	= 0
!gamemode_nmi	= 0
!global_nmi	= 0

!sprite_RAM	= $7FAC80

autoclean $139DCB
autoclean $13AA78
autoclean $13AF9A
autoclean $13A64C
autoclean $13AA58
autoclean $13AD4E
autoclean $13AF40
autoclean $13B648
autoclean $13B6DD
autoclean $13B872
autoclean $13A9B8
autoclean $13A9FF
autoclean $13A978
autoclean $13A9E4
autoclean $12FFEC

!previous_mode = !sprite_RAM+(!sprite_slots*3)

incsrc level.asm
incsrc overworld.asm
incsrc gamemode.asm
incsrc global.asm
incsrc sprites.asm
incsrc statusbar.asm


print freespaceuse
