live_loop :live do
  use_bpm 120
  use_synth choose([:winwood_lead, :mod_sine])
  
  # Parameters
  hat_1_cutoff = rrand(90,120)
  hat_2_cutoff = rrand(70,90)
  
  syn_cutoff = rrand(80, 110)
  syn_res    = rrand(0.6,0.9)
  
  scale_offset = rrand_i(-12, 12)
  kick_rate    = rrand(1.0,1.5)
  
  sample :bd_mehackit, rate: 1.5
  
  sample :bd_boom, rate: kick_rate, amp: 0.5
  sleep 1
  sample :bd_boom, rate: kick_rate-0.3, amp: 0.5
  sleep 1
  
  if one_in(2)
    rhythm = 2.0
    
  elsif one_in(6)
    rhythm = 4.0
  elsif one_in(6)
    rhythm = 5.0
  elsif one_in(6)
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
    if rhythm != 2.0
      sleep 2.0 / rhythm
    end
  end
  if rhythm == 2.0
    with_fx :bitcrusher, mix: 0.9, amp: 0.7, bits: 6, sample_rate: 20000 do
      ##| play_pattern_timed scale(:G4+scale_offset, :mixolydian).shuffle.take(4), 0.33, amp: 0.4, cutoff: syn_cutoff, res: syn_res
    end
    sleep 1.8
  end
end

live_loop :riff do
  use_synth :hoover
  play scale(:F5, :minor_pentatonic).shuffle.take(2), amp: 0.3, release: 0.2
  sleep 0.5 + rrand_i(-3,3)*0.125
end