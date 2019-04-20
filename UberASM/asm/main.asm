incsrc "../asm/library.asm"
incsrc "../other/macro_library.asm"
!level_nmi	= 0
!overworld_nmi	= 0
!gamemode_nmi	= 0
!global_nmi	= 0

!sprite_RAM	= $7FAC80

autoclean $10B19F
autoclean $10B9B3
autoclean $10CD33
autoclean $10CD19
autoclean $10B9AA

!previous_mode = !sprite_RAM+(!sprite_slots*3)

incsrc level.asm
incsrc overworld.asm
incsrc gamemode.asm
incsrc global.asm
incsrc sprites.asm
incsrc statusbar.asm


print freespaceuse
