/* 
 * File:   step.h
 * Author: MORIYAMA
 *
 * Created on 2018/08/28, 10:17
 */

#ifndef STEP_H//STEP_H
#define	STEP_H//STEP_H
#include "../Setting/types.h"
#include "../Setting/configuration.h"
#include "../EShell/task.h"
#include "../Driver/uart.h"
#include "../Driver/encoder.h"
#include "../Driver/pwm.h"
#include "../Driver/timer.h"
#include "../App/motor.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

#define RAD (float)(400)

void step();
void set_motor_step(int32_t);
int32_t get_d_step();

#endif	/* STEP_H */