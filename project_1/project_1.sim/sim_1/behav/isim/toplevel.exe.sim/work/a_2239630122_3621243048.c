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
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3472088553_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2239630122_3621243048_p_0(char *t0)
{
    char t24[16];
    char t25[16];
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
    int t11;
    int t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;

LAB0:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t1 = (t0 + 6801);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    t1 = (t0 + 6817);
    t5 = (t0 + 4256);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 6820);
    t5 = (t0 + 4320);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 6836);
    t5 = (t0 + 4384);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 4448);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 6844);
    t5 = (t0 + 4576);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    t1 = (t0 + 6852);
    t5 = (t0 + 4640);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    t2 = (t0 + 2632U);
    t5 = *((char **)t2);
    t2 = (t0 + 6855);
    t11 = xsi_mem_cmp(t2, t5, 3U);
    if (t11 == 1)
        goto LAB8;

LAB13:    t7 = (t0 + 6858);
    t12 = xsi_mem_cmp(t7, t5, 3U);
    if (t12 == 1)
        goto LAB9;

LAB14:    t9 = (t0 + 6861);
    t13 = xsi_mem_cmp(t9, t5, 3U);
    if (t13 == 1)
        goto LAB10;

LAB15:    t14 = (t0 + 6864);
    t16 = xsi_mem_cmp(t14, t5, 3U);
    if (t16 == 1)
        goto LAB11;

LAB16:
LAB12:
LAB7:    goto LAB3;

LAB8:    t17 = (t0 + 1352U);
    t18 = *((char **)t17);
    t4 = *((unsigned char *)t18);
    t19 = (t4 == (unsigned char)2);
    if (t19 != 0)
        goto LAB18;

LAB20:
LAB19:    goto LAB7;

LAB9:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6889);
    t7 = ((IEEE_P_1242562249) + 3000);
    t8 = (t0 + 6680U);
    t9 = (t25 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 0;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t11 = (0 - 0);
    t26 = (t11 * 1);
    t26 = (t26 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t26;
    t6 = xsi_base_array_concat(t6, t24, t7, (char)97, t2, t8, (char)97, t1, t25, (char)101);
    t10 = (t0 + 1992U);
    t14 = *((char **)t10);
    t10 = (t0 + 6664U);
    t3 = ieee_p_1242562249_sub_3472088553_1035706684(IEEE_P_1242562249, t6, t24, t14, t10);
    if (t3 != 0)
        goto LAB21;

LAB23:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6680U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t24, t2, t1, 1);
    t6 = (t24 + 12U);
    t26 = *((unsigned int *)t6);
    t27 = (1U * t26);
    t3 = (16U != t27);
    if (t3 == 1)
        goto LAB24;

LAB25:    t7 = (t0 + 4192);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast(t7);

LAB22:    goto LAB7;

LAB10:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6680U);
    t5 = (t0 + 1992U);
    t6 = *((char **)t5);
    t5 = (t0 + 6664U);
    t3 = ieee_p_1242562249_sub_3472088553_1035706684(IEEE_P_1242562249, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB26;

LAB28:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6680U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t24, t2, t1, 1);
    t6 = (t24 + 12U);
    t26 = *((unsigned int *)t6);
    t27 = (1U * t26);
    t3 = (16U != t27);
    if (t3 == 1)
        goto LAB36;

LAB37:    t7 = (t0 + 4192);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast(t7);

LAB27:    goto LAB7;

LAB11:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6680U);
    t5 = (t0 + 1992U);
    t6 = *((char **)t5);
    t5 = (t0 + 6664U);
    t3 = ieee_p_1242562249_sub_3472088553_1035706684(IEEE_P_1242562249, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB38;

LAB40:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6680U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t24, t2, t1, 1);
    t6 = (t24 + 12U);
    t26 = *((unsigned int *)t6);
    t27 = (1U * t26);
    t3 = (16U != t27);
    if (t3 == 1)
        goto LAB44;

LAB45:    t7 = (t0 + 4192);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast(t7);

LAB39:    goto LAB7;

LAB17:;
LAB18:    t17 = (t0 + 4512);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t17);
    t1 = (t0 + 6867);
    t5 = (t0 + 4192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 6883);
    t5 = (t0 + 4256);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    t1 = (t0 + 6886);
    t5 = (t0 + 4640);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    goto LAB19;

LAB21:    t15 = (t0 + 6890);
    t18 = (t0 + 4192);
    t20 = (t18 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 16U);
    xsi_driver_first_trans_fast(t18);
    t1 = (t0 + 6906);
    t5 = (t0 + 4640);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    goto LAB22;

LAB24:    xsi_size_not_matching(16U, t27, 0);
    goto LAB25;

LAB26:    t7 = (t0 + 6909);
    t9 = (t0 + 4192);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t7, 16U);
    xsi_driver_first_trans_fast(t9);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2472U);
    t5 = *((char **)t1);
    t26 = (7 - 7);
    t27 = (t26 * 1U);
    t28 = (0 + t27);
    t1 = (t5 + t28);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t25 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 7;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t11 = (1 - 7);
    t29 = (t11 * -1);
    t29 = (t29 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t29;
    t6 = xsi_base_array_concat(t6, t24, t7, (char)99, t3, (char)97, t1, t25, (char)101);
    t29 = (1U + 7U);
    t4 = (8U != t29);
    if (t4 == 1)
        goto LAB29;

LAB30:    t9 = (t0 + 4384);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t6, 8U);
    xsi_driver_first_trans_fast(t9);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6696U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t24, t2, t1, 1);
    t6 = (t24 + 12U);
    t26 = *((unsigned int *)t6);
    t27 = (1U * t26);
    t3 = (3U != t27);
    if (t3 == 1)
        goto LAB31;

LAB32:    t7 = (t0 + 4256);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    memcpy(t14, t5, 3U);
    xsi_driver_first_trans_fast(t7);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6696U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 7);
    if (t3 != 0)
        goto LAB33;

LAB35:
LAB34:    goto LAB27;

LAB29:    xsi_size_not_matching(8U, t29, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(3U, t27, 0);
    goto LAB32;

LAB33:    t5 = (t0 + 6925);
    t7 = (t0 + 4640);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    memcpy(t14, t5, 3U);
    xsi_driver_first_trans_fast(t7);
    goto LAB34;

LAB36:    xsi_size_not_matching(16U, t27, 0);
    goto LAB37;

LAB38:    t7 = (t0 + 6928);
    t9 = (t0 + 4192);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t7, 16U);
    xsi_driver_first_trans_fast(t9);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB41;

LAB43:    t1 = (t0 + 4448);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB42:    goto LAB39;

LAB41:    t1 = (t0 + 6944);
    t6 = (t0 + 4640);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t6);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 4576);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB42;

LAB44:    xsi_size_not_matching(16U, t27, 0);
    goto LAB45;

}


extern void work_a_2239630122_3621243048_init()
{
	static char *pe[] = {(void *)work_a_2239630122_3621243048_p_0};
	xsi_register_didat("work_a_2239630122_3621243048", "isim/toplevel.exe.sim/work/a_2239630122_3621243048.didat");
	xsi_register_executes(pe);
}
