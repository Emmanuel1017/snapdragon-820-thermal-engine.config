#!/system/bin/sh

# Set CPU Min for Power SubSystem
chmod 777 /sys/power/cpufreq_min_limit;
echo -1 > /sys/power/cpufreq_min_limit;
chmod 444 /sys/power/cpufreq_min_limit;

# Set CPU Max for Power SubSystem
chmod 777 /sys/power/cpufreq_max_limit;
echo -1 > /sys/power/cpufreq_max_limit;
chmod 444 /sys/power/cpufreq_max_limit;

# Set cpu and gpu speeds for boot?
chmod 777 /sys/module/msm_power/parameters/cpu_freq_threshold;
echo 2150400 > /sys/module/msm_power/parameters/cpu_freq_threshold;
chmod 444 /sys/module/msm_power/parameters/cpu_freq_threshold;

chmod 777 /sys/module/msm_power/parameters/gpu_freq_threshold;
echo 624000 > /sys/module/msm_power/parameters/gpu_freq_threshold;
chmod 444 /sys/module/msm_power/parameters/gpu_freq_threshold;

#gpu power
chmod 777 /sys/class/kgsl/kgsl-3d0/max_pwrlevel;
echo 0 > /sys/class/kgsl/kgsl-3d0/max_pwrlevel;
chmod 444 /sys/class/kgsl/kgsl-3d0/max_pwrlevel;
chmod 777 /sys/class/kgsl/kgsl-3d0/min_pwrlevel;
echo 6 > /sys/class/kgsl/kgsl-3d0/min_pwrlevel;
chmod 444 /sys/class/kgsl/kgsl-3d0/min_pwrlevel;


# Set throttling temp
chmod 777 /sys/module/msm_core/parameters/throttling_temp;
echo "110" > /sys/module/msm_core/parameters/throttling_temp;
chmod 444 /sys/module/msm_core/parameters/throttling_temp;

# Set throttling state
echo N > /sys/module/msm_thermal/parameters/enabled;
chmod 444 /sys/module/msm_thermal/parameters/enabled;

# Set core control state
chmod 777 /sys/module/msm_thermal/core_control/enabled
echo 0 > /sys/module/msm_thermal/core_control/enabled;
chmod 444 /sys/module/msm_thermal/core_control/enabled;
chmod 777 /sys/module/msm_core/parameters/disabled;
echo 1 > /sys/module/msm_core/parameters/disabled;
chmod 444 /sys/module/msm_core/parameters/disabled;

#Log
echo "Thermal solution script is working!" > /data/90Thermal_solution.log;
echo "Last time applied on "`date`"" >> /data/90Thermal_solution.log;
