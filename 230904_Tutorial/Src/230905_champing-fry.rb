live_loop :live do
  use_bpm 120
  use_synth choose([:prophet, :winwood_lead])
  use_tuning :meantone
  
  ## Shared Parameters
  notes = [:D3, :G3, :C4, :D4, :G4] # Major Chords On Gmaj Scale
  
  freq      = choose(notes)
  resonance = rrand(0.6, 0.7)
  cutoff    = rrand(60 ,80.00)
  
  ## Specific Parameter
  flangerDepth = rrand(10, 20)
  invertFrange = choose([0,1])
  
  hatPitch     = rrand(1,2)
  
  with_fx :compressor, mix: 0.9, pre_amp: 1.3, amp: 0.4 do
    with_fx :bitcrusher, mix: 0.7, depth: flangerDepth, invert_wave: invertFrange do
      play freq   , amp: 0.6, cutoff: rrand(40 ,80), res: resonance
      play freq+4 , amp: 0.3, cutoff: rrand(50 ,80), res: resonance
      play freq+7 , amp: 0.3, cutoff: rrand(60 ,80), res: resonance
      play freq+14, amp: 0.4, cutoff: rrand(60 ,80), res: resonance
      
      if one_in(3)
        sample :bd_boom, rate: 1, amp: 0.7
      else
        with_fx :reverb, mix: 0.3, room: 1 do
          
          sample :hat_zan, rate: hatPitch, amp: 0.6, cutoff: cutoff+30, res: 0.6
        end
        
      end
      sleep 0.55
    end
  end
end