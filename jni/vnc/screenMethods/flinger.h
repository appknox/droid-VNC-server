/*
droid vnc server - Android VNC server
Copyright (C) 2009 Jose Pereira <onaips@gmail.com>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

#ifndef FLINGER_H
#define FLINGER_H

#include "screenFormat.h"

int initFlinger(void);
#ifdef DVNC_STATIC_WRAPPER
#include "flinger/flinger.h"
static inline void closeFlinger(void) { return close_flinger(); }
static inline unsigned char *readBufferFlinger(void) { return readfb_flinger(); }
static inline unsigned char *checkBufferFlinger(void) { return checkfb_flinger(); }
static inline screenFormat getScreenFormatFlinger(void) { return getscreenformat_flinger(); }
#else
void closeFlinger(void);
unsigned char *readBufferFlinger(void);
unsigned char *checkBufferFlinger(void);
screenFormat getScreenFormatFlinger(void);
#endif

#endif
