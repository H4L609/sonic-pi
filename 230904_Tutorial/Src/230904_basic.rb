# 230904 - H4L609

live_loop :Basic do
  with_fx :reverb, mix: 0.5, damp: 0.1 do
    # sample :guit_em9, rate: -0.3, amp: 0.4
  end
  sample :sn_generic,  rate: 4
  sample :bd_haus, rate: 1
  
  sleep 0.5
  
  sample :sn_generic,  rate: 7
  sleep 0.5
  
  sample :bd_haus,  rate: 1
  sample :sn_generic,  rate: 4
  sleep 0.5
  sample :bd_ada,  rate: 1
  sleep 0.5
  sample :bd_haus,  rate: 1
  sleep 0.5
  sample :bd_ada,  rate: 0.7
  sleep 0.5
  sample :bd_haus, rate:1
  sleep 0.5
  sample :bd_ada,  rate: 1
  sleep 0.5
end

live_loop :boom do
  sleep 0.5
  with_fx :krush, gain: 0.5, mix: 0.7 do
    sample :hat_metal, rate: 1.5
  end
  sleep 1.0
  with_fx :krush, gain: 0.5, mix: 0.7 do
    sample :hat_star, rate: 2.5
  end
  sleep 0.5
end