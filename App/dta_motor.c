/*
 * File:   dta_motor.c
 * Author: MORIYAMA
 *
 * Created on 2018/07/11, 17:41
 */


#include "../Driver/pid.h"

static /*Q16_16*/float p=0.4;

static int8_t dir=0;
static int8_t cnt=0;
static float dt,ddt,dtx,dtp=0;
void dmotor(){
          ddt=dt-dtp;
          float u=ddt*p;
           
           if(dt==0){
               dtp=float_limit(dtp,u,-0.95,0.95);
             }else if(dt>0){
               dtp=float_limit(dtp,u,0.15,0.95);
             }else if(dt<0){
               dtp=float_limit(dtp,u,-0.95,-0.15);
           }
            pwm_dts(ConvertQ15(dtp));
         if(PDC2+PDC3==0 && dtx!=0){
           if(cnt>=1){
            dt=dtx;
            dtx=0;
            cnt=0;
           }else{
           cnt++;
           }
          }
           
}
void set_dmotor(float get_dt){
        set_motor_dt();
        int8_t sign = (get_dt>0)-(get_dt<0);
        dt=get_dt;
        if((dir*sign)<0){
        dt=0;
        dtx=get_dt;
        }
        dir=sign;
}