NAME_DEATH_MAZE_MIN		= death_maze_min.tfm.lua
NAME_DEATH_MAZE_EXT		= death_maze_ext.tfm.lua
ALL_NAMES				= $(NAME_DEATH_MAZE_MIN) $(NAME_DEATH_MAZE_EXT)
CC						= ./pshy_merge/combine.py

all: $(ALL_NAMES)

$(NAME_DEATH_MAZE_MIN):
	$(CC) --nocomments pshy_merge.lua -- nnaaaz_death_maze.lua >> $@

$(NAME_DEATH_MAZE_EXT):
	$(CC) --minimize pshy_merge.lua -- pshy_fcplatform.lua -- @require pshy_ban.lua -- pshy_essentials.lua -- nnaaaz_death_maze.lua >> $@

.PHONY: clean
clean:

.PHONY: fclean
fclean: clean
	rm -f *.tfm.lua

.PHONY: re
re: fclean all
