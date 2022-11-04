rm out*
rm timeline.json
node merge-timelines.js base.json aiobahn_resonance_bkg_00-00_05-42.json out0.json
node merge-timelines.js out0.json aiobahn_resonance_grid_00-00_01-30.json out1.json
node merge-timelines.js out1.json aiobahn_resonance_grid_01-30_03-05.json out2.json
node merge-timelines.js out2.json aiobahn_resonance_grid_03-05_05-42.json out3.json
node merge-timelines.js out3.json aiobahn_resonance_shroom_00-00_00-18.json out4.json
node merge-timelines.js out4.json aiobahn_resonance_shroom_00-18_00-32.json out5.json
node merge-timelines.js out5.json aiobahn_resonance_shroom_00-32_01-02.json out6.json
node merge-timelines.js out6.json aiobahn_resonance_shroom_01-02_01-35.json out7.json
node merge-timelines.js out7.json aiobahn_resonance_shroom_01-35_02-03.json out8.json
node merge-timelines.js out8.json aiobahn_resonance_shroom_02-03_02-38.json timeline.json --verbose
rm out*
echo "visu track - build successfully"