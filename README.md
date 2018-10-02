# snapdragon-820-thermal-engine.config
Unlock your snapdragon 820 samsung s7 or any supported device with the soc thermal engine for zero annoying throttling brought about by the thermal engine config
The config file can be locate under the directory /system/vendor/etc/thermal-engine.config 
Replace the thermal engine with the one provided here and you will experience no thermal throttling
also in the folder /system/su.d/ add the following scripts.su for disabling core control vdd restriction and increase thermal throttle temps to 120 degrees
The scripts also include entropy changes and some cpu tweaks for a faster device.
It also disables core 2 and 3 during boot for lowest temps during boot after u may use kernel auditor to activete them after boot.
The end result is a faster no lag device.
I recommend lowering the core 2 and 3 temps cause they can get really hot during use to about 1.5GHz.
The script also sets the max GPU(Adreno 530 ) power to the max possible powwer zero thus max frequency in intense gaming.You maty also use kernel auditor to set it to the max to your liking at slighty battery cost.
Lets have a lagless fast samsung s7 Qualcomm device to those with lag iisues after rooting their devices.
