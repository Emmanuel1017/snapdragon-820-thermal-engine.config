#!/system/bin/sh

#VM tweaks
# minfree tweaks
chmod 666 /sys/module/lowmemorykiller/parameters/minfree;
echo 24320,29440,38912,47104,56528,78240 > /sys/module/lowmemorykiller/parameters/minfree;
# swap adjustments
echo 0 > /proc/sys/vm/swappiness;
chmod 777 /sys/module/zswap/parameters/enabled;
echo N > /sys/module/zswap/parameters/enabled;
echo 0 > /sys/module/zswap/parameters/low_pool_percent;
echo 0 > /sys/module/zswap/parameters/high_pool_percent;
echo 0 > /sys/module/zswap/parameters/max_pool_percent;
echo 0 > /sys/module/zswap/parameters/compaction_interval;
echo 0 > /sys/module/zswap/parameters/compaction_pages;
# reclaim ram almost twice than before (for running apps)
echo 140 > /proc/sys/vm/vfs_cache_pressure;
# allow dirty data to stay on ram
echo 15 > /proc/sys/vm/dirty_ratio;
echo 4 > /proc/sys/vm/dirty_background_ratio;
echo 300 > /proc/sys/vm/dirty_expire_centisecs;
echo 700 > /proc/sys/vm/dirty_writeback_centisecs;
# aspire to keep some free memory for swap decompression and app opening
echo 33000 > /proc/sys/vm/extra_free_kbytes;
echo 2560 > /proc/sys/vm/min_free_kbytes;

# gpu governor
# increase min freq to reduce scroll lag
echo 640000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq;
echo 214000000 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq;

#scheduler
# internal storage scheduler tweaks
chmod 777 /sys/block/sda/queue/read_ahead_kb;
echo 2048 > /sys/block/sda/queue/read_ahead_kb;
chmod 444 /sys/block/sda/queue/read_ahead_kb;
echo 0 > /sys/block/sda/queue/iostats;
chmod 444 /sys/block/sda/queue/iostats;
echo 2 > /sys/block/sda/queue/rq_affinity;
chmod 444 /sys/block/sda/queue/rq_affinity;
echo 1024 > /sys/block/sda/queue/nr_requests;
echo noop > /sys/block/sda/queue/scheduler;
# sdcard read scheduler tweaks
chmod 777 /sys/block/mmcblk0/queue/read_ahead_kb;
echo 2048 > /sys/block/mmcblk0/queue/read_ahead_kb;
chmod 444 /sys/block/mmcblk0/queue/read_ahead_kb;
echo 0 > /sys/block/mmcblk0/queue/iostats;
chmod 444 /sys/block/mmcblk0/queue/iostats;
echo 2 > /sys/block/mmcblk0/queue/rq_affinity;
chmod 444 /sys/block/mmcblk0/queue/rq_affinity;
echo 1024 > /sys/block/mmcblk0/queue/nr_requests;
echo noop > /sys/block/mmcblk0/queue/scheduler;
chmod 444 /sys/block/mmcblk0/queue/scheduler;

#logs and stuff
# disable some logs
echo 0 > /sys/module/debug/parameters/enable_event_log;
echo 0 > /sys/module/smem_log/parameters/log_enable;
# disable some things
echo 1000 > /proc/sys/vm/stat_interval;
echo -1 > /proc/sys/kernel/sched_rt_runtime_us;
echo 0 > /proc/sys/kernel/watchdog;

# rngd entropy pool tunables (changing write_wakeup_threshold to 4096 will keep your entropy pool full always)
echo 512 > /proc/sys/kernel/random/read_wakeup_threshold;
echo 3200 > /proc/sys/kernel/random/write_wakeup_threshold;
# since we are linking random to urandom there is no need to change read and write thresolds
# link urandom to random
cd /dev
mv random random.bak
ln -s urandom random

# decrease scroll lag
setprop persist.sys.scrollingcache 4

#Log
echo "More solutions script is working!" > /data/94More_Solutions.log;
echo "Last time applied on "`date`"" >> /data/94More_Solutions.log;
