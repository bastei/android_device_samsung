#!/system/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`
case "$target" in
    "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_6x" | "msm7627a"  | "msm7627_surf" | \
    "qsd8250_surf" | "qsd8250_ffa" | "msm7630_surf" | "msm7630_1x" | "msm7630_fusion" | "qsd8650a_st1x")
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        ;;
esac

case "$target" in
    "msm7201a_ffa" | "msm7201a_surf")
        echo 500000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "msm7630_surf" | "msm7630_1x" | "msm7630_fusion")
        echo 75000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 1 > /sys/module/pm2/parameters/idle_sleep_mode
        ;;
esac

case "$target" in
     "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_6x" | "msm7627_surf" | "msm7630_surf" | "msm7630_1x" | "msm7630_fusion" | "msm7627a" )
        echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        ;;
esac

case "$target" in
    "msm8660")
     echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
     echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
     echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_dig
     echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_mem
     echo 1 > /sys/module/rpm_resources/enable_low_power/rpm_cpu
     echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
     echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
     echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
     echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
     echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
     echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
     echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
     echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
     echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
     chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
     chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown -h root.system /sys/devices/system/cpu/mfreq
     chmod -h 220 /sys/devices/system/cpu/mfreq
     chown -h root.system /sys/devices/system/cpu/cpu1/online
     chmod -h 664 /sys/devices/system/cpu/cpu1/online
        ;;
esac

case "$target" in
    "msm8960")
         echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
         echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
         echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig
         echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem
         echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
         echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
	 echo 0 > /sys/module/msm_thermal/core_control/enabled
         echo 1 > /sys/devices/system/cpu/cpu1/online
         echo 1 > /sys/devices/system/cpu/cpu2/online
         echo 1 > /sys/devices/system/cpu/cpu3/online
         echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
         echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
         echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
         echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
         echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
         echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
         echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
         echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
         echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
         echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
         echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
         echo 918000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
         echo 1026000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
         echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
         chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
         chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
         chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
         echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
         echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
         echo 384000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
         echo 384000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
         chown -h system /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
         chown -h system /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
	 echo 1 > /sys/module/msm_thermal/core_control/enabled
         chown -h root.system /sys/devices/system/cpu/mfreq
         chmod -h 220 /sys/devices/system/cpu/mfreq
         chown -h root.system /sys/devices/system/cpu/cpu1/online
         chown -h root.system /sys/devices/system/cpu/cpu2/online
         chown -h root.system /sys/devices/system/cpu/cpu3/online
         chmod -h 664 /sys/devices/system/cpu/cpu1/online
         chmod -h 664 /sys/devices/system/cpu/cpu2/online
         chmod -h 664 /sys/devices/system/cpu/cpu3/online
         # set DCVS parameters for CPU
         echo 40000 > /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
         echo 40000 > /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu0/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu0/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu0/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu0/disable_pc_threshold
         echo 25000 > /sys/module/msm_dcvs/cores/cpu1/slack_time_max_us
         echo 25000 > /sys/module/msm_dcvs/cores/cpu1/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu1/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu1/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu1/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu1/disable_pc_threshold
         echo 25000 > /sys/module/msm_dcvs/cores/cpu2/slack_time_max_us
         echo 25000 > /sys/module/msm_dcvs/cores/cpu2/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu2/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu2/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu2/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu2/disable_pc_threshold
         echo 25000 > /sys/module/msm_dcvs/cores/cpu3/slack_time_max_us
         echo 25000 > /sys/module/msm_dcvs/cores/cpu3/slack_time_min_us
         echo 100000 > /sys/module/msm_dcvs/cores/cpu3/em_win_size_min_us
         echo 500000 > /sys/module/msm_dcvs/cores/cpu3/em_win_size_max_us
         echo 0 > /sys/module/msm_dcvs/cores/cpu3/slack_mode_dynamic
         echo 1000000 > /sys/module/msm_dcvs/cores/cpu3/disable_pc_threshold
         # set DCVS parameters for GPU
         echo 20000 > /sys/module/msm_dcvs/cores/gpu0/slack_time_max_us
         echo 20000 > /sys/module/msm_dcvs/cores/gpu0/slack_time_min_us
         echo 0 > /sys/module/msm_dcvs/cores/gpu0/slack_mode_dynamic
         # set msm_mpdecision parameters
         echo 45000 > /sys/module/msm_mpdecision/slack_time_max_us
         echo 15000 > /sys/module/msm_mpdecision/slack_time_min_us
         echo 100000 > /sys/module/msm_mpdecision/em_win_size_min_us
         echo 1000000 > /sys/module/msm_mpdecision/em_win_size_max_us
         echo 3 > /sys/module/msm_mpdecision/online_util_pct_min
         echo 25 > /sys/module/msm_mpdecision/online_util_pct_max
         echo 97 > /sys/module/msm_mpdecision/em_max_util_pct
         echo 2 > /sys/module/msm_mpdecision/rq_avg_poll_ms
         echo 10 > /sys/module/msm_mpdecision/mp_em_rounding_point_min
         echo 85 > /sys/module/msm_mpdecision/mp_em_rounding_point_max
         echo 50 > /sys/module/msm_mpdecision/iowait_threshold_pct
         #set permissions for the nodes needed by display on/off hook
         chown -h system /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
         chown -h system /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
         chown -h system /sys/module/msm_mpdecision/slack_time_max_us
         chown -h system /sys/module/msm_mpdecision/slack_time_min_us
         chmod -h 664 /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
         chmod -h 664 /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
         chmod -h 664 /sys/module/msm_mpdecision/slack_time_max_us
         chmod -h 664 /sys/module/msm_mpdecision/slack_time_min_us
         if [ -f /sys/devices/soc0/soc_id ]; then
             soc_id=`cat /sys/devices/soc0/soc_id`
         else
             soc_id=`cat /sys/devices/system/soc/soc0/id`
         fi
         case "$soc_id" in
             "130")
                 echo 230 > /sys/class/gpio/export
                 echo 228 > /sys/class/gpio/export
                 echo 229 > /sys/class/gpio/export
                 echo "in" > /sys/class/gpio/gpio230/direction
                 echo "rising" > /sys/class/gpio/gpio230/edge
                 echo "in" > /sys/class/gpio/gpio228/direction
                 echo "rising" > /sys/class/gpio/gpio228/edge
                 echo "in" > /sys/class/gpio/gpio229/direction
                 echo "rising" > /sys/class/gpio/gpio229/edge
                 echo 253 > /sys/class/gpio/export
                 echo 254 > /sys/class/gpio/export
                 echo 257 > /sys/class/gpio/export
                 echo 258 > /sys/class/gpio/export
                 echo 259 > /sys/class/gpio/export
                 echo "out" > /sys/class/gpio/gpio253/direction
                 echo "out" > /sys/class/gpio/gpio254/direction
                 echo "out" > /sys/class/gpio/gpio257/direction
                 echo "out" > /sys/class/gpio/gpio258/direction
                 echo "out" > /sys/class/gpio/gpio259/direction
                 chown -h media /sys/class/gpio/gpio253/value
                 chown -h media /sys/class/gpio/gpio254/value
                 chown -h media /sys/class/gpio/gpio257/value
                 chown -h media /sys/class/gpio/gpio258/value
                 chown -h media /sys/class/gpio/gpio259/value
                 chown -h media /sys/class/gpio/gpio253/direction
                 chown -h media /sys/class/gpio/gpio254/direction
                 chown -h media /sys/class/gpio/gpio257/direction
                 chown -h media /sys/class/gpio/gpio258/direction
                 chown -h media /sys/class/gpio/gpio259/direction
                 echo 0 > /sys/module/rpm_resources/enable_low_power/vdd_dig
                 echo 0 > /sys/module/rpm_resources/enable_low_power/vdd_mem
                 ;;
         esac
         ;;
esac

case "$target" in
    "msm8974")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/retention/idle_enabled
        echo 0 > /sys/module/msm_thermal/core_control/enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "208" | "211" | "214" | "217" | "209" | "212" | "215" | "218" | "194" | "210" | "213" | "216")
                for devfreq_gov in /sys/class/devfreq/qcom,cpubw*/governor
                do
                    echo "cpubw_hwmon" > $devfreq_gov
                done
                echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
                echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
                echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
                echo "20000 1400000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                echo 1190400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                echo 1 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                echo "85 1500000:90 1800000:70" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                echo 20 > /sys/module/cpu_boost/parameters/boost_ms
                echo 1728000 > /sys/module/cpu_boost/parameters/sync_threshold
                echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                echo 1497600 > /sys/module/cpu_boost/parameters/input_boost_freq
                echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
                setprop ro.qualcomm.perf.cores_online 2
            ;;
            *)
                echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
                echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
                echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
                echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
                echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
                echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
                echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
                echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
                echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
                echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
                echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
                echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
                echo 1190400 > /sys/devices/system/cpu/cpufreq/ondemand/input_boost
                echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
            ;;
        esac
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 1 > /sys/module/msm_thermal/core_control/enabled
        chown -h root.system /sys/devices/system/cpu/mfreq
        chmod -h 220 /sys/devices/system/cpu/mfreq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
        echo 1 > /dev/cpuctl/apps/cpu.notify_on_migrate
    ;;
esac

case "$target" in
    "msm8916")
       if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "206" | "247" | "248" | "249" | "250")

		# Change PM debug parameters permission
		chown -h radio.system /sys/module/qpnp_power_on/parameters/reset_enabled
		chown -h radio.system /sys/module/qpnp_power_on/parameters/wake_enabled
		chown -h radio.system /sys/module/qpnp_int/parameters/debug_mask
		chown -h radio.system /sys/module/lpm_levels/parameters/secdebug
		chmod -h 664 /sys/module/qpnp_power_on/parameters/reset_enabled
		chmod -h 664 /sys/module/qpnp_power_on/parameters/wake_enabled
		chmod -h 664 /sys/module/qpnp_int/parameters/debug_mask
		chmod -h 664 /sys/module/lpm_levels/parameters/secdebug
		chmod -h 444 /sys/kernel/wakeup_reasons/last_resume_reason

	        echo Y > /sys/module/lpm_levels/system/cpu0/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/wfi/idle_enabled
	        echo Y > /sys/module/lpm_levels/system/cpu0/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu0/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu0/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/l2-gdhs/idle_enabled
		echo Y > /sys/module/lpm_levels/system/l2-gdhs/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/l2-pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/l2-pc/suspend_enabled
		echo 1 > /sys/devices/system/cpu/cpu1/online
	        echo 1 > /sys/devices/system/cpu/cpu2/online
	        echo 1 > /sys/devices/system/cpu/cpu3/online
		;;
            "239" | "241" | "263")


		# Change PM debug parameters permission
                chown -h radio.system /sys/module/qpnp_power_on/parameters/reset_enabled
                chown -h radio.system /sys/module/qpnp_power_on/parameters/wake_enabled
                chown -h radio.system /sys/module/qpnp_int/parameters/debug_mask
                chown -h radio.system /sys/module/lpm_levels/parameters/secdebug
                chown -h radio.system /sys/class/kgsl/kgsl-3d0/default_pwrlevel
                chown -h radio.system /sys/class/kgsl/kgsl-3d0/idle_timer
                chmod -h 664 /sys/module/qpnp_power_on/parameters/reset_enabled
                chmod -h 664 /sys/module/qpnp_power_on/parameters/wake_enabled
                chmod -h 664 /sys/module/qpnp_int/parameters/debug_mask
                chmod -h 664 /sys/module/lpm_levels/parameters/secdebug
                chmod -h 444 /sys/kernel/wakeup_reasons/last_resume_reason
                chmod -h 664 /sys/class/kgsl/kgsl-3d0/default_pwrlevel
                chmod -h 664 /sys/class/kgsl/kgsl-3d0/idle_timer

		echo Y > /sys/module/lpm_levels/system/performance/cpu0/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu1/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu2/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu3/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu4/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu5/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu6/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu7/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu0/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu1/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu2/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu3/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu4/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu5/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu6/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu7/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu0/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu1/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu2/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu3/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu4/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu5/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu6/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu7/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu0/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu1/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu2/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/performance/cpu3/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu4/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu5/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu6/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/power/cpu7/pc/suspend_enabled
		echo 10 > /sys/class/net/rmnet0/queues/rx-0/rps_cpus

		#control daemon for xosd
		factory_mode=`getprop ro.factory.factory_binary`
		if [ "$factory_mode" != "factory" ]; then
			product_name=`getprop ro.product.name`
			case "$product_name" in
				a7*)
					jig_mode=`cat /sys/class/sec/switch/attached_dev`
					case "$jig_mode" in
						"JIG UART ON" | "JIG UART OFF" | "JIG UART OFF/VB")
							echo "PM: JIG UART" > /dev/kmsg
						;;
						*)
							echo "PM: stop at_distributor" > /dev/kmsg
							stop at_distributor
						;;
					esac
				;;
			esac
		fi

		;;
	"233" | "240" | "242")
	        echo Y > /sys/module/lpm_levels/system/cpu0/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/wfi/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/wfi/idle_enabled
	        echo Y > /sys/module/lpm_levels/system/cpu0/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/standalone_pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu0/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/cpu0/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/cpu1/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/cpu2/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/cpu3/pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-active-l2-gdhs/idle_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-retention-l2-pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-pc-l2-pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-pc-l2-pc/suspend_enabled
		echo 1 > /sys/devices/system/cpu/cpu1/online
	        echo 1 > /sys/devices/system/cpu/cpu2/online
	        echo 1 > /sys/devices/system/cpu/cpu3/online
		;;
	esac
    ;;
esac

case "$target" in
    "msm8226")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
        echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
        echo 787200 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
        echo 300000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
        echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
    ;;
esac

case "$target" in
    "msm8610")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 2 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
        echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
        echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
        echo 787200 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
        echo 300000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
        echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        setprop ro.qualcomm.perf.min_freq 7
        echo 1 > /sys/kernel/mm/ksm/deferred_timer
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
    ;;
esac

# sys_sw.sa: keep big core governor as performance until lockscreen (5 sec more)
chipname=`getprop ro.chipname`
case "$chipname" in
    "MSM8939")
        echo "init.qcom.post_boot.sh 5 sec sleep" > /dev/kmsg
        sleep 5
    ;;
esac

case "$target" in
    "msm8916")

        if [ -f /sys/devices/soc0/soc_id ]; then
           soc_id=`cat /sys/devices/soc0/soc_id`
        else
           soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi

        # Apply governor settings for 8916
        case "$soc_id" in
            "206" | "247" | "248" | "249" | "250")
            	 #echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/timer_rate
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/target_loads
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
		 chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
		 chown -h system.system /sys/class/devfreq/qcom,cpubw.32/min_freq
		 chown -h system.system /sys/class/devfreq/qcom,cpubw.32/max_freq
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/target_loads
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
		 chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
		 chmod -h 0660 /sys/class/devfreq/qcom,cpubw.32/min_freq
		 chmod -h 0660 /sys/class/devfreq/qcom,cpubw.32/max_freq

                echo "25000 1094400:50000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                echo 25000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                echo 998400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                echo 0 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                echo "1 800000:85 998400:90 1094400:80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                echo 50000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                echo 50000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                #echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

	        chown -h root.system /sys/devices/system/cpu/cpu1/online
                chown -h root.system /sys/devices/system/cpu/cpu2/online
                chown -h root.system /sys/devices/system/cpu/cpu3/online
                chmod -h 664 /sys/devices/system/cpu/cpu1/online
                chmod -h 664 /sys/devices/system/cpu/cpu2/online
                chmod -h 664 /sys/devices/system/cpu/cpu3/online

		product_name=`getprop ro.product.name`
		case "$product_name" in
			a3*)
			# Change GPU Idle timer change
			echo 40 >  /sys/class/kgsl/kgsl-3d0/idle_timer
			echo 99 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
			echo 800000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
			echo "85 800000:90 1094400:95" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
			;;
			serranove*)
			# Change GPU Idle timer change
			echo 40 >  /sys/class/kgsl/kgsl-3d0/idle_timer
			echo 99 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
			echo 800000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
			echo "85 800000:90 1094400:95" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
			;;
			e5*)
			# Change GPU Idle timer change
			echo 40 >  /sys/class/kgsl/kgsl-3d0/idle_timer
			echo "85 998400:90 1094400:80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
			;;
			e7*)
			# Change GPU Idle timer change
			echo 40 >  /sys/class/kgsl/kgsl-3d0/idle_timer
			echo "85 998400:90 1094400:80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
			;;
		esac
            ;;
        esac

	# Apply governor settings for 8936
        case "$soc_id" in
	    "233" | "240" | "242")
                echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                echo "25000 1113600:50000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                echo 25000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                echo 960000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                echo 0 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                echo "1 800000:85 1113600:90 1267200:80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                echo 50000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                echo 50000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
            ;;
        esac

        # Apply governor settings for 8939
        case "$soc_id" in
            "239" | "241" | "263")
		# disable thermal core_control for updating interactive gov settings
		echo 0 > /sys/module/msm_thermal/core_control/enabled

		# enable governor for perf cluster
		echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		# enable governor for power cluster
		echo 1 >/sys/devices/system/cpu/cpu4/online
		echo "interactive" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

		# Apply HMP Task packing for 8939
		echo 30 > /proc/sys/kernel/sched_small_task
		echo 50 > /proc/sys/kernel/sched_mostly_idle_load
		echo 3 > /proc/sys/kernel/sched_mostly_idle_nr_run

		if [ "$soc_id" == "0" ]; then
			for devfreq_gov in /sys/class/devfreq/qcom,cpubw*/governor
			do
				echo "bw_hwmon" > $devfreq_gov
				for cpu_bimc_io_percent in /sys/class/devfreq/qcom,cpubw*/bw_hwmon/io_percent
				do
					echo 25 > $cpu_bimc_io_percent
				done
			done
			for poll in /sys/class/devfreq/qcom,cpubw*/polling_interval
			do
				echo 20 > $poll
			done
		else
			# Bus-DCVS settings
			echo "bw_hwmon" > /sys/class/devfreq/0.qcom,cpubw/governor
			echo 16 > /sys/class/devfreq/0.qcom,cpubw/bw_hwmon/io_percent
			echo 20 > /sys/class/devfreq/0.qcom,cpubw/polling_interval

			chown -h system.system /sys/class/devfreq/0.qcom,cpubw/governor
			chown -h system.system /sys/class/devfreq/0.qcom,cpubw/bw_hwmon/io_percent
			chown -h system.system /sys/class/devfreq/0.qcom,cpubw/polling_interval
			chown -h system.system /sys/class/devfreq/0.qcom,cpubw/max_freq
			chown -h system.system /sys/class/devfreq/0.qcom,cpubw/min_freq
			chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/governor
			chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/bw_hwmon/io_percent
			chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/polling_interval
			chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/max_freq
			chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/min_freq
		fi

		for devfreq_gov in /sys/class/devfreq/qcom,mincpubw*/governor
		do
			echo "powersave" > $devfreq_gov
			for timeout in	/sys/class/devfreq/qcom,mincpubw*/cpufreq/timeout
			do
				echo 20 > $timeout
			done
		done

		for gpu_bimc_io_percent in /sys/class/devfreq/qcom,gpubw*/bw_hwmon/io_percent
		do
			 echo 40 > $gpu_bimc_io_percent
		done

		# Set governor parameters for perf cluster
		if [ -d /sys/devices/system/cpu/cpu0/cpufreq/interactive ]; then
			echo "PM: interactive governor for perf cluster" > /dev/kmsg
		else
			echo "PM: interactive governor set delay" > /dev/kmsg
			echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
			sleep 1
		fi
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/lpm_disable_freq
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
		chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/lpm_disable_freq
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
		chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
		
		echo "25000 1100000:50000 1300000:25000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
		echo 99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
		echo 25000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
		echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
		echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/lpm_disable_freq
		echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
		echo "63 500000:85 850000:80 1000000:95" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
		echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
		echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
		echo 499200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
		echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
		echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load

		# Set governor parameters for power cluster
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/lpm_disable_freq
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
		chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/lpm_disable_freq
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
		chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
		
		echo "25000 800000:50000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
		echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
		echo 25000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
		echo 800000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
		echo 800000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/lpm_disable_freq
		echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
		echo "85 800000:90" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
		echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
		echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
		echo 533333 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
		echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
		echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load

		echo 400000 > /proc/sys/kernel/sched_freq_inc_notify
		echo 400000 > /proc/sys/kernel/sched_freq_dec_notify

		# enable thermal core_control now
		echo 1 > /sys/module/msm_thermal/core_control/enabled

		echo 1 > /sys/devices/system/cpu/cpu1/online
		echo 1 > /sys/devices/system/cpu/cpu2/online
		echo 1 > /sys/devices/system/cpu/cpu3/online
		echo 1 > /sys/devices/system/cpu/cpu4/online
		echo 1 > /sys/devices/system/cpu/cpu5/online
		echo 1 > /sys/devices/system/cpu/cpu6/online
		echo 1 > /sys/devices/system/cpu/cpu7/online
		chown -h root.system /sys/devices/system/cpu/cpu0/online
		chown -h root.system /sys/devices/system/cpu/cpu1/online
		chown -h root.system /sys/devices/system/cpu/cpu2/online
		chown -h root.system /sys/devices/system/cpu/cpu3/online
		chown -h root.system /sys/devices/system/cpu/cpu4/online
		chown -h root.system /sys/devices/system/cpu/cpu5/online
		chown -h root.system /sys/devices/system/cpu/cpu6/online
		chown -h root.system /sys/devices/system/cpu/cpu7/online
		chmod -h 664 /sys/devices/system/cpu/cpu0/online
		chmod -h 664 /sys/devices/system/cpu/cpu1/online
		chmod -h 664 /sys/devices/system/cpu/cpu2/online
		chmod -h 664 /sys/devices/system/cpu/cpu3/online
		chmod -h 664 /sys/devices/system/cpu/cpu4/online
		chmod -h 664 /sys/devices/system/cpu/cpu5/online
		chmod -h 664 /sys/devices/system/cpu/cpu6/online
		chmod -h 664 /sys/devices/system/cpu/cpu7/online
		echo Y > /sys/module/lpm_levels/system/power/power-l2-active/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/power-l2-pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/performance-l2-active/idle_enabled
		echo Y > /sys/module/lpm_levels/system/performance/performance-l2-pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/power/power-l2-pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/performance/performance-l2-pc/suspend_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-active/idle_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-retention/idle_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-pc/idle_enabled
		echo Y > /sys/module/lpm_levels/system/system-cci-pc/suspend_enabled
		echo 2 > /proc/sys/kernel/sched_window_stats_policy
		echo 90 > /proc/sys/kernel/sched_upmigrate
		echo 70 > /proc/sys/kernel/sched_downmigrate
		echo 30 > /proc/sys/kernel/sched_init_task_load
		echo 5 > /proc/sys/kernel/sched_ravg_hist_size
		echo 10 > /proc/sys/kernel/sched_upmigrate_min_nice
		echo 1 > /proc/sys/kernel/sched_boot_complete
		echo 30 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu4/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu5/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu6/sched_mostly_idle_load
		echo 30 > /sys/devices/system/cpu/cpu7/sched_mostly_idle_load
		echo 960000 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_freq
		echo 960000 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_freq
		echo 960000 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_freq
		echo 960000 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_freq
		rm /data/system/default_values
            ;;
        esac
    ;;
esac


case "$target" in
    "apq8084")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/retention/idle_enabled
        echo 0 > /sys/module/msm_thermal/core_control/enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        for devfreq_gov in /sys/class/devfreq/qcom,cpubw*/governor
        do
            echo "cpubw_hwmon" > $devfreq_gov
        done
        echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
        echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
        echo "20000 1400000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
        echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
        echo 1497600 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
        echo "85 1500000:90 1800000:70" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
        echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
        echo 20 > /sys/module/cpu_boost/parameters/boost_ms
        echo 1728000 > /sys/module/cpu_boost/parameters/sync_threshold
        echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
        echo 1497600 > /sys/module/cpu_boost/parameters/input_boost_freq
        echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
        echo 1 > /dev/cpuctl/apps/cpu.notify_on_migrate
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        echo 1 > /sys/module/msm_thermal/core_control/enabled
        setprop ro.qualcomm.perf.cores_online 2
        chown -h  system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/mfreq
        chmod -h 220 /sys/devices/system/cpu/mfreq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
    ;;
esac

case "$target" in
    "mpq8092")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/retention/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/retention/idle_enabled
        echo 0 > /sys/module/msm_thermal/core_control/enabled
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
        echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
        echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
        echo 1 > /sys/module/msm_thermal/core_control/enabled
        chown -h  system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown -h system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown -h root.system /sys/devices/system/cpu/mfreq
        chmod -h 220 /sys/devices/system/cpu/mfreq
        chown -h root.system /sys/devices/system/cpu/cpu1/online
        chown -h root.system /sys/devices/system/cpu/cpu2/online
        chown -h root.system /sys/devices/system/cpu/cpu3/online
        chmod -h 664 /sys/devices/system/cpu/cpu1/online
        chmod -h 664 /sys/devices/system/cpu/cpu2/online
        chmod -h 664 /sys/devices/system/cpu/cpu3/online
	;;
esac

case "$target" in
    "msm7627_ffa" | "msm7627_surf" | "msm7627_6x")
        echo 25000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8250_surf" | "qsd8250_ffa" | "qsd8650a_st1x")
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8650a_st1x")
        mount -t debugfs none /sys/kernel/debug
    ;;
esac

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

case "$target" in
    "msm8960" | "msm8660" | "msm7630_surf")
        echo 10 > /sys/devices/platform/msm_sdcc.3/idle_timeout
        ;;
    "msm7627a")
        echo 10 > /sys/devices/platform/msm_sdcc.1/idle_timeout
        ;;
esac

# Post-setup services
case "$target" in
    "msm8660" | "msm8960" | "msm8226" | "msm8610" | "mpq8092" )
        start mpdecision
    ;;
    "msm8916")
	if [ -f /sys/devices/soc0/soc_id ]; then
           soc_id=`cat /sys/devices/soc0/soc_id`
        else
           soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
	case "$soc_id" in
             "239" | "241" | "263")
            setprop ro.min_freq_0 499200
            setprop ro.min_freq_4 533333
            start perfd
	;;
	#for 8916
	     "206" | "247" | "248" | "249" | "250")
            setprop ro.min_freq_0 800000
            # sys_sw.sa: postpone starting of mpdecision to prevent core-off problems. (w/a)
            sleep 5
            echo "init.qcom.post_boot.sh: start mpdecision after 5 sec sleep" > /dev/kmsg
            start mpdecision
	;;
	#for 8936
             "233" | "240" | "242")
             setprop ro.min_freq_0 800000
             start mpdecision
	;;
	esac
    ;;
    "msm8974")
        start mpdecision
        echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
    ;;
    "apq8084")
        rm /data/system/default_values
        start mpdecision
        echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
        echo 512 > /sys/block/sda/bdi/read_ahead_kb
        echo 512 > /sys/block/sdb/bdi/read_ahead_kb
        echo 512 > /sys/block/sdc/bdi/read_ahead_kb
        echo 512 > /sys/block/sdd/bdi/read_ahead_kb
        echo 512 > /sys/block/sde/bdi/read_ahead_kb
        echo 512 > /sys/block/sdf/bdi/read_ahead_kb
        echo 512 > /sys/block/sdg/bdi/read_ahead_kb
        echo 512 > /sys/block/sdh/bdi/read_ahead_kb
    ;;
    "msm7627a")
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "127" | "128" | "129")
                start mpdecision
        ;;
        esac
    ;;
esac

# Enable Power modes and set the CPU Freq Sampling rates
case "$target" in
     "msm7627a")
        start qosmgrd
    echo 1 > /sys/module/pm2/modes/cpu0/standalone_power_collapse/idle_enabled
    echo 1 > /sys/module/pm2/modes/cpu1/standalone_power_collapse/idle_enabled
    echo 1 > /sys/module/pm2/modes/cpu0/standalone_power_collapse/suspend_enabled
    echo 1 > /sys/module/pm2/modes/cpu1/standalone_power_collapse/suspend_enabled
    #SuspendPC:
    echo 1 > /sys/module/pm2/modes/cpu0/power_collapse/suspend_enabled
    #IdlePC:
    echo 1 > /sys/module/pm2/modes/cpu0/power_collapse/idle_enabled
    echo 25000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
    ;;
esac

# Change adj level and min_free_kbytes setting for lowmemory killer to kick in
case "$target" in
     "msm7627a")
    echo 0,1,2,4,9,12 > /sys/module/lowmemorykiller/parameters/adj
    echo 5120 > /proc/sys/vm/min_free_kbytes
     ;;
esac

# Install SWE_Browser.apk if not already installed
if [ -f /data/prebuilt/SWE_AndroidBrowser.apk ]; then
    if [ ! -d /data/data/com.android.swe.browser ]; then
        pm install /data/prebuilt/SWE_AndroidBrowser.apk
    fi
fi

# Change adj level and min_free_kbytes setting for lowmemory killer to kick in
case "$target" in
     "msm8660")
        start qosmgrd
        echo 0,1,2,4,9,12 > /sys/module/lowmemorykiller/parameters/adj
        echo 5120 > /proc/sys/vm/min_free_kbytes
     ;;
esac

case "$target" in
    "msm8226" | "msm8974" | "msm8610" | "apq8084" | "mpq8092" | "msm8610" | "msm8916")
        # Let kernel know our image version/variant/crm_version
        image_version="10:"
        image_version+=`getprop ro.build.id`
        image_version+=":"
        image_version+=`getprop ro.build.version.incremental`
        image_variant=`getprop ro.product.name`
        image_variant+="-"
        image_variant+=`getprop ro.build.type`
        oem_version=`getprop ro.build.version.codename`
        echo 10 > /sys/devices/soc0/select_image
        echo $image_version > /sys/devices/soc0/image_version
        echo $image_variant > /sys/devices/soc0/image_variant
        echo $oem_version > /sys/devices/soc0/image_crm_version
        ;;
esac


# Start RIDL/LogKit II client
/data/SelfHost/startRIDL.sh &