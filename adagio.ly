%
% Адажио
%

\score
{
<<
  \new ChordNames {
    \chordmode {

      g1:min | ees:min7 | g1:min | ees:min7 | 
      % --- (1) ---
      R1*13 |
      % --- (2) ---
      g1:min | c2:min9 d2:7 | c1:min6 | g2:min9 g2:min |
      g1:7 | c1:min | f1:7 | b1 | ees1 | c1:min | g2:min c2:min | g1:min | d1:7
      % --- (3) ---
      f1:min6 | c1:min | g1:min | aes1:min7 | g1:min | a1 | g1:min % 7
    }
  }

  \relative c'' 
  {
    \key a \minor
    \time 4/4
    \tempo 4 = 128
    \compressFullBarRests
    \override MultiMeasureRest.expand-limit = #3
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
    \numericTimeSignature % писать 4/4 цифрами, а не литерой "С"
    \improvisationOn


    b1 b1 b1 b1 

    % --- (1) ---
    \mark \markup \circle 1
    R1*13 \break

    % --- (2) ---
    \mark \markup \circle 2

    \repeat percent 12 { r8 a8 a[a] a[a] a4-> }
    % <>_\markup { \italic { etc. } }
    
    % --- (3) ---
    \mark \markup { \circle 3 }

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
    b2 d4 b4 | c2 r8 a8 e'8[c] | a2 r2 | c2 b2 | c4 d4 c2 
    
    
    \bar "|." 
  }
>>
}
\layout {
    %#(layout-set-staff-size 14)
    indent = #0
    %line-width = #150
    ragged-last = ##t
  }

\header {
    title = "Adagio"
    arranger = "V.A.Romanenko"
    subtitle = ""
    instrument = \markup \with-color #grey "Guitar"
    poet = ""
    piece = ""
    opus = ""
    copyright = "CC BY-NC. December 22, 2017"
    tagline = ##f
}

\version "2.18.2"
