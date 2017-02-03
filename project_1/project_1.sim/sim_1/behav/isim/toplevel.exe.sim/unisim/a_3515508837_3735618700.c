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


static void unisim_a_3515508837_3735618700_p_0(char *t0)
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
LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4256);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4160);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void unisim_a_3515508837_3735618700_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    int64 t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    t3 = (t2 == (unsigned char)1);
    if (t3 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    t3 = (t2 == (unsigned char)1);
    if (t3 != 0)
        goto LAB12;

LAB13:
LAB3:    t1 = (t0 + 4176);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t4 = (t0 + 1992U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 2152U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t3 = (t2 == (unsigned char)3);
    if (t3 != 0)
        goto LAB8;

LAB9:    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t3 = (t2 == (unsigned char)3);
    if (t3 != 0)
        goto LAB10;

LAB11:
LAB6:    goto LAB3;

LAB5:    t8 = (100 * 1LL);
    t4 = (t0 + 4320);
    t9 = (t4 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t4, 0U, 1, t8);
    t13 = (t0 + 4320);
    xsi_driver_intertial_reject(t13, t8, t8);
    goto LAB6;

LAB8:    t8 = (100 * 1LL);
    t1 = (t0 + 4320);
    t5 = (t1 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, t8);
    t12 = (t0 + 4320);
    xsi_driver_intertial_reject(t12, t8, t8);
    goto LAB6;

LAB10:    t8 = (100 * 1LL);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t1 = (t0 + 4320);
    t9 = (t1 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t6;
    xsi_driver_first_trans_delta(t1, 0U, 1, t8);
    t13 = (t0 + 4320);
    xsi_driver_intertial_reject(t13, t8, t8);
    goto LAB6;

LAB12:    t4 = (t0 + 1992U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB14;

LAB16:    t1 = (t0 + 2152U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t3 = (t2 == (unsigned char)3);
    if (t3 != 0)
        goto LAB17;

LAB18:    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t3 = (t2 == (unsigned char)3);
    if (t3 != 0)
        goto LAB19;

LAB20:
LAB15:    goto LAB3;

LAB14:    t8 = (100 * 1LL);
    t4 = (t0 + 4320);
    t9 = (t4 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t4, 0U, 1, t8);
    t13 = (t0 + 4320);
    xsi_driver_intertial_reject(t13, t8, t8);
    goto LAB15;

LAB17:    t8 = (100 * 1LL);
    t1 = (t0 + 4320);
    t5 = (t1 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, t8);
    t12 = (t0 + 4320);
    xsi_driver_intertial_reject(t12, t8, t8);
    goto LAB15;

LAB19:    t8 = (100 * 1LL);
    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t1 = (t0 + 4320);
    t9 = (t1 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t6;
    xsi_driver_first_trans_delta(t1, 0U, 1, t8);
    t13 = (t0 + 4320);
    xsi_driver_intertial_reject(t13, t8, t8);
    goto LAB15;

}


extern void unisim_a_3515508837_3735618700_init()
{
	static char *pe[] = {(void *)unisim_a_3515508837_3735618700_p_0,(void *)unisim_a_3515508837_3735618700_p_1};
	xsi_register_didat("unisim_a_3515508837_3735618700", "isim/toplevel.exe.sim/unisim/a_3515508837_3735618700.didat");
	xsi_register_executes(pe);
}
