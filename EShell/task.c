#include "task.h"
#include "../Driver/uart.h"
#include "../Driver/io.h"
#include "../Setting/configuration.h"
#include <string.h>
#include <stdlib.h>
#include "../EShell/system.h"


void task_setup() {
    system_setup();
    transmit_init();
    
}

void process_old(){
    transmit();
}


void transmit_init() {
    //TODO 


}

void transmit() {
    char line[CMD_LENGTH];
    if (uart_have('\r')) {
        uart_gets(line, CMD_LENGTH);
        system_decode(line);
    }
}
char int_to_decimal( int val, char *a, int radix ){
	char *p = a;
	unsigned int v = val;/* 作業用(変換対象の値) */
	int n = 1;/* 変換文字列の桁数記憶用 */
	while(v >= radix){/* 桁数を求める */
		v /= radix;
		n++;
	}
	p = a + n; /* 最下位の位置から設定する */
	v = val;
	*p = '\0';/* 文字列終端の設定 */
	do {
		--p;
		*p = v % radix + '0';/* 1桁の数値を文字に変換 */
		if(*p > '9') {/* 変換した文字が10進で表現できない場合 */
			*p = v % radix - 10 + 'A'; /* アルファベットを使う */
		}
		v /= radix;
	} while ( p != a);
	return a;
}
