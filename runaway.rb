use_bpm 88  # Adjusted BPM closer to the original tempo

# Define the iconic piano motif
define :piano_motif do
  use_synth :piano
  use_synth_defaults release: 1.5, sustain: 1.5, amp: 0.8
  5.times do
    play :e6
    sleep 1.5
    sleep 0.5
  end
  play :e5
  sleep 2
  3.times do
    play :eb6
    sleep 1.5
    sleep 0.5
  end
  play :eb5
  sleep 2
  3.times do
    play :db6
    sleep 1.5
    sleep 0.5
  end
  play :db5
  sleep 2
  2.times do
    play :a5
    sleep 1.5
    sleep 0.5
  end
  play :ab5
  sleep 2
  play :e6
  sleep 2
end

# Main Piano Loop
live_loop :piano_loop do
  piano_motif
end

# Amen Break Drum Loop with Variations
live_loop :amen_break do
  sample :loop_amen, beat_stretch: 4, cutoff: 100, amp: 1.2
  sleep 4
  with_fx :reverb, room: 0.8 do
    sample :loop_amen, beat_stretch: 4, start: 0.5, finish: 1, cutoff: 90
  end
  sleep 4
end

# Bassline: Simple but impactful, mimicking the tonal shifts in "Runaway"
live_loop :bassline do
  use_synth :saw
  use_synth_defaults sustain: 4, release: 0.5, cutoff: 80, amp: 0.6
  play :b1
  sleep 4
  play :c2
  sleep 4
  play :g1
  sleep 4
  play :b1
  sleep 4
end

# Vocal Sampling Layer (requires external sample for Kanye’s vocal snippet)
live_loop :vocals do
  sync :amen_break
  sample "/path/to/your/vocal/snippet.wav", amp: 0.8, start: 0.1, finish: 0.9, release: 4 if one_in(4)
  sleep 8
end

# Added melodic layer for depth
live_loop :strings do
  use_synth :blade
  with_fx :slicer, phase: 0.25 do
    play_chord [:e4, :g4, :b4], release: 8, amp: 0.5
  end
  sleep 8
end

# Optional: Add Glitch Effects for Texture
live_loop :glitch do
  sync :amen_break
  with_fx :bitcrusher, bits: 6 do
    sample :glitch_bass_g, rate: 0.5, amp: 0.4 if one_in(8)
  end
  sleep 4
end
