ifeq ($(XDG_CONFIG_DIR),)
	CONF_DIR=$(HOME)/.config/nvim
else
	CONF_DIR=$(XDG_CONFIG_DIR)/nvim
endif
install:
	ln -s $(PWD) $(CONF_DIR)
	mkdir -p ./state
uninstall:
	trash $(CONF_DIR)
