live_loop :live do
  use_bpm 120
  use_synth :tb303
  use_tuning :meantone
  
  with_fx :compressor, mix: 0.9, pre_amp: 1.3, amp: 0.4 do
    #with_fx :distortion, mix: 0.9, distort: 0.7, pre_amp: 1.3 do
    play rrand(60,65), amp: 0.6, cutoff: rrand(10,100), res: rrand(0.7,0.99)
    play rrand(60,70), amp: 0.6, cutoff: rrand(10,100), res: rrand(0.7,0.99)
    play rrand(60,75), amp: 0.6, cutoff: rrand(10,100), res: rrand(0.7,0.99)
    
    sleep rrand(0.2, 0.7)
    #end
  end
end