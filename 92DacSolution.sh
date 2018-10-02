#!/system/bin/sh

# Hi-Performance DAC
chmod 777 /sys/module/snd_soc_wcd9xxx/parameters/impedance_detect_en;
echo 1 > /sys/module/snd_soc_wcd9xxx/parameters/impedance_detect_en;
chmod 444 /sys/module/snd_soc_wcd9xxx/parameters/impedance_detect_en;
chmod 777 /sys/module/snd_soc_wcd9330/parameters/high_perf_mode;
echo 1 > /sys/module/snd_soc_wcd9330/parameters/high_perf_mode;
chmod 444 /sys/module/snd_soc_wcd9330/parameters/high_perf_mode;
chmod 777 /sys/module/snd_soc_wcd9335/parameters/sido_buck_svs_voltage;
echo 955 > /sys/module/snd_soc_wcd9335/parameters/sido_buck_svs_voltage;
chmod 444 /sys/module/snd_soc_wcd9335/parameters/sido_buck_svs_voltage;
chmod 777 /sys/devices/soc/70000.qcom,msm-thermal/of_node/qcom,freq-mitigation-temp;
echo 120 > /sys/devices/soc/70000.qcom,msm-thermal/of_node/qcom,freq-mitigation-temp;
chmod 444 /sys/devices/soc/70000.qcom,msm-thermal/of_node/qcom,freq-mitigation-temp;
chmod /sys/devices/soc/70000.qcom,msm-thermal/of_node/qcom,limit-temp;
echo 120 > /sys/devices/soc/70000.qcom,msm-thermal/of_node/qcom,limit-temp;
chmod 444 /sys/devices/soc/70000.qcom,msm-thermal/of_node/qcom,limit-temp;

#Log
echo "DAC solution script is working!" > /data/92Dac_solution.log;
echo "Last time applied on "`date`"" >> /data/92Dac_solution.log;
