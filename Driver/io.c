#include "io.h"
#include "../EShell/shell_core.h"
#include "pid.h"
#include "../EShell/system.h"
#include "uart.h"
#include "encoder.h"
#include "pwm.h"
#include "ports.h"
#include "../Setting/p30F4012.h"
#include "../App/dta_motor.h"
//#include "dta_motor.h"
#include "../App/step.h"
#include "../EShell/task.h"
#include <string.h>
#include <stdlib.h>

#define RAD (float)(400)

//変数名等
const char cmp_port_encode[] = "port.encoder"; //read only
const char cmp_port_idx[] = "port.idx"; //read only
const char cmp_addr_value[] = "addr"; //read only
const char cmp_addr_ofset[] = "addr.ofset"; //border
const char cmp_pwm_max[] = "pwm.max"; //border
const char cmp_pwm_min[] = "pwm.min"; //border
const char cmp_pwm_period[] = "pwm.period"; //border
const char cmp_pwm_dt[]="pwm.dt";//read only

const char cmp_encoder_speed[]="encoder.speed";
const char cmp_encoder_direction[]="encoder.dir";
const char cmp_mc_period[]="mc.period";
const char cmp_mc_p[]="p";
const char cmp_mc_i[]="i";
const char cmp_mc_d[]="d";

const char cmp_get_link[]="link";

//オプション
const char cmp_help[] = "help";
//Help時用　グループ分け ここにあるとヘルプに表示される。
const char *group_get[] = {cmp_port_encode, cmp_port_idx, cmp_addr_value, cmp_addr_ofset,
                           cmp_pwm_max,cmp_pwm_min,cmp_pwm_period,cmp_pwm_dt,cmp_mc_p,cmp_mc_i,cmp_mc_d,cmp_mc_period,cmp_encoder_speed,cmp_encoder_direction,cmp_get_link};
const char *group_set[] = {cmp_addr_ofset,cmp_pwm_max,cmp_pwm_min,cmp_pwm_period,cmp_mc_p,cmp_mc_i,cmp_mc_d};

int32_t link_speed=0;
bool link_enable=false;
//登録
    static PSV excute_pair lst_io[] = {
    {io_get, "get"},
    {io_set, "set"},
    {option_test, "test"},
    {motor_dt, "dt"},
    {motor_dt_automatic,"dta"},
    {pid_mode,"mode"},
    {motor_control,"mc"},
    {interval_timer_mc,"ev"},
    {interval_timer_mcp,"evp"},
    {period_encoder,"period"},
    {mc_rady,"rady"},
    {mc_go, "go"},
    {mc_stop, "stop"}
    };
    
    file_t io_create() {
    file_t io;
    io = directory_create("io");
    directory_insert_excute(io,lst_io,sizeof(lst_io)/sizeof(lst_io[0]));
    return io;
}
    
void io_setup() {
    /*system_insert(io_get, "get");
    system_insert(io_set, "set");
    system_insert(option_test, "test");
    system_insert(motor_dt, "dt");
    system_insert(motor_dt_automatic,"dta");
    system_insert(pid_mode,"mode");
    system_insert(motor_control,"mc");
    system_insert(step_control,"sc");
    system_insert(motor_control_period,"mcp");
    system_insert(interval_timer_mc,"ev");
    system_insert(interval_timer_mcp,"evp");
    system_insert(period_encoder,"period");
    system_insert(mc_rady,"rady");
    system_add(mc_go, "go", OptionSystem);
    system_add(mc_stop, "stop", OptionSystem);*/
    }

int io_get(int argc, char** argv) {
    //最初の要素を削除;
    char* cmp = argv[1];
    char buf[32];
    bool split_fag = false;
    argc--;
    argv++;

    //help
    if (!strcmp(cmp, cmp_help) || argc < 0) {
        int idx;
        uart_puts("Format: get [Name]..\r""[Name] ={");
        for (idx = 0; idx < (sizeof (group_get) / sizeof (*group_get)); idx++) {
            if (idx != 0)uart_bufc(',');
            uart_puts(group_get[idx]);
        }
        uart_putc('}');
    } else {

        while (argc > 0) {

            cmp = argv[0];
            if (split_fag) {
                uart_bufc(',');
            }

            if (!strcmp(cmp, cmp_port_encode)) {
                //エンコーダ情報
                uart_bufs("Idx:");
                uart_bufc(pin_encode_idx() ? '1' : '0');
                uart_bufc(',');
                uart_bufs("X:");
                uart_bufc(pin_encode_x() ? '1' : '0');
                uart_bufc(',');
                uart_bufs("Y:");
                uart_bufc(pin_encode_y() ? '1' : '0');

            } else if (!strcmp(cmp, cmp_port_idx)) {
                int idx;
                int port;
                idx = atoi(argv[1]);
                port = port_get(idx);
                itoa(buf, port, 16);
                uart_bufs("port.idx(");
                uart_bufc('0' + idx);
                uart_bufs("):");
                uart_bufs(buf);

                argc--;
                argv++; //go more one!!
            } else if (!strcmp(cmp, cmp_addr_value)) {
                uart_bufs("addr:");
                itoa(buf, system_address(), 10);
                uart_bufs(buf);
            } else if (!strcmp(cmp, cmp_addr_ofset)) {
                uart_bufs("addr.ofset:");
                itoa(buf, system_address_ofset, 10);
                uart_bufs(buf);
            } else if (!strcmp(cmp, cmp_pwm_period)) {
                uart_bufs("pwm.period:");
                itoa(buf, (get_pwm_period()/10), 10);
                uart_bufs(buf);
                uart_bufc('0'+get_pwm_period()%10);
            } else if (!strcmp(cmp, cmp_pwm_max)) {
                Q16_t max =get_pwm_max();//UINT16_MAX倍されている
                int var = max/(UINT16_MAX/1000);//1000分率になる。
                uart_bufs("pwm.max:0.");
                itoa(buf,var,10);
                uart_bufs(buf);
            } else if (!strcmp(cmp, cmp_pwm_min)) {
                Q16_t min =get_pwm_min();//UINT16_MAX倍されている
                int var = min/(UINT16_MAX/1000);//1000分率になる。
                uart_bufs("pwm.min:0.");
                itoa(buf,var,10);
                uart_bufs(buf);
            }else if (!strcmp(cmp,cmp_pwm_dt)){
                Q16_t dt=get_pwm_dt();
                int var =dt/(UINT16_MAX/1000);
                uart_bufs("pwm.dt:");
                itoa(buf,var,10);
                uart_bufs(buf);
            }else if (!strcmp(cmp,cmp_mc_p)){
                float var=get_pid('p');
                uart_bufs("p:");
                ftoa(buf,var,5);
                uart_bufs(buf);
            }else if (!strcmp(cmp,cmp_mc_i)){
                float var=get_pid('i');
                uart_bufs("i:");
                ftoa(buf,var,5);
                uart_bufs(buf);
            }else if (!strcmp(cmp,cmp_mc_d)){
                float var=get_pid('d');
                uart_bufs("d:");
                ftoa(buf,var,5);
                uart_bufs(buf);
            }else if (!strcmp(cmp,cmp_mc_period)){
                mcp_enable(true);
                uint32_t hz_get;
                uint32_t period_get;
                get_mc_period(&hz_get,&period_get);
                int var =period_get;
                uart_bufs("mc.period:0x");
                itoa(buf,var,10);
                uart_bufs(buf);
                uart_bufs("(");
                var =hz_get;
                itoa(buf,var,10);
                uart_bufs(buf);
                 uart_bufs("us?)");
            }else if (!strcmp(cmp,cmp_encoder_speed)){
                int16_t speed=pid_rate();
                int var =speed;
                uart_bufs("encoder.speed:");
                itoa(buf,var,10);
                uart_bufs(buf);
            }else if (!strcmp(cmp,cmp_encoder_direction)){
                int16_t speed=pid_rate();
                int8_t  dir=QEICONbits.UPDN;
                if(speed==0){
                uart_bufs("no spin");
                }else{
                uart_bufs("encoder_spin_direction:");
                if(dir==1){
                 uart_bufs("+");
                }else if(dir==0){
                 uart_bufs("-");
                }
                }
            }else if (!strcmp(cmp,cmp_get_link)){
                int n=1000;
                int16_t speed=pid_rate();
                int var =speed;
                while(var/n!=0){
                uart_bufs("0");
                n=n/10;
                }
                itoa(buf,var,10);
                uart_bufs("link ");
                uart_bufs(buf);
                
            }else{
                uart_bufs("?");
            }

            uart_flush();
            argc--;
            argv++; //go pre
            split_fag = true;
        }
    }
    uart_bufc('\r');
    uart_flush(); //ここで出力
    return 0;
}

int io_set(int argc, char** argv) {
    //一つ目を破棄
    argc -= 1;
    argv++;
    char *name = *argv; //変数名
    char *var; //値(文字列)
    int idx;
    if (argc < 0 || !strcmp(name, cmp_help)) {
        uart_bufs("Format:set ([Name] [value])..\r");
        uart_bufs("[Name]={");
        for (idx = 0; idx < (sizeof (group_set) / sizeof (*group_set)); idx++) {
            if (idx != 0)uart_bufc(',');
            uart_bufs(group_set[idx]);
        }
        uart_bufc('}');
    } else {
        while (argc > 1) {//二つ移動するため
            name = *argv;
            var = *(argv + 1);

            if (!strcmp(name, cmp_addr_ofset)) {
                system_address_ofset = atoi(var);
            }else if(!strcmp(name,cmp_pwm_max)){
                set_pwm_max(atof(var)*UINT16_MAX);
            }else if (!strcmp(name,cmp_pwm_min)){
                set_pwm_min(atof(var)*UINT16_MAX);
            }else if (!strcmp(name,cmp_pwm_period)){
                set_pwm_period(atoi(var));
            }else if(!strcmp(name,cmp_mc_p)){
                set_p(atof(var));
            }else if(!strcmp(name,cmp_mc_i)){
                set_i(atof(var));
            }else if(!strcmp(name,cmp_mc_d)){
                set_d(atof(var));
            }else {
                uart_bufs("?");
            }
            //移動
            argc -= 2;
            argv += 2;
        }
    }
    uart_flush();
    return 0;
}

int option_test(int argc, char** argv) {
    return 0;
}

int motor_dt(int argc, char** argv) {
    mcp_enable(false);
    if (argc == 0) {
        pwm_shutdown(true);
    } else {
        pwm_shutdown(false);
        float dt = atof(argv[1]);
        set_motor_dt();
        set_event(NULL);
        pwm_dts(ConvertQ15(dt));
    }
    return 0;
}

int motor_dt_automatic(int argc, char** argv){
    mcp_enable(false);
    if (argc == 0) {
        pwm_shutdown(true);
    } else {
        pwm_shutdown(false);
        float dt = atof(argv[1]);
        set_dmotor(dt);
        set_event(&dmotor);
    }
    return 0;
}

int pid_mode(int argc,char** argv){
    int mode=atoi(argv[1]);
    change_pid(mode);
    return 0;
}

int motor_control(int argc, char** argv){
    mcp_enable(false);
    int32_t speed=0,rpm=atoi(argv[1]);
    speed=(int)(RAD*rpm*get_period_s()/60);//[rpm]->[pulse/pid_period]
    set_motor_speed(speed);
    set_event(&motor_ac);
    return 0;
}

int step_control(int argc, char** argv){
    mcp_enable(false);
    if (argc == 0) {
        pwm_shutdown(true);
    } else {
        int32_t rad=atoi(argv[1]);
        int32_t s=(int32_t)(RAD*rad/360);
        set_motor_dt();
        set_motor_step(s);
        set_step_rate();
        set_event(&step);
    }
    
    return 0;
}

int motor_control_period(int argc, char** argv){
    mcp_enable(true);
    int32_t speed=atoi(argv[1]);
        set_motor_speed(speed);
        return 0;
}

int interval_timer_mc(int argc, char** argv){
    char buf[8];
    uint32_t a;
    uint32_t period=get_encoder_period();//us(20*x)
    while(uart_depth() == 0){
        //itoa(buf,get_t_step(), 10);
        //itoa(buf,get_step_rate(), 10);
        //itoa(buf,get_d_step(), 10);
        itoa(buf,encoder_speed_raw(), 10);
        uart_putl(buf);
        do {
        a=0x0000FFFF&TMR2;
        uint32_t c=TMR3HLD;
        a=a+(c<<16);
      }
      while(a<period && uart_depth() == 0);
      TMR2=0;
      TMR3=0;
      TMR3HLD=0;
    }
    return 0;
}

int interval_timer_mcp(int argc, char** argv){
    char buf[8];
    uint32_t a;
    uint32_t period;//us(20*x)
    get_mc_period(&a,&period);
    while(uart_depth() == 0){
        itoa(buf,encoder_speed_raw(), 10);
        uart_putl(buf);
        do {
        a=0x0000FFFF&TMR2;
        uint32_t c=TMR3HLD;
        a=a+(c<<16);
      }
      while(a<period && uart_depth() == 0);
      TMR2=0;
      TMR3=0;
      TMR3HLD=0;
      get_mc_period(&a,&period);
    }
    return 0;
}

int period_encoder(int argc, char** argv){
    uint16_t e_period = atoi(argv[1]);
    encoder_period(e_period);
    return 0;
}

int mc_rady(int argc,char** argv){
    if (argc == 0) {
        link_enable=false;
    } else {
        int32_t rpm=atoi(argv[1]);
        link_speed=(int)(RAD*rpm*get_period_s()/60);//rpm
        //set_event(NULL);
        link_enable=true;
    }
    return 0;
}

int mc_go(int argc,char** argv){
    if(link_enable==true){
        link_enable=false;
        set_motor_speed(link_speed);
        set_event(&motor_ac);
    }
    return 0;
}

int mc_stop(int argc,char** argv){
        link_enable=false;
        set_motor_speed(0);
        set_event(&motor_ac);
    return 0;
}

float dt_map(float n_dt){
    if(n_dt<Dt_min){
        n_dt=Dt_min;
    }else if(n_dt>Dt_max){
        n_dt=Dt_max;
    }
    return((n_dt-Dt_max)*(Pwm_max-Pwm_min)/(Dt_max-Dt_min)+Pwm_max);
}

void ftoa(char *string,double f,int figure){
    sprintf(string,"%.*f",figure,f);
}