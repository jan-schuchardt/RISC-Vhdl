# Synplicity, Inc. constraint file
# Written on Mon Jun 27 15:50:39 2005

define_global_attribute          syn_global_buffers {2}
define_attribute          {v:work.ddr_parameters_0} syn_hier {hard}
define_attribute          {v:work.ddr} syn_hier {hard}
define_attribute          {v:work.ddr_cal_ctl} syn_hier {hard}
define_attribute          {v:work.ddr_cal_top} syn_hier {hard}
define_attribute          {v:work.ddr_clk_dcm} syn_hier {hard}
define_attribute          {v:work.ddr_controller_0} syn_hier {hard}
define_attribute          {v:work.ddr_controller_iobs_0} syn_hier {hard}
define_attribute          {v:work.ddr_data_path_0} syn_hier {hard}
define_attribute          {v:work.ddr_data_path_iobs_0} syn_hier {hard}
define_attribute          {v:work.ddr_data_read_0} syn_hier {hard}
define_attribute          {v:work.ddr_data_read_controller_0} syn_hier {hard}
define_attribute          {v:work.ddr_data_write_0} syn_hier {hard}
define_attribute          {v:work.ddr_dqs_delay_0} syn_hier {hard}
define_attribute          {v:work.ddr_fifo_0_wr_en_0} syn_hier {hard}
define_attribute          {v:work.ddr_fifo_1_wr_en_0} syn_hier {hard}
define_attribute          {v:work.ddr_infrastructure} syn_hier {hard}
define_attribute          {v:work.ddr_infrastructure_iobs_0} syn_hier {hard}
define_attribute          {v:work.ddr_infrastructure_top} syn_hier {hard}
define_attribute          {v:work.ddr_iobs_0} syn_hier {hard}
define_attribute          {v:work.ddr_ram8d_0} syn_hier {hard}
define_attribute          {v:work.ddr_rd_gray_cntr} syn_hier {hard}
define_attribute          {v:work.ddr_s3_dm_iob} syn_hier {hard}
define_attribute          {v:work.ddr_s3_dq_iob} syn_hier {hard}
define_attribute          {v:work.ddr_s3_dqs_iob} syn_hier {hard}
define_attribute          {v:work.ddr_tap_dly} syn_hier {hard}
define_attribute          {v:work.ddr_top_0} syn_hier {hard}
define_attribute          {v:work.ddr_wr_gray_cntr} syn_hier {hard}


# clock Constraints

define_clock -disable -name {clk_dcm0} -period 7.519 -clockgroup default_clkgroup_2
define_clock          -name {infrastructure_top0.lvds_clk_input} -period 7.519 -clockgroup default_clkgroup_3
define_clock -disable -name {DCM_INST1} -period 7.519 -clockgroup default_clkgroup_4


