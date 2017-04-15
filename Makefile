bindir="${HOME}/.local/bin"

.PHONY: install commands

commands:
	./xscreentool.rb generate commands

all: binfile

install: all
	install bin/* $(bindir)
