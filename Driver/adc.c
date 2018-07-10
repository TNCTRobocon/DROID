#include "adc.h"
#include "../Setting/configuration.h"
#include<stdbool.h>
/* configurationよりADC_USEが設定されている場合のみコードが生成されるようにする。
 */



void adc_setup(){
    ADCON1bits.ADON = false;    //AD変換起動しない
    ADCON1bits.ADSIDL = false;  //IDLE時は動作しない
    ADCON1bits.FORM = 0b00;     //整数で、変換した値を返す
    ADCON1bits.SSRC = 0b111;    //自動サンプリング
    ADCON1bits.SIMSAM = 1;      //CH0とCH1を同時サンプリングをする
    ADCON1bits.ASAM = false;    //SAMPがtrueの時に変換開始
    ADCON1bits.SAMP = false;    //サンプリング開始しない
    ADCON1bits.DONE = false;    //変換フラグを初期化
    ADCON2bits.CHPS = 0b01;     //CH0又はCH1を変換
    ADCON2bits.BUFS = true;     //とりあえずtrue
    ADCON2bits.SMPI = 0b1111;   //サンプル時間の選択（よくわからない）
    ADCON2bits.BUFM = false;    //意味不明
    ADCON2bits.ALTS = false;    //意味不明とりあえずMUX A側を使用
    ADCON3bits.SAMC = 0b11111;  //自動サンプリングタイムビット(最大値)計算してない
    ADCON3bits.ADRC = false;    //システムクロックを使用
    ADCON3bits.ADCS = 0b000001; //AD変換クロック選択(=Tcy)
}

Q16_t adc_convert(adc_channels_t ch){

}