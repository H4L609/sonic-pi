use_bpm 140

live_loop :drums do
  sample :bd_haus, amp: 0.2
  sleep 0.5
  if one_in(6)
    4.times do
      sample :drum_cymbal_closed, cutoff: 115, amp: 0.6
      sleep 0.125
    end
  else
    2.times do
      sample :drum_cymbal_closed, cutoff: 115, amp: 0.6
      sleep 0.25
    end
  end
end

groove=rrand(0.0, 0.05)
live_loop :accent do
  r=1.059463094**rrand(1,12)
  if one_in(3)
    16.times do
      sample :elec_blip, rate: 1.0*r+rrand(0,2) , amp: 0.7, release: 0.2
      
      sleep 0.25
    end
    ##| sleep 2
  elsif one_in(3)
    16.times do
      sample :elec_blip, rate: 2.0*r+rrand(0,2), amp: 0.7, release: 0.2
      
      sleep 0.25
    end
    ##| sleep 2
  elsif one_in(1.5)
    16.times do
      sample :elec_blip, rate: 0.75*r+rrand(0,2) , amp: 0.7, release: 0.2
      sleep 0.25
    end
  else
    sleep 4
  end
end