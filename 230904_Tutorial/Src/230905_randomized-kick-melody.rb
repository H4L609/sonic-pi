live_loop :live do
  use_bpm 120
  use_synth choose([:winwood_lead, :prophet])
  
  # Parameters
  hat_1_cutoff = rrand(90,120)
  hat_2_cutoff = rrand(70,90)
  
  syn_cutoff = rrand(80, 110)
  syn_res    = rrand(0.6,0.9)
  
  scale_offset = rrand_i(-12, 12)
  
  
  sample :bd_mehackit, rate: 1.5
  
  if one_in(2)
    2.times do
      if one_in(2)
        sample :hat_zan, rate: rrand(1, 1.5), cutoff: hat_1_cutoff, res: rrand(0.5,0.7)
      else
        sample :hat_zan, rate: rrand(0.9, 1.3), cutoff: hat_2_cutoff, res: rrand(0.7,0.9)
      end
    end
    play_pattern_timed scale(:G4+scale_offset, :mixolydian).shuffle.take(4), 0.33, amp: 0.4, cutoff: syn_cutoff, res: syn_res
    sleep 0.5
    
  elsif one_in(2)
    4.times do
      if one_in(2)
        sample :hat_zan, rate: rrand(1, 1.5), cutoff: hat_1_cutoff, res: rrand(0.5,0.7)
      else
        sample :hat_zan, rate: rrand(0.9, 1.3), cutoff: hat_2_cutoff, res: rrand(0.7,0.9)
      end
      sleep 0.5
    end
  elsif one_in(4)
    5.times do
      if one_in(2)
        sample :hat_zan, rate: rrand(1, 1.5), cutoff: hat_1_cutoff, res: rrand(0.5,0.7)
      else
        sample :hat_zan, rate: rrand(0.9, 1.3), cutoff: hat_2_cutoff, res: rrand(0.7,0.9)
      end
      sleep 0.4
    end
  elsif one_in(8)
    6.times do
      if one_in(2)
        sample :hat_zan, rate: rrand(1, 1.5)  , cutoff: hat_1_cutoff, res: rrand(0.5,0.7)
      else
        sample :hat_zan, rate: rrand(0.9, 1.3), cutoff: hat_2_cutoff, res: rrand(0.7,0.9)
      end
      sleep 0.333333
      
    end
  else
    7.times do
      if one_in(2)
        sample :hat_zan, rate: rrand(1, 1.5)  , cutoff: hat_1_cutoff, res: rrand(0.5,0.7)
      else
        sample :hat_zan, rate: rrand(0.9, 1.3), cutoff: hat_2_cutoff, res: rrand(0.7,0.9)
      end
      sleep 0.28571
    end
  end
end