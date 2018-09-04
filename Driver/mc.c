/*
 * File:   mc.c
 * Author: satos
 *
 * Created on 2017/06/21, 17:08
 */
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "mc.h"
#include "../EShell/shell.h"
#include "../Driver/pwm.h"
#include "../Setting/types.h"
#include "encoder.h"

const char link_rady[]="rady";
const char link_go[]="go";
const char link_stop[]="stop";

file_t pid_create(){
    file_t pid;
    pid=directory_create("pid");
    directory_insert(pid,execute_create("mc",motor_pid));
    directory_insert(pid,execute_create("rady",motor_link));
    return pid;
}

static inline float absf(float var){
    return var>0?var:-var;
}


int motor_pid(int argc,char** argv){
    int speed;
    if (argc<2){
        set_motor_speed(0);
        set_event(0);
    }else{
        speed =atoi(argv[1]);
        set_motor_speed(speed);
        set_event(pid);
    }
    return 0;
}

int motor_link(int argc,char** argv){
    int speed;
    if(strcmp(argv[0],link_rady)==0){
        if (argc<2){
            set_motor_speed(0);
        }else{
            speed =atoi(argv[1]);
            set_motor_speed(speed);
        }
    }else if(strcmp(argv[0],link_go)==0){
        set_event(pid);
    }else if(strcmp(argv[0],link_stop)==0){
        set_motor_speed(0);
        set_event(pid);
    }
    return 0;
}
