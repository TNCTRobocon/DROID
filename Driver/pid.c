/*
 * File:   pid.c
 * Author: MORIYAMA
 *
 * Created on 2018/07/11, 17:41
 */
#include "pid.h"


float pid_p=0.005;
float pid_i=0.0002;
float pid_d=0.0005;

static int32_t speed,dir=0;
static float  now_error,sigma_error,delta_error,before_error=0;
static Q15_t ps=0;
void pid(){
          now_error=speed-encoder_speed_raw();
          if(speed!=0 && abs(now_error)!=1){
          sigma_error+=now_error;
          }
          delta_error=now_error-before_error;
          float u=now_error*pid_p+sigma_error*pid_i+delta_error*pid_d;
          Q15_t mv=0;//p制御の操作量
           
           if(u>-0.95 && u<0.95){
           mv=ConvertQ15(u);
           }else if(u<-0.95){
           mv=ConvertQ15(-0.95);
           }else if(u>0.95){
           mv=ConvertQ15(0.95);
           }
           
           if(speed==0){
               ps=pid_limit(ps,mv,-0.95,0.95);
             }else if(speed>0){
               ps=pid_limit(ps,mv,0.15,0.95);
             }else if(speed<0){
               ps=pid_limit(ps,mv,-0.95,-0.15);
           }
            pwm_dts(ps);
            before_error=now_error;
           
}

void set_motor_dt(){
        speed=0;
        sigma_error=0;
        ps=0;
}
void set_motor_speed(int32_t speed_true){
        int32_t sign = (speed_true>0)-(speed_true<0);
        if(speed != speed_true){
        sigma_error=0;
        if((dir*sign)<0){
        ps=0;
        }
        }
        speed=speed_true;
        dir=sign;
}

Q15_t pid_limit(Q15_t n,Q15_t mv,float min,float max){
     if(n+mv>ConvertQ15(min) && n+mv<ConvertQ15(max)){
               return (n+mv);
               }else if(n+mv<=ConvertQ15(min)){
               return ConvertQ15(min);    
               }else {//(n+mv>=ConvertQ15(max)){
               return ConvertQ15(max);    
               }
}
float float_limit(float fn,float fmv,float fmin,float fmax){
     if(fn+fmv>fmin && fn+fmv<fmax){
               return (fn+fmv);
               }else if(fn+fmv<=fmin){
               return fmin;    
               }else {//(fn+fmv>=fmax){
               return fmax;    
               }
}

float get_pid(char pid){
    switch(pid){
      case 'p':
         return pid_p;
         break;
      case 'i':
         return pid_i;
         break;
      case 'd':
         return pid_d;
         break;
      default:
         return 0;      
    }
}

void change_pid(int mode){
    switch(mode){
        case 1://'p':
          pid_i=0;
          pid_d=0;
         break;
        case 2://'pi':
          pid_d=0;
         break;
        case 3://'pd':
          pid_i=0;
         break;
      default://とりあえずオフ
          pid_p=0;
          pid_i=0;
          pid_d=0;
    }
}