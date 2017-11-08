#include "gba.h"

unsigned short *videoBuffer = (uint16*)0x6000000;

void drawPixel(int x, int y, uint16 color)
{
    videoBuffer[y * SCREEN_WIDTH + x] = color;
}

int main(void)
{
    REG_DISPCNT = (MODE_3 | BG_2);

    drawPixel(10, 10, RGB(255, 255, 255));

    while(1) {}
}
