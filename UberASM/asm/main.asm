incsrc "../asm/library.asm"
incsrc "../other/macro_library.asm"
!level_nmi	= 0
!overworld_nmi	= 0
!gamemode_nmi	= 0
!global_nmi	= 0

!sprite_RAM	= $7FAC80

autoclean $139DCB
autoclean $13A9E0
autoclean $13A5B7
autoclean $13A986
autoclean $138851
autoclean $12FFEC

!previous_mode = !sprite_RAM+(!sprite_slots*3)

incsrc level.asm
incsrc overworld.asm
incsrc gamemode.asm
incsrc global.asm
incsrc sprites.asm
incsrc statusbar.asm


print freespaceuse
