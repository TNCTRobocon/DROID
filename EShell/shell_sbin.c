#include "shell_sbin.h"
#include "../Setting/types.h"
#include <stdlib.h>
#include "../Driver/uart.h"
#include "shell_core.h"
#include "../Driver/ports.h"
#include "../Setting/configuration.h"
#include "../Driver/adc.h"
#include "../Driver/mc.h"
//#include "../Helper/future.h"

static int16_t address_ofset=+16;

static int16_t address_get(){
    return address_ofset+port_address();
}

static PSV excute_pair lst_excute[]={
    {"rst",sbin_rst},
    {"sel",sbin_sel},
    {"btype",sbin_btype},
    {"go",motor_link},
    {"stop",motor_link},
    {"check",sbin_check}//,
    //{"future",send_status}
};

file_t sbin_create(){
    file_t sbin;

    sbin = directory_create("sbin");
    directory_insert_excute(sbin,lst_excute,sizeof(lst_excute)/sizeof(lst_excute[0]));
    
    return sbin;
}

int sbin_rst(int argc,char** argv){
    __asm("RESET");//ソフトウェアにより強制リセット
    return 0;
}

int sbin_sel(int argc,char** argv){
    int16_t address;
    if (argc>1){
        address=atoi(argv[1]);
        if (address!=address_get()){
            //listem mode
            select_listen();
            PIN_LOW(LED_TX);
        }else if (address==0){
            //general call
            select_general();
            
        }else{
            //selected
            select_selected();
            PIN_LOW(LED_TX);
        }
    }else{
       //listen mode
        select_listen();
    }
    return 0;
}

int sbin_btype(int argc,char** argv){
    uart_bufl("OK");
    if(!strcmp("ripo",argv[1])){
        b_type_set(B_TYPE_LIPO);
        b_cell_get(argv[2]);
    }else if(!strcmp("sp",argv[1])){
        b_type_set(B_TYPE_SP);
        b_cell_get(0);
    }
}

void sbin_check(){
    int battery_status = battery_check();
    
}