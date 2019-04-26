incsrc "../asm/library.asm"
incsrc "../other/macro_library.asm"
!level_nmi	= 0
!overworld_nmi	= 0
!gamemode_nmi	= 0
!global_nmi	= 0

!sprite_RAM	= $7FAC80

autoclean $139DCB
autoclean $13A992
autoclean $13B76C
autoclean $13BE34
autoclean $13A64C
autoclean $13A972
autoclean $13AC68
autoclean $13AD06
autoclean $13B6A1
autoclean $13ADA6
autoclean $13AE3B
autoclean $13BDDA
autoclean $13B2FB
autoclean $138848
autoclean $13A838
autoclean $13A87F
autoclean $13A7F8
autoclean $13A864
autoclean $13A8DA
autoclean $12FFEC

!previous_mode = !sprite_RAM+(!sprite_slots*3)

incsrc level.asm
incsrc overworld.asm
incsrc gamemode.asm
incsrc global.asm
incsrc sprites.asm
incsrc statusbar.asm


print freespaceuse
