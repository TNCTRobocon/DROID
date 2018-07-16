/* 
 * File:   pid.h
 * Author: MORIYAMA
 *
 * Created on 2018/07/11, 17:41
 */

#ifndef APPLICATION_H//XC_HEADER_TEMPLATE_H
#define	APPLICATION_H//XC_HEADER_TEMPLATE_H
#include "../Setting/types.h"
#include "../Setting/configuration.h"
#include "../Driver/uart.h"
#include "../Driver/encoder.h"
#include "../Driver/pwm.h"
#include "../Driver/timer.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
//#include <xc.h> // include processor files - each processor file is guarded.  
extern float pid_p;
extern float pid_i;
extern float pid_d;

void pid();
void set_motor_dt();
void set_motor_speed(int32_t);

Q15_t pid_limit(Q15_t,Q15_t,float,float);
float float_limit(float,float,float,float);
//void set_p(float);
//void set_i(float);
//void set_d(float);
float get_pid(char);
void change_pid(int);

void dmotor();
void set_dmotor(float get_dt);
#endif	/* APPLICATION_H */