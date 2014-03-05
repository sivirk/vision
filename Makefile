RELEASE := vision
COOKIE  := node_runner
APPS    := web cowboy erlydtl gproc lager n2o sync
VER     := 0.1.1
VM      := rels/web/files/vm.args
SYS     := rels/web/files/sys.config
ERL_ARGS     := -args_file $(VM) -config $(SYS)
RUN_DIR      ?= ./rels/web/devbox
LOG_DIR      ?= ./rels/web/devbox/logs
N2O          := deps/n2o/priv/static
FILES        := media/n2o
BOOTSTRAP    := media/bootstrap
FONTAWESOME  := media/font-awesome

default: compile static-link
static-link:
	rm -rf $(N2O)
	rm -rf $(FILES)
	rm -rf $(BOOTSTRAP)
	rm -rf $(FONTAWESOME)
	ln -sf ../../n2o_scripts $(N2O)
	mkdir -p $(shell dirname $(FILES))
	ln -sf ../deps/n2o/priv/static/n2o $(FILES)
	ln -sf ../deps/twitter_btstrp $(BOOTSTRAP)
	ln -sf ../deps/font_awesome $(FONTAWESOME)

include otp.mk
