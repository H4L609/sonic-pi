# Welcome to Sonic Pi

live_loop :Basic do
  sample :bd_haus
  sleep 0.5
  sample :bd_chip, amp: 1, rate: 1
  sleep 0.5
  sample :bd_haus, amp: 1, rate: 2
  sleep 0.5
  sample :bd_chip, amp: 1, rate: 1
  sleep 0.5
end


