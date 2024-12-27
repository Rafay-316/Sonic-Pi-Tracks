 Its a Me-Mario Theme Soundtrack

use_debug false
use_bpm 100
use_synth :pulse
use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6

define :structure do |i, a, b, c, d|
  i.call
  loop do
    2.times { a.call }
    2.times { b.call }
    c.call
    2.times { a.call }
    2.times { d.call }
    c.call
    d.call
  end
end

in_thread do
  intro = -> { play_pattern_timed([:e5,:e5,nil,:e5,nil,:c5,:e5,
                                   nil,:g5,nil,nil,nil,nil,nil,
                                   nil,nil], [0.25])}
  
  theme_a = -> {
    play_pattern_timed([:c5,nil,nil,:g4,nil,nil,:e4,nil,
                        nil,:a4,nil,:b4,nil,:Bb4,:a4,nil], [0.25])
    play_pattern_timed([:g4,:e5,:g5], [1/3.0])
    play_pattern_timed([:a5,nil,:f5,:g5,nil,:e5,nil,:c5,
                        :d5,:b4,nil,nil], [0.25]) }
  
  
  theme_b = -> {
    play_pattern_timed([nil,nil,:g5,:fs5,:f5,:ds5,nil,:e5,
                        nil,:gs4,:a4,:c5,nil,:a4,:c5,:d5,
                        nil,nil,:g5,:fs5,:f5,:ds5,nil,:e5,
                        nil,:c6,nil,:c6,:c6,nil,nil,nil,
                        nil,nil,:g5,:fs5,:f5,:ds5,nil,:e5,
                        nil,:gs4,:a4,:c5,nil,:a4,:c5,:d5,
                        nil,nil,:ds5,nil,nil,:d5,nil,nil,
                        :c5,nil,nil,nil,nil,nil,nil,nil], [0.25]) }
  
  theme_c = -> {
    play_pattern_timed([:c5,:c5,nil,:c5,nil,:c5,:d5,nil,
                        :e5,:c5,nil,:a4,:g4,nil,nil,nil,
                        :c5,:c5,nil,:c5,nil,:c5,:d5,:e5,
                        nil,nil,nil,nil,nil,nil,nil,nil,
                        :c5,:c5,nil,:c5,nil,:c5,:d5,nil,
                        :e5,:e5,nil,:a4,:g4,nil,nil,nil,
                        :e5,:e5,nil,:e5,nil,:c5,:e5,nil,
                        :g5,nil,nil,nil,nil,nil,nil,nil], [0.25]) }
  
  theme_d = -> {
    play_pattern_timed([:e5,:c5,nil,:g4,nil,nil,:gs4,nil,
                        :a4,:f5,nil,:f5,:a4,nil,nil,nil], [0.25])
    play_pattern_timed([:b4,:a5,:a5,
                        :a5,:g5,:f5], [1/3.0])
    play_pattern_timed([:e5,:c5,nil,:a4,:g4,nil,nil,nil], [0.25])
    play_pattern_timed([:e5,:c5,nil,:g4,nil,nil,:gs4,nil,
                        :a4,:f5,nil,:f5,:a4,nil,nil,nil,
                        :b4,:f5,nil,:f5], [0.25])
    play_pattern_timed([:f5,:e5,:d5], [1/3.0])
  play_pattern_timed([:g5,:e5,nil,:e5,:c5,nil,nil,nil], [0.25]) }
  
  
  
  structure(intro, theme_a, theme_b, theme_c, theme_d)
end

