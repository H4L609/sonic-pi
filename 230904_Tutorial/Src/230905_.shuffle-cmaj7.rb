live_loop :live do
  use_bpm 120
  use_synth choose([:winwood_lead, :prophet])
  
  ## Shared Parameters
  cMaj7 = chord(:C4, :M7)
  cMaj7+= chord(:C5, :M7)
  
  ## Instrument Parameters
  kickAmp = rrand(0.3, 0.6)
  
  with_fx :panslicer, mix: 0.4, phase: 0.2 do
    play cMaj7.shuffle.take(3)
  end
  
  
  if one_in(3)
    sample :bd_boom, rate: 1, amp: kickAmp
  else
    sample :hat_yosh, rate: 1, cutoff: rrand(40,120), res: rrand(0.6,0.8)
  end
  sleep 0.6
  
  
end
