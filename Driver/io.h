/* 
 * File:   system_io.h
 * Author: TERU
 *
 * Created on 2016/04/11, 11:20
 */

#ifndef SYSTEM_IO_H
#define	SYSTEM_IO_H

#include "../EShell/file.h"

void io_setup();
file_t io_create();
int io_get(int,char**);//変数値確認
int io_set(int,char**);//変数値代入
int option_test(int,char**);//一時的なもの　後で削除
#endif	/* SYSTEM_IO_H */
