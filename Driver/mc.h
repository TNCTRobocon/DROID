/* 
 * File:   mcc.h
 * Author: MORIYAMA
 *
 * Created on 2018/08/24, 11:47
 */

#ifndef MCC_H
#define	MCC_H

#include "../EShell/file.h"
#include "../Driver/pid.h"
file_t pid_create();

int motor_pid(int,char**);
int motor_link(int,char**);

#endif	/* MCC_H */

