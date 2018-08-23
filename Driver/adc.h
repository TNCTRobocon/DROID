#ifndef ADC_H
#define	ADC_H
#include "../Helper/dsp_helper.h"
#include "../System/shell_sbin.h"
/*
typedef enum adc_channels_t{
    ADC_Battery
}adc_channels_t;
*/
typedef enum {
    battery_type_t
}b_type_t;
enum{
    B_TYPE_LIPO,
    B_TYPE_SP
};
void adc_setup();

inline void b_type_set(b_type_t);
inline void b_cell_set(uint16_t);
//inline b_type_t b_cell_get();
inline uint16_t b_cell_get();
//Q16_t adc_convert(adc_channels_t);


#define adc_battery() adc


#endif	/* ADC_H */

