ACC_INC_DIR := ../survivalism-tools
ACC := ../survivalism-tools/acc.exe
ZIP := ../survivalism-tools/7za.exe
OBJ_DIR := src/ACS/*
RM := rm
OUTPUT_PK3 := doomz.pk3
all: $(patsubst src/%.acs, src/acs/%.o, $(wildcard *.acs)) pk3


#foo: $(OBJ_FILES)
#	acc.exe -o $@ $^
	
src/acs/%.o: %.acs Makefile
	$(ACC) -i $(ACC_INC_DIR) $< $@ 

pk3:
	$(RM) -f $(OUTPUT_PK3)
	$(ZIP) a -tzip -r -xr!.bat -xr!.git -xr!doomz.pk3 -- $(OUTPUT_PK3) src/*
#   -mx 9 saves like 1 MB but is slower
	echo "Created $(OUTPUT_PK3)"
    
clean:
	$(RM) -rf $(OBJ_DIR)