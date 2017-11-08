#ifndef GBA_H
#define GBA_H

typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;

#define SCREEN_WIDTH 240
#define SCREEN_HEIGHT 160

#define REG_DISPCNT *(uint32*)0x4000000

#define MODE_0 0x000
#define MODE_1 0x001
#define MODE_2 0x002
#define MODE_3 0x003
#define MODE_4 0x004
#define MODE_5 0x005

#define BG_0 0x0100
#define BG_1 0x0200
#define BG_2 0x0400
#define BG_3 0x0800

inline uint16 RGB(uint8 r, uint8 g, uint8 b)
{
    return r | g << 5 | b << 10;
}

#endif
