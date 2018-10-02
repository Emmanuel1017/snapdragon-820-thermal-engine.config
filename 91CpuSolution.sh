#!/system/bin/sh

# Partially eliminate input-boost
# set all cpus input boost freq to 0
chmod 777 /sys/module/cpu_boost/parameters/input_boost_freq;
echo 0:0 1:0 2:0 3:0 > /sys/module/cpu_boost/parameters/input_boost_freq;
chmod 444 /sys/module/cpu_boost/parameters/input_boost_freq;
# set input boost action time to 0
chmod 777 /sys/module/cpu_boost/parameters/input_boost_ms;
echo 0 > /sys/module/cpu_boost/parameters/input_boost_ms;
chmod 444 /sys/module/cpu_boost/parameters/input_boost_ms;
# deactivate scheduler boost
chmod 777 /sys/module/cpu_boost/parameters/sched_boost_on_input;
echo 0 > /sys/module/cpu_boost/parameters/sched_boost_on_input;
chmod 444 /sys/module/cpu_boost/parameters/sched_boost_on_input;

# power efficient mode cpu workqueues
chmod 777 /sys/module/workqueue/parameters/power_efficient;
echo N > /sys/module/workqueue/parameters/power_efficient;

# Big Cpu tunables
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/align_windows;
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/io_is_busy;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/io_is_busy;
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_sched_load;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_sched_load;
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_migration_notif;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_migration_notif;
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/ignore_hispeed_on_notif;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/ignore_hispeed_on_notif;
chmod 777 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads;
echo 90 307200:70 480000:78 652800:81 806400:82 1036800:86 1248000:94 1401600:97 1478400:5 1555200:5 1632000:99 1708800:4 1785600:2 1824000:100 1920000:4 1996800:97 2073600:4 2150400:98 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads;
echo 100 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/go_hispeed_load;
echo 1248000 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/hispeed_freq;
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/max_freq_hysteresis;
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/fast_ramp_down;

# Little Cpu tunables
echo 78 307200:65 480000:72 652800:78 960000:79 1036800:7 1113600:7 1190400:3 1228800:80 1324800:6 1401600:80 1478400:8 1593600:80 > sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads;
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows;
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy;
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy;
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load;
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load;
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif;
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif;
chmod 777 /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif;
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif;
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif;
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis;
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down;
echo 80 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load;
echo 480000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq;

# App scheduler tunables
# move process to big cluster load. stock is 80
echo 85 > /proc/sys/kernel/sched_upmigrate;
# move process to little cluster load. stock is 60
echo 75 > /proc/sys/kernel/sched_downmigrate;
# initial load for unknown processes (basically where to allocate new processes). stock is 15
echo 100 > /proc/sys/kernel/sched_init_task_load;
# max % of use of little cluster before next processes are started in big cluster. stock is 100
echo 100 > /proc/sys/kernel/sched_spill_load;
# max little cluster processes before next processes are started in big cluster. stock is 10
echo 11 > /proc/sys/kernel/sched_spill_nr_run;
# allow to wake and set new process at idle cpu if avaliable
echo 1 > /proc/sys/kernel/sched_wake_to_idle;
# method to calculate known process initial load (0-last 1-max of hist 2-max of prom of hist vs last 3-prom of hist). stock is 2
echo 1 > /proc/sys/kernel/sched_window_stats_policy;
# number of records/history of known process inital load. stock is 5 
echo 0 > /proc/sys/kernel/sched_ravg_hist_size;

#Log
echo "Cpu solution script is working!" > /data/91Cpu_solution.log;
echo "Last time applied on "`date`"" >> /data/91Cpu_solution.log;
