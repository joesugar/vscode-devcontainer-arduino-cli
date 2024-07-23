PROJNAME := blink
BOARD := pico:rp2040:rakwireless_rak11300

SRCDIR := ./$(PROJNAME)
OUTDIR := ./build

SRC := 	./$(SRCDIR)/$(PROJNAME).ino


# Top level commands
#
all: clean build upload

clean:
	rm -rf $(OUTDIR)

build: $(OUTDIR)/$(PROJNAME).ino.uf2

rebuild: clean build

upload:
	sudo mount /dev/sdb1 /mnt
	sudo cp -r $(OUTDIR)/$(PROJNAME).ino.uf2 /mnt
	sudo umount /mnt


# Supporting rules
#
$(OUTDIR)/$(PROJNAME).ino.uf2: $(SRC)
	arduino-cli compile --output-dir $(OUTDIR) -b $(BOARD) $(PROJNAME)
