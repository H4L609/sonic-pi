##| use_bpm 140
use_bpm 60

# Hi There!!!!!!!!!!!!!!!!!!

## | Base Settings | ##
root = :C4
note1 = root+7
note2 = root-1

melo = scale(note1, :major_pentatonic)
melo+= [note1+11.53]
##| melo+= [note1+7.03]
##| melo+= [note1+3]


## | Live Parameter | ##

bd_amp  = 0.3 # ミスった――――www
hat_amp = 0.5
sn_amp  = 0.5

hmny_amp   = 0.4
hmny_blend = 0.7 # 0 ~ 1 = harmony1 ~ 2


bitmix = 0.7
mmelo_amp = 0.3


smelo_amp   = 0.4
smelo_wet   = 0.7

## Not Used

##| live_loop :crescendo do

##|   smelo_wet += 0.02
##|   smelo_amp += 0.02

##|   if smelo_wet > 1.0
##|     smelo_wet = 0
##|     if smelo_amp > 1.0
##|       smelo_amp =0
##|     end
##|   end
##|   sleep 0.4
##| end


live_loop :bd do
  sample :bd_haus, rate: 1, amp: bd_amp
  if one_in(2)
    sample :bd_pure, rate: 1*1.059**rrand_i(0,4), amp: bd_amp*2
  end
  sleep 0.5
end

live_loop :drums_upper do
  
  sleep 0.5
  if one_in(6)
    4.times do
      sample :drum_cymbal_closed, cutoff: 115, amp: hat_amp, release: 0.1
      sleep 0.125
    end
  else
    sample :drum_snare_soft, rate: 1.0, amp: sn_amp
    2.times do
      sample :drum_cymbal_closed, cutoff: 115, amp: hat_amp
      sleep 0.25
    end
  end
end

live_loop :harmony_1 do
  with_fx :panslicer, mix: 0.4 do
    use_synth :tri
    play chord(root, :M7)+[root+14],   release: rrand(3,4  ) , amp: (1-hmny_blend)*hmny_amp
    sleep 3.5
    play chord(note1, :M7)+[note1+14], release: rrand(3,4  ) , amp: (1-hmny_blend)*hmny_amp
    sleep 1.5
    play chord(note2, :m7)+[note2+15], release: rrand(3,3.5) , amp: (1-hmny_blend)*hmny_amp
    sleep 3
  end
end

live_loop :harmony_2 do
  with_fx :panslicer, mix: 0.4 do
    use_synth :supersaw
    play chord(root, :M7)+[root+14],   release: rrand(2,2.5), amp: hmny_blend*hmny_amp
    sleep 3.5
    play chord(note1, :M7)+[note1+14], release: rrand(1,1.5), amp: hmny_blend*hmny_amp
    sleep 1.5
    play chord(note2, :m7)+[note2+15], release: rrand(2,2.5), amp: hmny_blend*hmny_amp
    sleep 3
  end
end

live_loop :main_melody do
  use_synth :piano
  with_fx :reverb, mix: 0.4, room: 1 do
    with_fx :bitcrusher, amp: mmelo_amp, sample_rate: 22000, bits: 4, mix: rrand(0.6,0.9)*bitmix do
      melody_note = choose(melo)
      if one_in(3)
        play [melody_note, melody_note+7+rrand_i(0,1)*5], attack: 0.02, release: 0.8
        sleep 0.75
      elsif one_in(2)
        play [melody_note, melody_note+7+rrand_i(0,1)*5], attack: 0.02, release: 0.5
        sleep 0.5
      else
        play [melody_note, melody_note+7+rrand_i(0,1)*5], attack: 0.02, release: 0.3
        sleep 0.25
      end
    end
  end
end

live_loop :sub_melody do
  use_synth :beep
  rhythm = [0, 0.5, 0.25, 0.5,0.25, 0.5, 0.25,0.5, 0.25, 0.5, 0.5]
  rhythm.shuffle
  loop   = 0
  with_fx :panslicer, mix: smelo_wet do
    11.times do
      play melo.shuffle.take(2), release: rrand(0.3, 0.8), amp: smelo_amp
      sleep rhythm[loop]
      loop+=1
      
    end
  end
end