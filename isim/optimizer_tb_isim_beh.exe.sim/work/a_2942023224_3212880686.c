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
static const char *ng0 = "F:/Edu/FPGA/generic_fuzzy_test/Optimizer.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_2110375371_1035706684(char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );
unsigned char ieee_p_1242562249_sub_2720006528_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_2720042465_1035706684(char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2931903318_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2942023224_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(68, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4616);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4520);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2942023224_3212880686_p_1(char *t0)
{
    char t9[16];
    char t17[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4536);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 4680);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 11U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 4744);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 11U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2632U);
    t3 = *((char **)t1);
    t1 = (t0 + 7516U);
    t4 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t9, t3, t1, 1);
    t5 = (t9 + 12U);
    t10 = *((unsigned int *)t5);
    t11 = (1U * t10);
    t2 = (30U != t11);
    if (t2 == 1)
        goto LAB5;

LAB6:    t6 = (t0 + 4808);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 30U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 4872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2632U);
    t3 = *((char **)t1);
    t1 = (t0 + 7516U);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t9, 100, 30);
    t14 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t3, t1, t4, t9);
    if (t14 == 1)
        goto LAB10;

LAB11:    t2 = (unsigned char)0;

LAB12:    if (t2 != 0)
        goto LAB7;

LAB9:
LAB8:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 7436U);
    t4 = (t0 + 2472U);
    t5 = *((char **)t4);
    t4 = (t0 + 7500U);
    t2 = ieee_p_1242562249_sub_2720006528_1035706684(IEEE_P_1242562249, t3, t1, t5, t4);
    if (t2 != 0)
        goto LAB15;

LAB17:
LAB16:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 7452U);
    t4 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t9, 100, 8);
    t2 = ieee_p_1242562249_sub_2720042465_1035706684(IEEE_P_1242562249, t3, t1, t4, t9);
    if (t2 != 0)
        goto LAB18;

LAB20:
LAB19:    goto LAB3;

LAB5:    xsi_size_not_matching(30U, t11, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(83, ng0);
    t5 = (t0 + 1832U);
    t7 = *((char **)t5);
    t5 = (t0 + 7452U);
    t8 = ieee_p_1242562249_sub_2931903318_1035706684(IEEE_P_1242562249, t17, t7, t5, 1);
    t12 = (t17 + 12U);
    t10 = *((unsigned int *)t12);
    t11 = (1U * t10);
    t18 = (8U != t11);
    if (t18 == 1)
        goto LAB13;

LAB14:    t13 = (t0 + 4936);
    t19 = (t13 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t8, 8U);
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 5000);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(85, ng0);
    t1 = xsi_get_transient_memory(30U);
    memset(t1, 0, 30U);
    t3 = t1;
    memset(t3, (unsigned char)2, 30U);
    t4 = (t0 + 4808);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 30U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 4872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB10:    t5 = (t0 + 2792U);
    t6 = *((char **)t5);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t2 = t16;
    goto LAB12;

LAB13:    xsi_size_not_matching(8U, t11, 0);
    goto LAB14;

LAB15:    xsi_set_current_line(93, ng0);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 5064);
    t8 = (t6 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    memcpy(t19, t7, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 5128);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB18:    xsi_set_current_line(101, ng0);
    t5 = (t0 + 2152U);
    t6 = *((char **)t5);
    t5 = (t0 + 5000);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 5192);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 4872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB19;

}


extern void work_a_2942023224_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2942023224_3212880686_p_0,(void *)work_a_2942023224_3212880686_p_1};
	xsi_register_didat("work_a_2942023224_3212880686", "isim/optimizer_tb_isim_beh.exe.sim/work/a_2942023224_3212880686.didat");
	xsi_register_executes(pe);
}
