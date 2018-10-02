#offline core 3 and 4 by me yeah emnanuel
chmod 777 /sys/devices/system/cpu/cpu3/online;
echo 0 > /sys/devices/system/cpu/cpu3/online;
chmod 444 /sys/devices/system/cpu/cpu3/online;
chmod 777 /sys/devices/system/cpu/cpu2/online;
echo 0 > /sys/devices/system/cpu/cpu2/online;
chmod 444 /sys/devices/system/cpu/cpu2/online;
chmod 777 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
chmod 777 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq;
echo 1036800 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq;
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 777 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
chmod 777 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq;
echo 1036800 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq;
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq;



#Log
echo "cpus are offlined and this is working!" > /data/offlinecpus.log;
echo "Last time applied on "`date`"" >> /data/offlinecpus.log;
