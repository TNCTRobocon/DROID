#include "adc.h"
#include "../Setting/configuration.h"
#include "../EShell/shell_sbin.h"
#include "uart.h"
#include<stdbool.h>

#define FCY 10000000
#include <libpic30.h>

static b_type_t b_type;     //使用するバッテリの種類を入れる変数
static uint16_t b_cell = 0; //リポだった場合のセルの数

inline void b_type_set(b_type_t type){
    b_type = type;
}

inline void b_cell_set(uint16_t cell){
    b_cell = cell;
}

inline uint16_t b_cell_get(){
    return b_cell;
}

/*inline b_type_t b_type_get(){
    return b_type;
}
*/
float lower_voltage(uint16_t cell){
    return cell*3.3;
}

void adc_setup(){
    ADCON1bits.ADON = false;    //AD変換起動しない
    ADCON1bits.ADSIDL = false;  //IDLE時は動作しない
    ADCON1bits.FORM = 0b00;     //整数で、変換した値を返す
    ADCON1bits.SSRC = 0b111;    //自動サンプリング
    ADCON1bits.SIMSAM = 1;      //CH0とCH1を同時サンプリングをする
    ADCON1bits.ASAM = false;    //SAMPがtrueの時に変換開始
    ADCON1bits.SAMP = false;    //サンプリング開始しない
    ADCON1bits.DONE = false;    //変換フラグを初期化
    ADCON2bits.VCFG = 0b001;    //ADREF+は外部Vref+,ADREF-はAVss
    ADCON2bits.CHPS = 0b01;     //CH0又はCH1を変換
    ADCON2bits.BUFS = true;     //とりあえずtrue
    ADCON2bits.SMPI = 0b0000;   //サンプリング回数の指定(1回),ADBUFF0だけに電圧を代入
    ADCON2bits.BUFM = false;    //意味不明
    ADCON2bits.ALTS = false;    //MUX A側のみを使用
    ADCON3bits.SAMC = 0b11111;  //自動サンプリングタイムビット(最大値)計算してない
    ADCON3bits.ADRC = false;    //AD変換用クロックを使用
    ADCON3bits.ADCS = 0b111111; //AD変換クロック選択(=Tcy)ADクロックインターバルはわからない
    ADPCFGbits.PCFG1 = false;   //AN1(RB1)はアナログポートとして使用
    ADCHSbits.CH123NA = 0b00;   //CH1,CH2,CH3の負の入力はVref-
    ADCHSbits.CH0NA = false;    //チャネル０の負の入力はVref-
    ADCSSLbits.CSSL1 = true;    //AN1を入力スキャン用にする
    ADCHSbits.CH0SA1 = 0b0001;  //AN1,RB1をCH0として設定
    IFS0bits.ADIF = false;      //割り込みフラグリセット
    ADCON1bits.ADON = true;     //AD変換起動‼
}

/*Q16_t adc_convert(adc_channels_t ch){
    
}*/

Q16_t adc_con(){
    Q16_t AD_Value = 0;         //値の初期化
    ADCON1bits.SAMP = true;     //サンプリング開始
    while(!ADCON1bits.DONE);    //AD変換が終わるまで待機
    AD_Value = ADCBUF0;         //結果の代入
    return AD_Value;            //電圧を返す
}

void B_check(){
    if(adc_con() > lower_voltage(b_cell) 
       && b_type == B_TYPE_LIPO){   //リポの電圧が低いときにERROR_LEDを光らす
        LED_ERROR = true;
        uart_bufl("battery error"); //エラーメッセージの表示
    }else if(b_type == B_TYPE_SP){
        LED_ERROR = false;
    }
}

void _ISR _U1ADCInterrupt(){
    IFS0bits.ADIF = false;      //割り込みフラグリセット
}