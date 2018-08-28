#include "step.h"
int32_t now_step=0,true_step=0,dst=0,step_dir=1;
Q15_t step_dt=0;
/*
  mc[r/min]*360=sc[dig/min]/60=dsc[dig/sec]
 =mc*60=dscp[dig/sec]
 ∫dscds=(dsc*ds)1+(dsc*ds)2...>true;
 
 
 
 */
void step(){
    now_step=get_step_rate();
    dst=now_step-true_step;
    if(dst*step_dir>=0){
        pwm_dts(0);
    }else{
        pwm_dts(step_dt);
    }
}
void set_motor_step(int32_t set_step){
    if(set_step>0){
        step_dt=ConvertQ15(0.15);
    }else if(set_step<0){
        step_dt=ConvertQ15(-0.15);
    }else{
        step_dt=0;
    }
     true_step+=set_step;
    if((true_step-now_step)>0){
        step_dir=1;
    }else if((true_step-now_step)<0){
        step_dir=-1;
    }
   
}
int32_t get_d_step(){
    return dst;
}

int32_t get_t_step(){
    return true_step;
}
