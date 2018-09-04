/* 
 * File:   task.h
 * Author: MORIYAMA
 *
 * Created on 2018/08/28, 10:21
 */

#ifndef TASK_H
#define	TASK_H


void task_setup();

void process_old();

void transmit_init();

void transmit();

char int_to_decimal( int val, char *a, int radix );

#endif	/* TASK_H */

