live_loop :live do
  use_bpm 120
  use_synth choose([:winwood_lead, :mod_sine])
  
  # Parameters
  hat_1_cutoff = rrand(90,120)
  hat_2_cutoff = rrand(70,90)
  
  syn_cutoff = rrand(80, 110)
  syn_res    = rrand(0.6,0.9)
  
  scale_offset = rrand_i(-12, 12)
  
  sample :bd_mehackit, rate: 1.5
  
  if one_in(2)
    rhythm = 2.0
    
  elsif one_in(2)
    rhythm = 4.0
  elsif one_in(4)
    rhythm = 5.0
  elsif one_in(8)
    rhythm = 6.0
  else
    rhythm = 7.0
  end
  
  rhythm.times do
    if one_in(2)
      sample :hat_zan, rate: rrand(1, 1.5)  , cutoff: hat_1_cutoff, res: rrand(0.5,0.7)
    else
      sample :hat_zan, rate: rrand(0.9, 1.3), cutoff: hat_2_cutoff, res: rrand(0.7,0.9)
    end
  end
  if rhythm == 2.0
    with_fx :bitcrusher, mix: 0.9, amp: 0.7, bits: 6, sample_rate: 20000 do
      play_pattern_timed scale(:G4+scale_offset, :mixolydian).shuffle.take(4), 0.33, amp: 0.4, cutoff: syn_cutoff, res: syn_res
    end
    sleep 1.8
  else
    sleep 2.0 / rhythm
  end
end