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


static void work_a_2978969017_0479980441_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 7112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9744);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 7272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9808);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9872);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9936);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 9616);
    *((int *)t1) = 1;

LAB1:    return;
}

static void work_a_2978969017_0479980441_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    static char *nl0[] = {&&LAB8, &&LAB9, &&LAB15, &&LAB15, &&LAB15, &&LAB15, &&LAB15, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14};

LAB0:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t3 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9632);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t1 = (t0 + 10000);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10064);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10128);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 17065);
    t5 = (t0 + 10192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 7568U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t1 = (t0 + 10256);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    t1 = xsi_get_transient_memory(13U);
    memset(t1, 0, 13U);
    t2 = t1;
    memset(t2, (unsigned char)2, 13U);
    t5 = (t0 + 10320);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 13U);
    xsi_driver_first_trans_fast(t5);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t2 = t1;
    memset(t2, (unsigned char)2, 10U);
    t5 = (t0 + 10384);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 10U);
    xsi_driver_first_trans_fast(t5);
    t1 = xsi_get_transient_memory(2U);
    memset(t1, 0, 2U);
    t2 = t1;
    memset(t2, (unsigned char)2, 2U);
    t5 = (t0 + 10448);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    t2 = (t0 + 5192U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB7:    goto LAB3;

LAB8:    t6 = (t0 + 17068);
    t8 = (t0 + 10512);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 32U);
    xsi_driver_first_trans_fast_port(t8);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t3 = (t10 == 0);
    if (t3 != 0)
        goto LAB16;

LAB18:    t1 = (t0 + 17103);
    t5 = (t0 + 10192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t14 = (t10 - 1);
    t1 = (t0 + 10256);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t14;
    xsi_driver_first_trans_fast(t1);

LAB17:    goto LAB7;

LAB9:    t1 = (t0 + 17106);
    t5 = (t0 + 10512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 17138);
    t5 = (t0 + 10192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB19;

LAB21:
LAB20:    goto LAB7;

LAB10:    t1 = (t0 + 17141);
    t5 = (t0 + 10512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 10064);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10128);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 6952U);
    t2 = *((char **)t1);
    t15 = *((unsigned char *)t2);
    t16 = (t15 == (unsigned char)3);
    if (t16 == 1)
        goto LAB28;

LAB29:    t4 = (unsigned char)0;

LAB30:    if (t4 == 1)
        goto LAB25;

LAB26:    t3 = (unsigned char)0;

LAB27:    if (t3 != 0)
        goto LAB22;

LAB24:    t1 = (t0 + 6792U);
    t2 = *((char **)t1);
    t15 = *((unsigned char *)t2);
    t16 = (t15 == (unsigned char)3);
    if (t16 == 1)
        goto LAB36;

LAB37:    t4 = (unsigned char)0;

LAB38:    if (t4 == 1)
        goto LAB33;

LAB34:    t3 = (unsigned char)0;

LAB35:    if (t3 != 0)
        goto LAB31;

LAB32:    t1 = (t0 + 6952U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t15 = (t4 == (unsigned char)3);
    if (t15 == 1)
        goto LAB41;

LAB42:    t1 = (t0 + 6792U);
    t5 = *((char **)t1);
    t16 = *((unsigned char *)t5);
    t17 = (t16 == (unsigned char)3);
    t3 = t17;

LAB43:    if (t3 != 0)
        goto LAB39;

LAB40:    t1 = (t0 + 10640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB23:    goto LAB7;

LAB11:    t1 = (t0 + 17173);
    t5 = (t0 + 10512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t15 = (t4 == (unsigned char)2);
    if (t15 == 1)
        goto LAB47;

LAB48:    t3 = (unsigned char)0;

LAB49:    if (t3 != 0)
        goto LAB44;

LAB46:    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t15 = (t4 == (unsigned char)3);
    if (t15 == 1)
        goto LAB52;

LAB53:    t3 = (unsigned char)0;

LAB54:    if (t3 != 0)
        goto LAB50;

LAB51:
LAB45:    goto LAB7;

LAB12:    t1 = (t0 + 17205);
    t5 = (t0 + 10512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB55;

LAB57:
LAB56:    goto LAB7;

LAB13:    t1 = (t0 + 17237);
    t5 = (t0 + 10512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t15 = (t4 == (unsigned char)2);
    if (t15 == 1)
        goto LAB61;

LAB62:    t3 = (unsigned char)0;

LAB63:    if (t3 != 0)
        goto LAB58;

LAB60:    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t15 = (t4 == (unsigned char)3);
    if (t15 == 1)
        goto LAB66;

LAB67:    t3 = (unsigned char)0;

LAB68:    if (t3 != 0)
        goto LAB64;

LAB65:
LAB59:    goto LAB7;

LAB14:    t1 = (t0 + 17269);
    t5 = (t0 + 10512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB69;

LAB71:
LAB70:    goto LAB7;

LAB15:    goto LAB7;

LAB16:    t1 = (t0 + 10000);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 17100);
    t5 = (t0 + 10192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    goto LAB17;

LAB19:    t1 = (t0 + 10576);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 10000);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB22:    t1 = (t0 + 10000);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)8;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 10640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB23;

LAB25:    t1 = (t0 + 4072U);
    t6 = *((char **)t1);
    t19 = *((unsigned char *)t6);
    t20 = (t19 == (unsigned char)2);
    t3 = t20;
    goto LAB27;

LAB28:    t1 = (t0 + 5672U);
    t5 = *((char **)t1);
    t17 = *((unsigned char *)t5);
    t18 = (t17 == (unsigned char)2);
    t4 = t18;
    goto LAB30;

LAB31:    t1 = (t0 + 10000);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)10;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 10640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB23;

LAB33:    t1 = (t0 + 4072U);
    t6 = *((char **)t1);
    t19 = *((unsigned char *)t6);
    t20 = (t19 == (unsigned char)2);
    t3 = t20;
    goto LAB35;

LAB36:    t1 = (t0 + 5832U);
    t5 = *((char **)t1);
    t17 = *((unsigned char *)t5);
    t18 = (t17 == (unsigned char)2);
    t4 = t18;
    goto LAB38;

LAB39:    t1 = (t0 + 10576);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 10640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB23;

LAB41:    t3 = (unsigned char)1;
    goto LAB43;

LAB44:    t1 = (t0 + 10064);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB45;

LAB47:    t1 = (t0 + 5352U);
    t5 = *((char **)t1);
    t16 = *((unsigned char *)t5);
    t17 = (t16 == (unsigned char)2);
    t3 = t17;
    goto LAB49;

LAB50:    t1 = (t0 + 10064);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10000);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)9;
    xsi_driver_first_trans_fast(t1);
    goto LAB45;

LAB52:    t1 = (t0 + 5352U);
    t5 = *((char **)t1);
    t16 = *((unsigned char *)t5);
    t17 = (t16 == (unsigned char)3);
    t3 = t17;
    goto LAB54;

LAB55:    t1 = (t0 + 10000);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);
    goto LAB56;

LAB58:    t1 = (t0 + 10128);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB59;

LAB61:    t1 = (t0 + 5512U);
    t5 = *((char **)t1);
    t16 = *((unsigned char *)t5);
    t17 = (t16 == (unsigned char)2);
    t3 = t17;
    goto LAB63;

LAB64:    t1 = (t0 + 10128);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 10000);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)11;
    xsi_driver_first_trans_fast(t1);
    goto LAB59;

LAB66:    t1 = (t0 + 5512U);
    t5 = *((char **)t1);
    t16 = *((unsigned char *)t5);
    t17 = (t16 == (unsigned char)3);
    t3 = t17;
    goto LAB68;

LAB69:    t1 = (t0 + 10000);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);
    goto LAB70;

}

static void work_a_2978969017_0479980441_p_2(char *t0)
{
    char t14[16];
    char t16[16];
    char t30[16];
    char t34[16];
    char t35[16];
    char t39[16];
    char t41[16];
    char *t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t36;
    unsigned int t37;
    char *t38;
    char *t40;
    char *t42;
    char *t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;

LAB0:    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 9648);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t4 = (t0 + 5192U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)8);
    if (t7 == 1)
        goto LAB8;

LAB9:    t4 = (t0 + 5192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)9);
    t3 = t10;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 5192U);
    t4 = *((char **)t1);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)10);
    if (t6 == 1)
        goto LAB17;

LAB18:    t1 = (t0 + 5192U);
    t5 = *((char **)t1);
    t7 = *((unsigned char *)t5);
    t9 = (t7 == (unsigned char)11);
    t2 = t9;

LAB19:    if (t2 != 0)
        goto LAB15;

LAB16:    t1 = xsi_get_transient_memory(64U);
    memset(t1, 0, 64U);
    t4 = t1;
    memset(t4, (unsigned char)2, 64U);
    t5 = (t0 + 10704);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 64U);
    xsi_driver_first_trans_fast(t5);
    t1 = xsi_get_transient_memory(25U);
    memset(t1, 0, 25U);
    t4 = t1;
    memset(t4, (unsigned char)2, 25U);
    t5 = (t0 + 10768);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 25U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 5992U);
    t4 = *((char **)t1);
    t1 = (t0 + 10832);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 3U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 10896);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB5:    t4 = (t0 + 17301);
    t12 = (t0 + 1672U);
    t13 = *((char **)t12);
    t15 = ((IEEE_P_2592010699) + 4024);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 55;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t19 = (55 - 0);
    t20 = (t19 * 1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t18 = (t0 + 16552U);
    t12 = xsi_base_array_concat(t12, t14, t15, (char)97, t4, t16, (char)97, t13, t18, (char)101);
    t20 = (56U + 8U);
    t21 = (64U != t20);
    if (t21 == 1)
        goto LAB11;

LAB12:    t22 = (t0 + 10704);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t12, 64U);
    xsi_driver_first_trans_fast(t22);
    t1 = (t0 + 17357);
    t5 = (t0 + 1512U);
    t8 = *((char **)t5);
    t20 = (15 - 15);
    t27 = (t20 * 1U);
    t28 = (0 + t27);
    t5 = (t8 + t28);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t16 + 0U);
    t15 = (t13 + 0U);
    *((int *)t15) = 0;
    t15 = (t13 + 4U);
    *((int *)t15) = 4;
    t15 = (t13 + 8U);
    *((int *)t15) = 1;
    t19 = (4 - 0);
    t29 = (t19 * 1);
    t29 = (t29 + 1);
    t15 = (t13 + 12U);
    *((unsigned int *)t15) = t29;
    t15 = (t30 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 15;
    t17 = (t15 + 4U);
    *((int *)t17) = 8;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t31 = (8 - 15);
    t29 = (t31 * -1);
    t29 = (t29 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t29;
    t11 = xsi_base_array_concat(t11, t14, t12, (char)97, t1, t16, (char)97, t5, t30, (char)101);
    t17 = (t0 + 1512U);
    t18 = *((char **)t17);
    t29 = (15 - 7);
    t32 = (t29 * 1U);
    t33 = (0 + t32);
    t17 = (t18 + t33);
    t23 = ((IEEE_P_2592010699) + 4024);
    t24 = (t35 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 7;
    t25 = (t24 + 4U);
    *((int *)t25) = 0;
    t25 = (t24 + 8U);
    *((int *)t25) = -1;
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t37 = (t37 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t37;
    t22 = xsi_base_array_concat(t22, t34, t23, (char)97, t11, t14, (char)97, t17, t35, (char)101);
    t25 = (t0 + 17362);
    t40 = ((IEEE_P_2592010699) + 4024);
    t42 = (t41 + 0U);
    t43 = (t42 + 0U);
    *((int *)t43) = 0;
    t43 = (t42 + 4U);
    *((int *)t43) = 3;
    t43 = (t42 + 8U);
    *((int *)t43) = 1;
    t44 = (3 - 0);
    t37 = (t44 * 1);
    t37 = (t37 + 1);
    t43 = (t42 + 12U);
    *((unsigned int *)t43) = t37;
    t38 = xsi_base_array_concat(t38, t39, t40, (char)97, t22, t34, (char)97, t25, t41, (char)101);
    t37 = (5U + 8U);
    t45 = (t37 + 8U);
    t46 = (t45 + 4U);
    t2 = (25U != t46);
    if (t2 == 1)
        goto LAB13;

LAB14:    t43 = (t0 + 10768);
    t47 = (t43 + 56U);
    t48 = *((char **)t47);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    memcpy(t50, t38, 25U);
    xsi_driver_first_trans_fast_port(t43);
    t1 = (t0 + 6152U);
    t4 = *((char **)t1);
    t1 = (t0 + 10832);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 3U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 6472U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t1 = (t0 + 10896);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    t3 = (unsigned char)1;
    goto LAB10;

LAB11:    xsi_size_not_matching(64U, t20, 0);
    goto LAB12;

LAB13:    xsi_size_not_matching(25U, t46, 0);
    goto LAB14;

LAB15:    t1 = xsi_get_transient_memory(64U);
    memset(t1, 0, 64U);
    t8 = t1;
    memset(t8, (unsigned char)2, 64U);
    t11 = (t0 + 10704);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t1, 64U);
    xsi_driver_first_trans_fast(t11);
    t1 = (t0 + 17366);
    t5 = (t0 + 1512U);
    t8 = *((char **)t5);
    t20 = (15 - 15);
    t27 = (t20 * 1U);
    t28 = (0 + t27);
    t5 = (t8 + t28);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t16 + 0U);
    t15 = (t13 + 0U);
    *((int *)t15) = 0;
    t15 = (t13 + 4U);
    *((int *)t15) = 4;
    t15 = (t13 + 8U);
    *((int *)t15) = 1;
    t19 = (4 - 0);
    t29 = (t19 * 1);
    t29 = (t29 + 1);
    t15 = (t13 + 12U);
    *((unsigned int *)t15) = t29;
    t15 = (t30 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 15;
    t17 = (t15 + 4U);
    *((int *)t17) = 8;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t31 = (8 - 15);
    t29 = (t31 * -1);
    t29 = (t29 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t29;
    t11 = xsi_base_array_concat(t11, t14, t12, (char)97, t1, t16, (char)97, t5, t30, (char)101);
    t17 = (t0 + 1512U);
    t18 = *((char **)t17);
    t29 = (15 - 7);
    t32 = (t29 * 1U);
    t33 = (0 + t32);
    t17 = (t18 + t33);
    t23 = ((IEEE_P_2592010699) + 4024);
    t24 = (t35 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 7;
    t25 = (t24 + 4U);
    *((int *)t25) = 0;
    t25 = (t24 + 8U);
    *((int *)t25) = -1;
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t37 = (t37 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t37;
    t22 = xsi_base_array_concat(t22, t34, t23, (char)97, t11, t14, (char)97, t17, t35, (char)101);
    t25 = (t0 + 17371);
    t40 = ((IEEE_P_2592010699) + 4024);
    t42 = (t41 + 0U);
    t43 = (t42 + 0U);
    *((int *)t43) = 0;
    t43 = (t42 + 4U);
    *((int *)t43) = 3;
    t43 = (t42 + 8U);
    *((int *)t43) = 1;
    t44 = (3 - 0);
    t37 = (t44 * 1);
    t37 = (t37 + 1);
    t43 = (t42 + 12U);
    *((unsigned int *)t43) = t37;
    t38 = xsi_base_array_concat(t38, t39, t40, (char)97, t22, t34, (char)97, t25, t41, (char)101);
    t37 = (5U + 8U);
    t45 = (t37 + 8U);
    t46 = (t45 + 4U);
    t2 = (25U != t46);
    if (t2 == 1)
        goto LAB20;

LAB21:    t43 = (t0 + 10768);
    t47 = (t43 + 56U);
    t48 = *((char **)t47);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    memcpy(t50, t38, 25U);
    xsi_driver_first_trans_fast_port(t43);
    t1 = (t0 + 6312U);
    t4 = *((char **)t1);
    t1 = (t0 + 10832);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 3U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 6632U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t1 = (t0 + 10896);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB17:    t2 = (unsigned char)1;
    goto LAB19;

LAB20:    xsi_size_not_matching(25U, t46, 0);
    goto LAB21;

}

static void work_a_2978969017_0479980441_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;

LAB0:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t4 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9664);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t5 = t1;
    memset(t5, (unsigned char)2, 8U);
    t6 = (t0 + 10960);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    t2 = (t0 + 5032U);
    t6 = *((char **)t2);
    t13 = (63 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t2 = (t6 + t15);
    t7 = (t0 + 10960);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

LAB7:    t2 = (t0 + 5832U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)2);
    t3 = t12;
    goto LAB9;

}


extern void work_a_2978969017_0479980441_init()
{
	static char *pe[] = {(void *)work_a_2978969017_0479980441_p_0,(void *)work_a_2978969017_0479980441_p_1,(void *)work_a_2978969017_0479980441_p_2,(void *)work_a_2978969017_0479980441_p_3};
	xsi_register_didat("work_a_2978969017_0479980441", "isim/toplevel.exe.sim/work/a_2978969017_0479980441.didat");
	xsi_register_executes(pe);
}
