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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *UNISIM_P_0947159679;
char *WORK_P_0548693600;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *STD_TEXTIO;
char *IEEE_P_2717149903;
char *IEEE_P_1367372525;
char *UNISIM_P_3222816464;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    work_a_2017408329_0479980441_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_1490675510_1976025627_init();
    unisim_a_0780662263_2014779070_init();
    unisim_a_0850834979_2152628908_init();
    unisim_a_0714155612_2768510774_init();
    unisim_a_0018426790_2768510774_init();
    unisim_a_1297477671_0429821216_init();
    unisim_a_4062544149_2584565154_init();
    work_a_2457555041_3212880686_init();
    unisim_a_2952178788_1492584465_init();
    work_a_0078194887_3212880686_init();
    work_a_2792787631_3212880686_init();
    work_a_3215043537_2730021763_init();
    unisim_a_1558482793_2584565154_init();
    work_a_0710614009_3212880686_init();
    work_a_1710397419_2553685152_init();
    work_a_0832606739_3212880686_init();
    work_a_1226042183_3212880686_init();
    work_a_1415465652_1133169003_init();
    work_a_2239630122_3621243048_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_2832130928_3212880686_init();
    work_a_3862106161_3212880686_init();
    work_a_1680391660_3212880686_init();
    work_a_1409261557_3212880686_init();
    work_a_3904863037_0479980441_init();
    work_a_2421717340_0479980441_init();
    work_a_2978969017_0479980441_init();
    work_a_3564661738_3212880686_init();
    work_p_0548693600_init();
    unisim_a_0350208134_1521797606_init();
    work_a_1799559848_2195797208_init();
    unisim_a_0868425105_1864968857_init();
    work_a_0996948821_2195797208_init();
    unisim_a_0039681122_1945201939_init();
    work_a_2395810647_2195797208_init();
    work_a_0560340522_2195797208_init();
    unisim_a_3668899874_3676810390_init();
    unisim_a_2312293409_3676810390_init();
    unisim_a_1520512555_3676810390_init();
    unisim_a_0165485096_3676810390_init();
    work_a_2802748179_3900970886_init();
    unisim_a_2211589156_2274105955_init();
    work_a_3866078352_2195797208_init();
    work_a_1640589267_2195797208_init();
    work_a_2658720595_2195797208_init();
    work_a_0805485630_2195797208_init();
    work_a_3935819614_2195797208_init();
    work_a_2651895866_2195797208_init();
    work_a_0219033462_2195797208_init();
    unisim_a_3515508837_3735618700_init();
    unisim_a_1478392591_3979135294_init();
    work_a_0017866535_2195797208_init();
    unisim_a_1525108159_2393828108_init();
    work_a_3685619463_2195797208_init();
    work_a_0676184399_2195797208_init();
    unisim_a_0797552106_3081644515_init();
    unisim_a_0995151376_0725860537_init();
    work_a_2501423501_2195797208_init();
    unisim_a_3341709158_0094846637_init();
    work_a_0116448878_2195797208_init();
    work_a_3395254718_2195797208_init();
    work_a_0351176244_2195797208_init();
    work_a_3485647866_2195797208_init();
    unisim_a_4002211264_2683070183_init();
    unisim_a_1893280375_2982649196_init();
    unisim_a_2575347804_2982649196_init();
    unisim_a_0402065255_2679555531_init();
    unisim_a_3566429150_1233898481_init();
    work_a_3377693030_2195797208_init();
    work_a_4175981620_1521691861_init();
    unisim_a_1941169844_3118875749_init();
    work_a_4062392545_3075710497_init();
    work_a_3936318982_2195797208_init();
    work_a_1925900859_2195797208_init();
    work_a_0476210155_0020706168_init();
    work_a_3521875484_2730021763_init();


    xsi_register_tops("work_a_3521875484_2730021763");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    WORK_P_0548693600 = xsi_get_engine_memory("work_p_0548693600");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");

    return xsi_run_simulation(argc, argv);

}
