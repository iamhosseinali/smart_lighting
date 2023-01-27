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
static const char *ng0 = "F:/Edu/FPGA/generic_fuzzy_test/tb0.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );


static void work_a_0548161372_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 5512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 6144);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4528U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 5320);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 6144);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4528U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 5320);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0548161372_2372691052_p_1(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    char *t11;

LAB0:    t1 = (t0 + 5760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(139, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 300, 11);
    t4 = (11U != 11U);
    if (t4 == 1)
        goto LAB4;

LAB5:    t5 = (t0 + 6208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 11U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(142, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 0, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB6;

LAB7:    t6 = (t0 + 6272);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(143, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 0, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB8;

LAB9:    t6 = (t0 + 6336);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(144, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 200, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB10;

LAB11:    t6 = (t0 + 6400);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(146, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 0, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB12;

LAB13:    t6 = (t0 + 6464);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(147, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 200, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB14;

LAB15:    t6 = (t0 + 6528);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(148, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 400, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB16;

LAB17:    t6 = (t0 + 6592);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(150, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 200, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB18;

LAB19:    t6 = (t0 + 6656);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(151, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 400, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB20;

LAB21:    t6 = (t0 + 6720);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(152, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 600, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB22;

LAB23:    t6 = (t0 + 6784);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(154, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 400, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB24;

LAB25:    t6 = (t0 + 6848);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(155, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 600, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB26;

LAB27:    t6 = (t0 + 6912);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(156, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 600, 11);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (11U != t10);
    if (t4 == 1)
        goto LAB28;

LAB29:    t6 = (t0 + 6976);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 11U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(158, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 0, 8);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (8U != t10);
    if (t4 == 1)
        goto LAB30;

LAB31:    t6 = (t0 + 7040);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(159, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 40, 8);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (8U != t10);
    if (t4 == 1)
        goto LAB32;

LAB33:    t6 = (t0 + 7104);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(160, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 60, 8);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (8U != t10);
    if (t4 == 1)
        goto LAB34;

LAB35:    t6 = (t0 + 7168);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(161, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t3, 100, 8);
    t5 = (t3 + 12U);
    t10 = *((unsigned int *)t5);
    t10 = (t10 * 1U);
    t4 = (8U != t10);
    if (t4 == 1)
        goto LAB36;

LAB37:    t6 = (t0 + 7232);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 7296);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(165, ng0);

LAB40:    *((char **)t1) = &&LAB41;

LAB1:    return;
LAB4:    xsi_size_not_matching(11U, 11U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(11U, t10, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(11U, t10, 0);
    goto LAB9;

LAB10:    xsi_size_not_matching(11U, t10, 0);
    goto LAB11;

LAB12:    xsi_size_not_matching(11U, t10, 0);
    goto LAB13;

LAB14:    xsi_size_not_matching(11U, t10, 0);
    goto LAB15;

LAB16:    xsi_size_not_matching(11U, t10, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(11U, t10, 0);
    goto LAB19;

LAB20:    xsi_size_not_matching(11U, t10, 0);
    goto LAB21;

LAB22:    xsi_size_not_matching(11U, t10, 0);
    goto LAB23;

LAB24:    xsi_size_not_matching(11U, t10, 0);
    goto LAB25;

LAB26:    xsi_size_not_matching(11U, t10, 0);
    goto LAB27;

LAB28:    xsi_size_not_matching(11U, t10, 0);
    goto LAB29;

LAB30:    xsi_size_not_matching(8U, t10, 0);
    goto LAB31;

LAB32:    xsi_size_not_matching(8U, t10, 0);
    goto LAB33;

LAB34:    xsi_size_not_matching(8U, t10, 0);
    goto LAB35;

LAB36:    xsi_size_not_matching(8U, t10, 0);
    goto LAB37;

LAB38:    goto LAB2;

LAB39:    goto LAB38;

LAB41:    goto LAB39;

}


extern void work_a_0548161372_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0548161372_2372691052_p_0,(void *)work_a_0548161372_2372691052_p_1};
	xsi_register_didat("work_a_0548161372_2372691052", "isim/tb0_isim_beh.exe.sim/work/a_0548161372_2372691052.didat");
	xsi_register_executes(pe);
}
