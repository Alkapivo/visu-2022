rm out*
rm timeline.json
node merge-timelines.js base.json aiobahn_resonance_bkg_00-00_05-42.json out0.json
node merge-timelines.js out0.json aiobahn_resonance_grid_00-00_05-42.json out1.json
node merge-timelines.js out1.json aiobahn_resonance_shader_00-00_00-18.json out_shader_1.json
node merge-timelines.js out_shader_1.json aiobahn_resonance_shader_00-18_01-35.json out_shader_2.json
node merge-timelines.js out_shader_2.json aiobahn_resonance_shader_01-35_02-20.json out_shader_3.json
node merge-timelines.js out_shader_3.json aiobahn_resonance_shader_02-20_03-08.json out_shader_4.json
node merge-timelines.js out_shader_4.json aiobahn_resonance_shader_03-08_04-08.json out_shader_5.json
node merge-timelines.js out_shader_5.json aiobahn_resonance_shader_04-08_05-05.json out_shader_6.json
node merge-timelines.js out_shader_6.json aiobahn_resonance_shader_05-05_05-42.json out3.json
node merge-timelines.js out3.json aiobahn_resonance_shroom_00-00_00-18.json out4.json
node merge-timelines.js out4.json aiobahn_resonance_shroom_00-18_00-32.json out5.json
node merge-timelines.js out5.json aiobahn_resonance_shroom_00-32_01-02.json out6.json
node merge-timelines.js out6.json aiobahn_resonance_shroom_01-02_01-35.json out7.json
node merge-timelines.js out7.json aiobahn_resonance_shroom_01-35_02-03.json out8.json
node merge-timelines.js out8.json aiobahn_resonance_shroom_02-03_02-38.json out9.json
node merge-timelines.js out9.json aiobahn_resonance_shroom_02-38_03-08.json out10.json
node merge-timelines.js out10.json aiobahn_resonance_shroom_03-08_03-40.json out11.json
node merge-timelines.js out11.json aiobahn_resonance_shroom_03-40_04-08.json out12.json
node merge-timelines.js out12.json aiobahn_resonance_shroom_04-08_04-46.json out13.json
node merge-timelines.js out13.json aiobahn_resonance_shroom_05-05_05-42.json timeline.json
rm out*
echo "visu track - build successfully"