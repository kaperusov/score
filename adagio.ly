melody = \relative c' {
  \key bes \major
  \time 4/4
  %\clef treble
  \compressFullBarRests
 % \textLengthOn

	\set fontSize = #1
	d1 d1 d1 d1 
	% --- (1) ---
	\set fontSize = #-2 <>_\markup \circle 1
	R1*13
	% --- (2) ---
	\set fontSize = #-2 <>_\markup \circle 2

	\repeat percent 12 { r8 d8 d[d] d[d] d4-> }% <>_\markup { \italic { etc. } }
	% --- (3) ---
	\set fontSize = #-2 <>_\markup { \circle 3 }
	d4 r4 r2 
	\repeat percent 7 { r8 d8 d[d] d[d] d4-> }% <>_\markup { \italic { etc. } }
	\bar "||"

	\key b \major
	\time 4/4
	\repeat percent 14 { r8 d8 d[d] d[d] d4-> }% <>_\markup { \italic { etc. } }
	\bar "||"

	\key c \major
	\time 4/4
	r4 e'4 d8[c] b8[a] | 
	a4 gis8[a] gis2 | % <--- a4. длительность???
	f'2 e8[d] c8[b] | b4 a8[b] a2~ | a2 r2 | d2 c4 c4 | 
	b2 d4 b4 | c2 r8 a8 e'8[c] | a2 r2 | c2 b2 | c4 d4 c2 |
	\bar "|."
}

text = \lyricmode {
	aaa-a-a--a--a
}

harmonies = \chordmode 
{
	g1:min | ees:min7 |	g1:min | ees:min7 | 
	% --- (1) ---
	R1*13 |
	% --- (2) ---
	g1:min | c2:min9 d2:7 | c1:min6 | g2:min9 g2:min |
	g1:7 | c1:min | f1:7 | b1 | ees1 | c1:min | g2:min c2:min | g1:min | d1:7
	% --- (3) ---
	f1:min6 | c1:min | g1:min | aes1:min7 | g1:min | a1 | g1:min % 7

}

\score {
  <<  
    \chords {
      \harmonies
    }
    \new Voice = "one" { 
      \set midiInstrument = #"flute"
      \melody
    }
    %\new Lyrics \lyricsto "one" \text
  >>
  \layout { }
  \midi {
    \context {
      \Staff
      \remove "Staff_performer"
    }
    \context {
      \Voice
      \consists "Staff_performer"      
    }
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 120 2)
    }
  }
}

\header {
  title = "Adagio"
  composer = "V.A.Romanenko"
  piece = "Adagio"
  copyright = "CC BY-NC. December 22, 2017"
}

\version "2.18.2"
