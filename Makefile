PROJ	:= main
TARGET	:= $(PROJ)
OBJS	:= $(PROJ).o
PREFIX	:= $(DEVKITARM)/bin/arm-none-eabi-
GBAFIX	:= $(DEVKITARM)/bin/gbafix
CC		:= $(PREFIX)gcc
LD		:= $(PREFIX)gcc
OBJCOPY	:= $(PREFIX)objcopy
ARCH	:= -mthumb-interwork -mthumb
SPECS	:= -specs=gba.specs
CFLAGS	:= $(ARCH) -O2 -Wall -fno-strict-aliasing
LDFLAGS	:= $(ARCH) $(SPECS)

.PHONY : build clean

build: $(TARGET).gba

$(TARGET).gba : $(TARGET).elf
	$(OBJCOPY) -v -O binary $< $@
	-@$(GBAFIX) $@

$(TARGET).elf : $(OBJS)
	$(LD) $^ $(LDFLAGS) -o $@

$(OBJS) : %.o : %.c
	$(CC) -c $< $(CFLAGS) -o $@

clean :
	@rm -fv *.gba
	@rm -fv *.elf
	@rm -fv *.o
