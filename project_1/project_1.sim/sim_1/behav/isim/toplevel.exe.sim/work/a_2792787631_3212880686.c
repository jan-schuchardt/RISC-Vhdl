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

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2792787631_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:
LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4880);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4768);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2792787631_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:
LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4944);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 4784);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2792787631_3212880686_p_2(char *t0)
{
    char t3[16];
    char t17[16];
    char t18[16];
    char t21[16];
    char t25[16];
    char *t1;
    unsigned char t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    int t19;
    unsigned int t20;
    int t22;
    unsigned int t23;
    unsigned int t24;
    char *t26;
    int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4800);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 7576U);
    t6 = (t0 + 2632U);
    t7 = *((char **)t6);
    t6 = (t0 + 7672U);
    t8 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t3, t5, t4, t7, t6);
    t9 = (t0 + 5008);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t8, 32U);
    xsi_driver_first_trans_fast(t9);
    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t14 = (9 - 9);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t1 = (t4 + t16);
    t5 = (t0 + 9926);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t18 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 9;
    t10 = (t9 + 4U);
    *((int *)t10) = 3;
    t10 = (t9 + 8U);
    *((int *)t10) = -1;
    t19 = (3 - 9);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t20;
    t10 = (t21 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 5;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t22 = (5 - 0);
    t20 = (t22 * 1);
    t20 = (t20 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t20;
    t7 = xsi_base_array_concat(t7, t17, t8, (char)97, t1, t18, (char)97, t5, t21, (char)101);
    t11 = (t0 + 2792U);
    t12 = *((char **)t11);
    t20 = (31 - 9);
    t23 = (t20 * 1U);
    t24 = (0 + t23);
    t11 = (t12 + t24);
    t13 = (t25 + 0U);
    t26 = (t13 + 0U);
    *((int *)t26) = 9;
    t26 = (t13 + 4U);
    *((int *)t26) = 3;
    t26 = (t13 + 8U);
    *((int *)t26) = -1;
    t27 = (3 - 9);
    t28 = (t27 * -1);
    t28 = (t28 + 1);
    t26 = (t13 + 12U);
    *((unsigned int *)t26) = t28;
    t26 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t3, t7, t17, t11, t25);
    t29 = (t0 + 5072);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t26, 11U);
    xsi_driver_first_trans_fast_port(t29);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t14 = (9 - 2);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t1 = (t5 + t16);
    t6 = (t17 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 2;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t19 = (0 - 2);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t20;
    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t20 = (9 - 2);
    t23 = (t20 * 1U);
    t24 = (0 + t23);
    t7 = (t8 + t24);
    t9 = (t0 + 9932);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t21 + 0U);
    t26 = (t13 + 0U);
    *((int *)t26) = 2;
    t26 = (t13 + 4U);
    *((int *)t26) = 0;
    t26 = (t13 + 8U);
    *((int *)t26) = -1;
    t22 = (0 - 2);
    t28 = (t22 * -1);
    t28 = (t28 + 1);
    t26 = (t13 + 12U);
    *((unsigned int *)t26) = t28;
    t26 = (t25 + 0U);
    t29 = (t26 + 0U);
    *((int *)t29) = 0;
    t29 = (t26 + 4U);
    *((int *)t29) = 2;
    t29 = (t26 + 8U);
    *((int *)t29) = 1;
    t27 = (2 - 0);
    t28 = (t27 * 1);
    t28 = (t28 + 1);
    t29 = (t26 + 12U);
    *((unsigned int *)t29) = t28;
    t11 = xsi_base_array_concat(t11, t18, t12, (char)97, t7, t21, (char)97, t9, t25, (char)101);
    t29 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t3, t1, t17, t11, t18);
    t34 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t29, t3);
    t35 = (t34 - 0);
    t28 = (t35 * 1);
    xsi_vhdl_check_range_of_index(0, 63, 1, t34);
    t36 = (1U * t28);
    t37 = (0 + t36);
    t30 = (t4 + t37);
    t2 = *((unsigned char *)t30);
    t31 = (t0 + 5136);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t38 = (t33 + 56U);
    t39 = *((char **)t38);
    *((unsigned char *)t39) = t2;
    xsi_driver_first_trans_fast(t31);
    goto LAB3;

}


extern void work_a_2792787631_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2792787631_3212880686_p_0,(void *)work_a_2792787631_3212880686_p_1,(void *)work_a_2792787631_3212880686_p_2};
	xsi_register_didat("work_a_2792787631_3212880686", "isim/toplevel.exe.sim/work/a_2792787631_3212880686.didat");
	xsi_register_executes(pe);
}
