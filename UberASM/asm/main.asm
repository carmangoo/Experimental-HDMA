incsrc "../asm/library.asm"
incsrc "../other/macro_library.asm"
!level_nmi	= 0
!overworld_nmi	= 0
!gamemode_nmi	= 0
!global_nmi	= 0

!sprite_RAM	= $7FAC80

autoclean $139DCB
autoclean $13A6A2
autoclean $13B40B
autoclean $13A5B7
autoclean $13A682
autoclean $13A978
autoclean $13A5E0
autoclean $13B3B1
autoclean $13AA0D
autoclean $12FFF5

!previous_mode = !sprite_RAM+(!sprite_slots*3)

incsrc level.asm
incsrc overworld.asm
incsrc gamemode.asm
incsrc global.asm
incsrc sprites.asm
incsrc statusbar.asm


print freespaceuse
