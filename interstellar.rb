#Interstellar Soundtrack   - Rafay Ch.


use_bpm 100


mela = (ring :e4, :c4).repeat(6) +
  (ring :a4, :c4, :e4, :c4, :e4, :c4, :b4) +
  (ring :d4, :e4).repeat(8) +
  (ring :d4)
melb = (ring :a4, :e5).repeat(2) +
  (ring :b4, :e5).repeat(2) +
  (ring :c5, :e5).repeat(2) +
  (ring :d5, :e5).repeat(2)
mel2 = (ring :a3, :b3, :c4, :b3, :a3, :b3, :c4, :b3)
mel3 = (ring :f2, :g2, :a2, :g2, :f2, :f2,
        :g2, :g2, :a2, :a2, :g2, :g2).repeat(2)


tta = ring(0.5)
ttb = (ring 1, 2).repeat(8)
t2 = ring(1, 1, 1, 1, 1, 1, 2, 2)
t3 = ring(3)


define :play_melody do |melody, times, synth, amp, cutoff, sustain, sleeps|
  times.times do
    melody.length.times do |i|
      use_synth synth
      play melody[i], amp: amp, attack: 0.1, cutoff: cutoff, sustain: sustain[i]
      sleep sleeps[i]
    end
  end
end


in_thread do
  play_melody(mela, 1, :piano, 0.3, 70, tta, tta)
end

in_thread do
  sleep 20
  play_melody(melb, 3, :prophet, 2, 60, ttb, ttb)
end

in_thread do
  sleep 10
  play_melody(mel2 + mel3, 2, :dsaw, 0.3, 70, t2 + t3, t2 + t3)
end


grid1 = [1, 0, 1, 0, 2, 0, 0, 1, 1, 0, 1, 0, 2, 0, 0, 0]
grid2 = [1, 0, 1, 0, 2, 0, 0, 1, 1, 2, 1, 0, 2, 0, 0, 0]

define :soul_beat do |grid|
  16.times do |index|
    sample :drum_heavy_kick, amp: 1.5 if grid[index] == 1
    sample :drum_snare_soft, amp: 1.2 if grid[index] == 2
    sleep 0.25
  end
end


live_loop :drum1 do
  soul_beat grid1
  soul_beat grid2
end

live_loop :hi_hat do
  sample :drum_cymbal_closed, amp: 0.6
  sleep 0.5
end


live_loop :filter_dynamics do
  with_fx :hpf, cutoff: 50 do
    sync :drum1
    with_fx :reverb, mix: 0.6, room: 0.8 do
      use_synth :dark_ambience
      play chord(:e3, :minor), release: 4, amp: 0.5
      sleep 4
    end
  end
end
