/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void unisim_a_0402065255_2679555531_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    int64 t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int64 t11;
    int64 t12;
    int64 t13;
    int64 t14;
    int64 t15;
    int64 t16;
    unsigned char t17;
    int64 t18;
    int64 t19;
    int64 t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned char t25;
    unsigned char t26;
    unsigned char t27;

LAB0:    t1 = (t0 + 4512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 != 0)
        goto LAB4;

LAB6:    t2 = (t0 + 1152U);
    t4 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t4 != 0)
        goto LAB7;

LAB8:
LAB5:
LAB30:    t2 = (t0 + 6072);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB31;

LAB1:    return;
LAB4:    t6 = (0 * 1LL);
    t2 = (t0 + 6232);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int64 *)t10) = t6;
    xsi_driver_first_trans_fast(t2);
    goto LAB5;

LAB7:    t3 = (t0 + 3528U);
    t7 = *((char **)t3);
    t6 = *((int64 *)t7);
    t3 = (t0 + 3408U);
    t8 = *((char **)t3);
    t3 = (t8 + 0);
    *((int64 *)t3) = t6;
    t6 = xsi_get_sim_current_time();
    t2 = (t0 + 3528U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int64 *)t2) = t6;
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t6 = *((int64 *)t3);
    t11 = (0 * 1LL);
    t5 = (t6 != t11);
    if (t5 == 1)
        goto LAB12;

LAB13:    t4 = (unsigned char)0;

LAB14:    if (t4 != 0)
        goto LAB9;

LAB11:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t6 = *((int64 *)t3);
    t11 = (0 * 1LL);
    t5 = (t6 != t11);
    if (t5 == 1)
        goto LAB17;

LAB18:    t4 = (unsigned char)0;

LAB19:    if (t4 != 0)
        goto LAB15;

LAB16:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t6 = *((int64 *)t3);
    t11 = (0 * 1LL);
    t17 = (t6 == t11);
    if (t17 == 1)
        goto LAB25;

LAB26:    t5 = (unsigned char)0;

LAB27:    if (t5 == 1)
        goto LAB22;

LAB23:    t4 = (unsigned char)0;

LAB24:    if (t4 != 0)
        goto LAB20;

LAB21:
LAB10:    goto LAB5;

LAB9:    t18 = xsi_get_sim_current_time();
    t2 = (t0 + 3408U);
    t10 = *((char **)t2);
    t19 = *((int64 *)t10);
    t20 = (t18 - t19);
    t2 = (t0 + 6232);
    t21 = (t2 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((int64 *)t24) = t20;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB12:    t2 = (t0 + 3528U);
    t7 = *((char **)t2);
    t12 = *((int64 *)t7);
    t2 = (t0 + 3408U);
    t8 = *((char **)t2);
    t13 = *((int64 *)t8);
    t14 = (t12 - t13);
    t2 = (t0 + 1672U);
    t9 = *((char **)t2);
    t15 = *((int64 *)t9);
    t16 = (1.5000000000000000 * t15);
    t17 = (t14 <= t16);
    t4 = t17;
    goto LAB14;

LAB15:    t18 = (0 * 1LL);
    t2 = (t0 + 6232);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t21 = (t10 + 56U);
    t22 = *((char **)t21);
    *((int64 *)t22) = t18;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB17:    t12 = xsi_get_sim_current_time();
    t2 = (t0 + 3408U);
    t7 = *((char **)t2);
    t13 = *((int64 *)t7);
    t14 = (t12 - t13);
    t2 = (t0 + 1672U);
    t8 = *((char **)t2);
    t15 = *((int64 *)t8);
    t16 = (1.5000000000000000 * t15);
    t17 = (t14 > t16);
    t4 = t17;
    goto LAB19;

LAB20:    t14 = xsi_get_sim_current_time();
    t2 = (t0 + 3408U);
    t9 = *((char **)t2);
    t15 = *((int64 *)t9);
    t16 = (t14 - t15);
    t2 = (t0 + 6232);
    t10 = (t2 + 56U);
    t21 = *((char **)t10);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((int64 *)t23) = t16;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB22:    t2 = (t0 + 2952U);
    t8 = *((char **)t2);
    t26 = *((unsigned char *)t8);
    t27 = (t26 == (unsigned char)3);
    t4 = t27;
    goto LAB24;

LAB25:    t2 = (t0 + 3408U);
    t7 = *((char **)t2);
    t12 = *((int64 *)t7);
    t13 = (0 * 1LL);
    t25 = (t12 != t13);
    t5 = t25;
    goto LAB27;

LAB28:    t3 = (t0 + 6072);
    *((int *)t3) = 0;
    goto LAB2;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

}

static void unisim_a_0402065255_2679555531_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 != 0)
        goto LAB4;

LAB6:    t2 = (t0 + 1152U);
    t4 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t4 != 0)
        goto LAB7;

LAB9:
LAB8:    t2 = (t0 + 1152U);
    t4 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t4 != 0)
        goto LAB10;

LAB12:
LAB11:
LAB5:
LAB15:    t2 = (t0 + 6088);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB4:    t2 = (t0 + 6296);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6424);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6488);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB5;

LAB7:    t3 = (t0 + 6296);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);
    t2 = (t0 + 6360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6424);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6488);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB10:    t3 = (t0 + 6360);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);
    t2 = (t0 + 6296);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6424);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6488);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB11;

LAB13:    t3 = (t0 + 6088);
    *((int *)t3) = 0;
    goto LAB2;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

}

static void unisim_a_0402065255_2679555531_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 5008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 != 0)
        goto LAB4;

LAB6:    t2 = (t0 + 1152U);
    t4 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t4 != 0)
        goto LAB7;

LAB9:
LAB8:    t2 = (t0 + 1152U);
    t4 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t4 != 0)
        goto LAB10;

LAB12:
LAB11:
LAB5:
LAB15:    t2 = (t0 + 6104);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB4:    t2 = (t0 + 6552);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 6616);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB5;

LAB7:    t3 = (t0 + 6552);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    goto LAB8;

LAB10:    t3 = (t0 + 6616);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    goto LAB11;

LAB13:    t3 = (t0 + 6104);
    *((int *)t3) = 0;
    goto LAB2;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

}

static void unisim_a_0402065255_2679555531_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    int64 t14;
    int64 t15;
    double t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 5256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 != 0)
        goto LAB4;

LAB6:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t5 = *((unsigned char *)t3);
    t10 = (t5 == (unsigned char)1);
    if (t10 == 1)
        goto LAB10;

LAB11:    t4 = (unsigned char)0;

LAB12:    if (t4 != 0)
        goto LAB7;

LAB9:
LAB8:
LAB5:
LAB38:    t2 = (t0 + 6120);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB39;

LAB1:    return;
LAB4:    t2 = (t0 + 6680);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB5;

LAB7:    t2 = (t0 + 1152U);
    t13 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t13 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB8;

LAB10:    t2 = (t0 + 2952U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)3);
    t4 = t12;
    goto LAB12;

LAB13:    t14 = (1 * 1LL);
    t7 = (t0 + 5064);
    xsi_process_wait(t7, t14);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB16:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t14 = *((int64 *)t3);
    t15 = (0 * 1LL);
    t4 = (t14 != t15);
    if (t4 != 0)
        goto LAB20;

LAB22:
LAB21:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t14 = *((int64 *)t3);
    t16 = (9.0999999999999996 / 10.000000000000000);
    t15 = (t14 * t16);
    t2 = (t0 + 5064);
    xsi_process_wait(t2, t15);

LAB25:    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    t2 = (t0 + 6680);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB21;

LAB23:    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t10 = *((unsigned char *)t3);
    t11 = (t10 != (unsigned char)3);
    if (t11 == 1)
        goto LAB33;

LAB34:    t5 = (unsigned char)0;

LAB35:    if (t5 == 1)
        goto LAB30;

LAB31:    t4 = (unsigned char)0;

LAB32:    if (t4 != 0)
        goto LAB27;

LAB29:
LAB28:    goto LAB14;

LAB24:    goto LAB23;

LAB26:    goto LAB24;

LAB27:    t2 = (t0 + 6680);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t19 = (t9 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB28;

LAB30:    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t17 = *((unsigned char *)t7);
    t18 = (t17 == (unsigned char)2);
    t4 = t18;
    goto LAB32;

LAB33:    t2 = (t0 + 2472U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 != (unsigned char)3);
    t5 = t13;
    goto LAB35;

LAB36:    t3 = (t0 + 6120);
    *((int *)t3) = 0;
    goto LAB2;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

}

static void unisim_a_0402065255_2679555531_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    int64 t14;
    int64 t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    double t20;
    unsigned char t21;

LAB0:    t1 = (t0 + 5504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 != 0)
        goto LAB4;

LAB6:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t5 = *((unsigned char *)t3);
    t10 = (t5 == (unsigned char)1);
    if (t10 == 1)
        goto LAB10;

LAB11:    t4 = (unsigned char)0;

LAB12:    if (t4 != 0)
        goto LAB7;

LAB9:
LAB8:
LAB5:
LAB34:    t2 = (t0 + 6136);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB35;

LAB1:    return;
LAB4:    t2 = (t0 + 6744);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB5;

LAB7:    t2 = (t0 + 1152U);
    t13 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t13 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB8;

LAB10:    t2 = (t0 + 3112U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)3);
    t4 = t12;
    goto LAB12;

LAB13:    t7 = (t0 + 1672U);
    t8 = *((char **)t7);
    t14 = *((int64 *)t8);
    t15 = (0 * 1LL);
    t16 = (t14 != t15);
    if (t16 != 0)
        goto LAB16;

LAB18:
LAB17:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t14 = *((int64 *)t3);
    t20 = (9.0999999999999996 / 10.000000000000000);
    t15 = (t14 * t20);
    t2 = (t0 + 5312);
    xsi_process_wait(t2, t15);

LAB21:    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB16:    t7 = (t0 + 6744);
    t9 = (t7 + 56U);
    t17 = *((char **)t9);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    goto LAB17;

LAB19:    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t10 = *((unsigned char *)t3);
    t11 = (t10 != (unsigned char)3);
    if (t11 == 1)
        goto LAB29;

LAB30:    t5 = (unsigned char)0;

LAB31:    if (t5 == 1)
        goto LAB26;

LAB27:    t4 = (unsigned char)0;

LAB28:    if (t4 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB14;

LAB20:    goto LAB19;

LAB22:    goto LAB20;

LAB23:    t2 = (t0 + 6744);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t17 = (t9 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB24;

LAB26:    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t16 = *((unsigned char *)t7);
    t21 = (t16 == (unsigned char)2);
    t4 = t21;
    goto LAB28;

LAB29:    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 != (unsigned char)3);
    t5 = t13;
    goto LAB31;

LAB32:    t3 = (t0 + 6136);
    *((int *)t3) = 0;
    goto LAB2;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

}

static void unisim_a_0402065255_2679555531_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    t1 = (t0 + 5752U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)1);
    if (t5 != 0)
        goto LAB4;

LAB6:
LAB5:
LAB15:    t2 = (t0 + 6152);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB4:    t2 = (t0 + 1792U);
    t6 = xsi_signal_has_event(t2);
    if (t6 != 0)
        goto LAB7;

LAB9:
LAB8:    t2 = (t0 + 1952U);
    t4 = xsi_signal_has_event(t2);
    if (t4 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB5;

LAB7:    t7 = (t0 + 1832U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t7 = (t0 + 6808);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB8;

LAB10:    t3 = (t0 + 1992U);
    t7 = *((char **)t3);
    t5 = *((unsigned char *)t7);
    t3 = (t0 + 6808);
    t8 = (t3 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t5;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB11;

LAB13:    t3 = (t0 + 6152);
    *((int *)t3) = 0;
    goto LAB2;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

}


extern void unisim_a_0402065255_2679555531_init()
{
	static char *pe[] = {(void *)unisim_a_0402065255_2679555531_p_0,(void *)unisim_a_0402065255_2679555531_p_1,(void *)unisim_a_0402065255_2679555531_p_2,(void *)unisim_a_0402065255_2679555531_p_3,(void *)unisim_a_0402065255_2679555531_p_4,(void *)unisim_a_0402065255_2679555531_p_5};
	xsi_register_didat("unisim_a_0402065255_2679555531", "isim/toplevel.exe.sim/unisim/a_0402065255_2679555531.didat");
	xsi_register_executes(pe);
}
