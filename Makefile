NAME_DEATH_MAZE_MIN		= death_maze_min.tfm.lua
NAME_DEATH_MAZE_EXT		= death_maze_ext.tfm.lua
ALL_NAMES				= $(NAME_DEATH_MAZE_MIN) $(NAME_DEATH_MAZE_EXT)
NAME_DEATH_MAZE_AC		= death_maze_ac.tfm.lua
ALLALL_NAMES			= $(ALL_NAMES) $(NAME_DEATH_MAZE_AC)
CC						= ./pshy_merge/combine.py

all: $(ALL_NAMES)

allall: $(ALLALL_NAMES)

$(NAME_DEATH_MAZE_MIN):
	$(CC) --minimize nnaaaz_death_maze.lua >> $@

$(NAME_DEATH_MAZE_EXT):
	$(CC) --minimize pshy_fcplatform.lua -- pshy_ban.lua -- pshy_essentials.lua -- nnaaaz_death_maze.lua >> $@

$(NAME_DEATH_MAZE_AC):
	$(CC) --minimize pshy_deathmaze_anticheat_ext.lua nnaaaz_death_maze.lua >> $@
	
.PHONY: clean
clean:

.PHONY: fclean
fclean: clean
	rm -f *.tfm.lua

.PHONY: re
re: fclean all
