#!/usr/bin/env nu

def main get_vol [] {
    (wpctl get-volume @DEFAULT_AUDIO_SINK@ | split column " " | get column2.0 | into float) * 100
}

def main set_vol [x: f64] {
    wpctl set-volume @DEFAULT_AUDIO_SINK@ ($x * 100)
}
