#include <stdlib.h>
#include <math.h>
#include "motor.h"
#include "pid.h"
#include "../EShell/shell.h"
#include "../Driver/pwm.h"
#include "../Setting/types.h"

static float p=0.005;//0.006;//0.005 0.6*0.02
static float i=0.0002;//0.0001;//0.0002; 0.5*2*10^(-5-1)
static float d=0.001;//0.0025;//0.0005; 0.125*2*10^(-5+1))

static int32_t tspeed=0,speed=0,dir=0,lim_flag=0;
static float  now_error,sigma_error,delta_error,before_error=0;
static Q15_t ps=0;

file_t motor_create(){
    file_t mtr;
    mtr=directory_create("mtr");
    directory_insert(mtr,execute_create("dt",motor_dt));
    
    return mtr;
}

static inline float absf(float var){
    return var>0?var:-var;
}

/*int motor_dt(int argc,char** argv){
    float dt;
    if (argc<2){
        pwm_dts(0);
    }else{
        dt =atof(argv[1]);
        pwm_dts((int16_t)(dt*INT16_MAX));
    }
    return 0;
}*/

void motor_ac(){
    static uint8_t ct=0;
    if(ct>10){
        if(tspeed!=speed &&lim_flag!=0){
            tspeed-=(5*((tspeed>0)-(tspeed<0)));
            if(abs(tspeed)<=5){
                tspeed=speed;
            }
            sigma_error=0;
        }else if(tspeed!=speed &&lim_flag==0){
            tspeed+=(5*((tspeed>0)-(tspeed<0)));
            if(abs(speed-tspeed)<=5){
                tspeed=speed;
            }
            sigma_error=0;
        }
        //ct=0;
    }
    ct++;
        now_error=tspeed-encoder_speed_raw();
    if(tspeed!=0 && abs(now_error)>1){
        sigma_error+=now_error;
    }

    delta_error=now_error-before_error;
    if(now_error==0 && delta_error==0 && tspeed==speed)lim_flag=0;
    //if(delta_error<2)com_flag=0;
    float u=now_error*p+sigma_error*i+delta_error*d;
    
        
    Q15_t mv=0;//p制御の操作量
    
    if(u>-0.95 && u<0.95){
        mv=ConvertQ15(u);
    }else if(u<-0.95){
        mv=ConvertQ15(-0.95);
    }else if(u>0.95){
        mv=ConvertQ15(0.95);
    }
    
    if(tspeed==0){
        //if(lim_flag==0){
            ps=pid_limit(ps,mv,-0.95,0.95);
        /*}else if(lim_flag<0){
            ps=pid_limit(ps,mv,-0.95,0);
        }else if(lim_flag>0){
            ps=pid_limit(ps,mv,0,0.95);
        }*/
    }else if(tspeed>0){
        ps=pid_limit(ps,mv,0.15,0.95);
    }else if(tspeed<0){
        ps=pid_limit(ps,mv,-0.95,-0.15);
    }
    pwm_dts(ps);
    before_error=now_error;
}

void motor(){
    now_error=speed-encoder_speed_raw();
    if(speed!=0 && abs(now_error)>1){
        sigma_error+=now_error;
    }

    delta_error=now_error-before_error;
    //if(now_error==0 && delta_error==0)lim_flag=0;
    float u=now_error*p+sigma_error*i+delta_error*d;
    
    Q15_t mv=0;//p制御の操作量
    
    if(u>-0.95 && u<0.95){
        mv=ConvertQ15(u);
    }else if(u<-0.95){
        mv=ConvertQ15(-0.95);
    }else if(u>0.95){
        mv=ConvertQ15(0.95);
    }
    
    if(speed==0){
      //  if(lim_flag==0){
            ps=pid_limit(ps,mv,-0.95,0.95);
      /*  }else if(lim_flag<0){
            ps=pid_limit(ps,mv,-0.95,0);
        }else if(lim_flag>0){
            ps=pid_limit(ps,mv,0,0.95);
        }*/
    }else if(speed>0){
        ps=pid_limit(ps,mv,0.15,0.95);
    }else if(speed<0){
        ps=pid_limit(ps,mv,-0.95,-0.15);
    }
    pwm_dts(ps);
    before_error=now_error;
}

/*void set_motor_dt(){
    tspeed=0;
    speed=0;
    sigma_error=0;
    ps=0;
    lim_flag=0;
}*/

/*void set_motor_speed(int32_t speed_true){
    if(speed!=speed_true){
        int32_t sign = (speed_true>0)-(speed_true<0);

        sigma_error=0;
        if((dir*sign)<0){
            ps=0;
        }
        
        if(speed_true==0){
            lim_flag=dir;
        }else{
            tspeed=speed_true;
        }
        speed=speed_true;
        dir=sign;

    }
}*/

/*Q15_t pid_limit(Q15_t n,Q15_t mv,double min,double max){
     if(n+mv>ConvertQ15(min) && n+mv<ConvertQ15(max)){
               return (n+mv);
               }else if(n+mv<=ConvertQ15(min)){
               return ConvertQ15(min);    
               }else {//(n+mv>=ConvertQ15(max)){
               return ConvertQ15(max);    
               }
}*/

/*float float_limit(float fn,float fmv,float fmin,float fmax){
     if(fn+fmv>fmin && fn+fmv<fmax){
               return (fn+fmv);
               }else if(fn+fmv<=fmin){
               return fmin;    
               }else {//(fn+fmv>=fmax){
               return fmax;    
               }
}*/

Q16_16 ConvertQ16_16(float xc){
    Q16_16 c=1;
    Q16_16 yc=(int)xc;
    float sc=xc-(int)xc;
     sc=1/sc;
     c=c<<16;
     c=c/sc;
     yc=yc<<16;
     c=(0x0000FFFF&c) + (0xFFFF0000&yc);
    return  c;
}

void set_p(float pc){
    p=pc;
}
void set_i(float ic){
    i=ic;
}
void set_d(float dc){
    d=dc;
}

/*float get_pid(char pid){
    switch(pid){
      case 'p':
         return p;
         break;
      case 'i':
         return i;
         break;
      case 'd':
         return d;
         break;
      default:
         return 0;      
    }
}*/

/*void change_pid(int mode){
    switch(mode){
        case 1://'p':
          i=0;
          d=0;
         break;
        case 2://'pi':
          d=0;
         break;
        case 3://'pd':
          i=0;
         break;
      default://とりあえずオフ
          p=0;
          i=0;
          d=0;
    }
}*/