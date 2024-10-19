ifeq ($(XDG_CONFIG_DIR),)
	CONF_DIR=$(HOME)/.config/nvim
else
	CONF_DIR=$(XDG_CONFIG_DIR)/nvim
endif
install:
	ln -s . $(CONF_DIR)
uninstall:
	trash $(CONF_DIR)
