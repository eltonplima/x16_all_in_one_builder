
all: install_build_deps build_cc65 build_x16_rom build_x16_emulator
macos :=
linux :=
uname := $(shell uname -s)

ifeq ($(uname),Darwin)
	macos := 1
endif

CC65_DIR = cc65
X16_ROM_DIR = x16-rom
X16_EMULATOR_DIR = x16-emulator

################################################################################
# generic section
################################################################################
install_build_deps:
	$(if macos, brew install sdl2)

clean: clean_c65 clean_x16_emulator clean_x16_rom

clean_c65:
	cd ${CC65_DIR} && make clean

clean_x16_emulator:
	cd ${X16_EMULATOR_DIR} && make clean

clean_x16_rom:
	cd ${X16_ROM_DIR} && make clean

################################################################################
# cc65 section
################################################################################
build_cc65: clone_cc65
	cd "${CC65_DIR}" && make

clone_cc65:
	[[ -d "${CC65_DIR}" ]] || git clone https://github.com/cc65/cc65.git "${CC65_DIR}"

################################################################################
# X16 rom section
################################################################################
build_x16_rom: clone_x16_rom
	cd "${X16_ROM_DIR}" && make

clone_x16_rom:
	[[ -d "${X16_ROM_DIR}" ]] || git clone https://github.com/commanderx16/x16-rom "${X16_ROM_DIR}"

################################################################################
# X16 emulator section
################################################################################
build_x16_emulator: clone_x16_emulator
	cd "${X16_EMULATOR_DIR}" && make

clone_x16_emulator:
	[[ -d "${X16_EMULATOR_DIR}" ]] || git clone https://github.com/commanderx16/x16-emulator "${X16_EMULATOR_DIR}"

