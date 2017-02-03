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

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1409261557_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:
LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4560);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 4448);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1409261557_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:
LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 4624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4464);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1409261557_3212880686_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    int t21;
    int t22;
    int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 4688);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    t3 = (t0 + 2152U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 7057);
    t12 = xsi_mem_cmp(t1, t3, 3U);
    if (t12 == 1)
        goto LAB17;

LAB24:    t7 = (t0 + 7060);
    t19 = xsi_mem_cmp(t7, t3, 3U);
    if (t19 == 1)
        goto LAB18;

LAB25:    t11 = (t0 + 7063);
    t20 = xsi_mem_cmp(t11, t3, 3U);
    if (t20 == 1)
        goto LAB19;

LAB26:    t14 = (t0 + 7066);
    t21 = xsi_mem_cmp(t14, t3, 3U);
    if (t21 == 1)
        goto LAB20;

LAB27:    t16 = (t0 + 7069);
    t22 = xsi_mem_cmp(t16, t3, 3U);
    if (t22 == 1)
        goto LAB21;

LAB28:    t18 = (t0 + 7072);
    t24 = xsi_mem_cmp(t18, t3, 3U);
    if (t24 == 1)
        goto LAB22;

LAB29:
LAB23:    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t3 = t1;
    memset(t3, (unsigned char)2, 8U);
    t4 = (t0 + 4752);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);

LAB16:
LAB9:    goto LAB6;

LAB8:    t3 = (t0 + 1672U);
    t10 = *((char **)t3);
    t3 = (t0 + 7054);
    t12 = xsi_mem_cmp(t3, t10, 3U);
    if (t12 == 1)
        goto LAB12;

LAB14:
LAB13:
LAB11:    goto LAB9;

LAB12:    t13 = (t0 + 1832U);
    t14 = *((char **)t13);
    t13 = (t0 + 4688);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t14, 8U);
    xsi_driver_first_trans_delta(t13, 8U, 8U, 0LL);
    goto LAB11;

LAB15:;
LAB17:    t25 = (t0 + 2312U);
    t26 = *((char **)t25);
    t27 = (31 - 15);
    t28 = (t27 * 1U);
    t29 = (0 + t28);
    t25 = (t26 + t29);
    t30 = (t0 + 4752);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t25, 8U);
    xsi_driver_first_trans_fast_port(t30);
    goto LAB16;

LAB18:    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t27 = (31 - 7);
    t28 = (t27 * 1U);
    t29 = (0 + t28);
    t1 = (t3 + t29);
    t4 = (t0 + 4752);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB16;

LAB19:    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t3 = t1;
    memset(t3, (unsigned char)2, 8U);
    t4 = (t0 + 4752);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB16;

LAB20:    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t27 = (15 - 7);
    t28 = (t27 * 1U);
    t29 = (0 + t28);
    t1 = (t3 + t29);
    t4 = (t0 + 4752);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB16;

LAB21:    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t27 = (31 - 23);
    t28 = (t27 * 1U);
    t29 = (0 + t28);
    t1 = (t3 + t29);
    t4 = (t0 + 4752);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB16;

LAB22:    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t27 = (31 - 31);
    t28 = (t27 * 1U);
    t29 = (0 + t28);
    t1 = (t3 + t29);
    t4 = (t0 + 4752);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB16;

LAB30:;
}


extern void work_a_1409261557_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1409261557_3212880686_p_0,(void *)work_a_1409261557_3212880686_p_1,(void *)work_a_1409261557_3212880686_p_2};
	xsi_register_didat("work_a_1409261557_3212880686", "isim/toplevel.exe.sim/work/a_1409261557_3212880686.didat");
	xsi_register_executes(pe);
}
