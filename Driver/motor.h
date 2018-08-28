/* 
 * File:   motor.h
 * Author: MORIYAMA
 *
 * Created on 2018/08/23, 13:05
 */

#ifndef MOTOR_H
#define	MOTOR_H

#include "../EShell/file.h"

file_t motor_create();

int motor_dt(int,char**);

void motor_ac();
//void set_motor_dt();
//void set_motor_speed(int32_t);

//Q15_t pid_limit(Q15_t,Q15_t,double,double);
float float_limit(float,float,float,float);
//Q16_16 ConvertQ16_16(float);
void set_p(float);
void set_i(float);
void set_d(float);
//float get_pid(char);
//void change_pid(int);

void dmotor();
void set_dmotor(float get_dt);
#endif	/* MOTOR_H */


